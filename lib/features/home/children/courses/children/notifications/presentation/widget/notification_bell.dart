import 'package:badges/badges.dart' as badges;
import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/notifications_bloc/notifications_bloc.dart';

class NotificationBell extends StatefulWidget {
  const NotificationBell({super.key});

  @override
  _NotificationBellState createState() => _NotificationBellState();
}

class _NotificationBellState extends State<NotificationBell> {
  late BuildContext contextDispose;
  late int userId;
  @override
  void initState() {
    super.initState();
    contextDispose = context;
    userId = context.read<AppUserCubit>().user?.id ?? -1;
    context.read<NotificationsBloc>().add(
      NotificationInitSocket(userId: userId),
    );
    context.read<NotificationsBloc>().add(NotificationGetUnreadCount());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        int unreadCount = 0;

        if (state.unreadCount != 0) {
          unreadCount = state.unreadCount;
        }

        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: -5, end: -5),
          badgeContent: Text(
            unreadCount > 99 ? '99+' : unreadCount.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          showBadge: unreadCount != 0,
          badgeStyle: badges.BadgeStyle(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(5),
            borderRadius: BorderRadius.circular(8),
            elevation: 2,
          ),
          child: IconButton(
            icon: Icon(Icons.notifications, size: 28),
            onPressed:
                () =>
                    context.push(RouteNames.notificationHistory).then((value) {
                      if (context.mounted) {
                        context.read<NotificationsBloc>().add(
                          NotificationGetUnreadCount(),
                        );
                      }
                    }),
          ),
        );
      },
    );
  }
}
