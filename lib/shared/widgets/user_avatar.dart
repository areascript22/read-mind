import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import '../../core/common/cubits/app_user/app_user_cubit.dart';

class UserAvatar extends StatelessWidget {
  final double radius;

  const UserAvatar({super.key, this.radius = 24});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppUserCubit, AppUserState>(
      builder: (context, state) {
        if (state is AppUserLoggedIn) {
          return _buildLoggedIn(context, state.userEntity);
        }

        if (state is AppUserFailure) {
          return _buildFailure(context, state.message);
        }

        return _buildGuest(context);
      },
    );
  }

  Widget _buildLoggedIn(BuildContext context, UserEntity user) {
    final initials = _getInitials(user);

    return Row(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.blue.shade600,
          child: Text(
            initials,
            style: TextStyle(
              fontSize: radius * 0.8,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.name} ${user.lastName}",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white70),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.email,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white60),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFailure(BuildContext context, String message) {
    return Row(
      children: [
        Icon(Icons.error, color: Colors.red, size: radius),
        const SizedBox(width: 8),
        Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildGuest(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey.shade300,
          child: Icon(Icons.person, size: radius, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Text("Guest", style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  String _getInitials(UserEntity user) {
    final first = user.name.isNotEmpty ? user.name[0] : '';
    final last = user.lastName.isNotEmpty ? user.lastName[0] : '';
    return (first + last).toUpperCase();
  }
}
