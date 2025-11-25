import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../../../init_dependencies.dart';
import '../../domain/entity/notification_entity.dart';
import '../bloc/notifications_bloc/notifications_bloc.dart';

class NotificationHistoryPage extends StatelessWidget {
  const NotificationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<NotificationsBloc>(),
      child: const NotificationHistoryView(),
    );
  }
}

class NotificationHistoryView extends StatefulWidget {
  const NotificationHistoryView({super.key});

  @override
  State<NotificationHistoryView> createState() =>
      _NotificationHistoryViewState();
}

class _NotificationHistoryViewState extends State<NotificationHistoryView> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    context.read<NotificationsBloc>().add(NotificationGetAll());
    context.read<NotificationsBloc>().add(NotificationMarkAllAsRead());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        automaticallyImplyLeading: false,
        leading: BlocBuilder<NotificationsBloc, NotificationsState>(
          builder: (context, state) {
            if (state.isMarkingAllAsRead) {
              return LoaderIndicator(spinnerColor: Colors.red);
            }
            if (state.markedAllAsRead) {
              return Icon(Icons.check);
            }
            return SizedBox.shrink();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: BlocConsumer<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
          if (state.notificationsLoaded || state.errorMessageGetAll != null) {
            _refreshController.refreshCompleted();
          }
        },
        builder: (context, state) {
          if (state.isLoadingList) {
            return const Center(child: LoaderIndicator());
          }

          if (state.errorMessageGetAll != null) {
            return Center(child: Text("Error: ${state.errorMessageGetAll}"));
          }
          if (state.notificationsLoaded && state.notifications.isEmpty) {
            return Center(child: Text("Aun no tienes notificaciónes..."));
          }

          if (state.notificationsLoaded) {
            final notifications = state.notifications;

            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              header: const WaterDropHeader(),
              onRefresh: () {
                context.read<NotificationsBloc>().add(NotificationGetAll());
              },
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return _notificationTile(notification);
                },
              ),
            );
          }

          return const SizedBox(child: Text("No state"));
        },
      ),
    );
  }

  Widget _notificationTile(NotificationEntity notification) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Icon(
        notification.read ? Icons.notifications : Icons.notifications_active,
        color: notification.read ? Colors.grey : Colors.blue,
        size: 28,
      ),
      title: Text(
        notification.title,
        style: TextStyle(
          fontWeight: notification.read ? FontWeight.normal : FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.message),
          const SizedBox(height: 4),
          Text(
            _formattedDate(notification.sentAt),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      onTap: () {
        // Handle markAsRead or navigation later
      },
    );
  }

  String _formattedDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} "
        "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }
}
