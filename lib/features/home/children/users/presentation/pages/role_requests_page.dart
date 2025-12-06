import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../domain/entity/composed_request_entity.dart';
import '../../presentation/bloc/user_manager_bloc.dart';

class RoleRequestsPage extends StatelessWidget {
  const RoleRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<UserManagerBloc>(),

      child: const RoleRequestsContent(),
    );
  }
}

class RoleRequestsContent extends StatefulWidget {
  const RoleRequestsContent({super.key});

  @override
  State<RoleRequestsContent> createState() => _RoleRequestsContentState();
}

class _RoleRequestsContentState extends State<RoleRequestsContent> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<UserManagerBloc>().add(GetAllRoleRequestsEvent());
  }

  void _onRefresh() {
    context.read<UserManagerBloc>().add(GetAllRoleRequestsEvent());
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitudes de Rol'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<UserManagerBloc, UserManagerState>(
        listener: (context, state) {
          if (state is UserManagerErrorState &&
              state.action == UserManagerAction.roleRequests) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserManagerLoadingState &&
              state.action == UserManagerAction.roleRequests) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is RoleRequestsLoaded) {
            final requests = state.roleRequests;

            if (requests.isEmpty) {
              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: const ClassicHeader(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No hay solicitudes pendientes',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: const ClassicHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  return RoleRequestTile(
                    request: requests[index],
                    onGrant: () => _handleAction(requests[index], true),
                    onDeny: () => _handleAction(requests[index], false),
                  );
                },
              ),
            );
          }

          if (state is UserManagerErrorState &&
              state.action == UserManagerAction.roleRequests) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:
                        () => context.read<UserManagerBloc>().add(
                          GetAllRoleRequestsEvent(),
                        ),
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _handleAction(ComposedRequestEntity request, bool isGranted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isGranted
              ? 'Solicitud aprobada para ${request.userEntity.name}'
              : 'Solicitud denegada para ${request.userEntity.name}',
        ),
        backgroundColor: isGranted ? Colors.green : Colors.orange,
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }
}

class RoleRequestTile extends StatelessWidget {
  final ComposedRequestEntity request;
  final VoidCallback onGrant;
  final VoidCallback onDeny;

  const RoleRequestTile({
    super.key,
    required this.request,
    required this.onGrant,
    required this.onDeny,
  });

  @override
  Widget build(BuildContext context) {
    final user = request.userEntity;
    final roleRequest = request.roleRequestEntity;
    final requestedRole = request.roleEntity;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    '${user.name[0]}${user.lastName[0]}'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.name} ${user.lastName}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.grey[300], height: 1),
            const SizedBox(height: 12),
            _buildDetailRow('Rol Actual', user.role.name, Icons.person),
            const SizedBox(height: 8),
            _buildDetailRow(
              'Rol Solicitado',
              requestedRole.name,
              Icons.upgrade,
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              'Estado',
              roleRequest.status.name,
              Icons.add,
              statusColor: _getStatusColor(roleRequest.status.name),
            ),
            const SizedBox(height: 8),
            _buildDetailRow(
              'Solicitado el',
              _formatDate(roleRequest.createdAt),
              Icons.calendar_today,
            ),
            const SizedBox(height: 16),
            if (roleRequest.status.name.toLowerCase() == 'pending')
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onDeny,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.close, size: 18),
                          SizedBox(width: 4),
                          Text('Denegar'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onGrant,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, size: 18),
                          SizedBox(width: 4),
                          Text('Conceder'),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(
                    roleRequest.status.name,
                  ).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Procesado: ${roleRequest.status.name}',
                  style: TextStyle(
                    color: _getStatusColor(roleRequest.status.name),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String title,
    String value,
    IconData icon, {
    Color? statusColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(
          '$title: ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: statusColor ?? Colors.grey[800],
              fontWeight:
                  statusColor != null ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'granted':
        return Colors.green;
      case 'denied':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
