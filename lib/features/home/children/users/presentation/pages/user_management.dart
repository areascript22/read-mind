import 'dart:async';
import 'package:client_app/core/common/enums/user_roles.dart';
import 'package:client_app/features/home/children/users/presentation/widgets/dialog_show_userinfo.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:client_app/features/home/children/users/presentation/bloc/user_manager_bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<UserManagerBloc>(),
      child: const _UserManagementPageBody(),
    );
  }
}

class _UserManagementPageBody extends StatefulWidget {
  const _UserManagementPageBody({super.key});

  @override
  State<_UserManagementPageBody> createState() =>
      _UserManagementPageBodyState();
}

class _UserManagementPageBodyState extends State<_UserManagementPageBody> {
  final RefreshController _refreshController = RefreshController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  String selectedFilter = 'Todos';
  List<UserEntity> currentUsers = [];
  bool isSearching = false;
  bool searchHasResults = true;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  String? _mapFilterToRole(String filter) {
    switch (filter) {
      case 'Estudiante':
        return UserRoles.student.name;
      case 'Profesor':
        return UserRoles.professor.name;
      case 'Administrador':
        return UserRoles.admin.name;
      default:
        return null;
    }
  }

  void _fetchUsers() {
    final role = _mapFilterToRole(selectedFilter);
    context.read<UserManagerBloc>().add(GetAllUsersEvent(1, 10, role ?? ''));
  }

  void _onRefresh() async {
    _fetchUsers();
    _refreshController.refreshCompleted();
  }

  void _onFilterSelected(String filter) {
    if (filter == selectedFilter) return;
    setState(() {
      selectedFilter = filter;
      _searchController.clear();
    });
    _fetchUsers();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      if (query.isEmpty) {
        _fetchUsers();
        return;
      }

      final role = _mapFilterToRole(selectedFilter);
      setState(() {
        isSearching = true;
      });

      // Simula un endpoint real que retorna lista de UserEntity según búsqueda
      context.read<UserManagerBloc>().add(
        SearchUsersEvent(query: query, role: role ?? ''),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Usuarios"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Buscar usuarios...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _buildChips(),
            const SizedBox(height: 12),

            Expanded(
              child: BlocConsumer<UserManagerBloc, UserManagerState>(
                listener: (context, state) {
                  if (state is UserManagerLoadedState) {
                    setState(() {
                      currentUsers = state.users;
                      isSearching = false;
                      searchHasResults = state.users.isNotEmpty;
                    });
                  } else if (state is UserManagerErrorState) {
                    setState(() {
                      isSearching = false;
                      searchHasResults = false;
                    });
                  }
                },
                builder: (context, state) {
                  if (state is UserManagerLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!searchHasResults) {
                    return const Center(
                      child: Text(
                        "No hay coincidencias",
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  if (currentUsers.isEmpty) {
                    return const Center(
                      child: Text("No hay usuarios disponibles"),
                    );
                  }

                  return SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    onRefresh: _onRefresh,
                    header: const WaterDropHeader(),
                    child: ListView.builder(
                      itemCount: currentUsers.length,
                      itemBuilder: (context, index) {
                        final user = currentUsers[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(user.name[0].toUpperCase()),
                            ),
                            title: Text(user.name),
                            subtitle: Text(user.role.name),
                            trailing: const Icon(Icons.more_vert),
                            onTap: () {
                              showUserInfoDialog(context, user);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildChips() {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            ['Todos', 'Estudiante', 'Profesor', 'Administrador']
                .map(
                  (filter) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(filter),
                      selected: selectedFilter == filter,
                      onSelected: (_) => _onFilterSelected(filter),
                      selectedColor: Colors.lightBlue,
                      labelStyle: TextStyle(
                        color:
                            selectedFilter == filter
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
