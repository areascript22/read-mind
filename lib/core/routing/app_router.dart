import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/pages/auth_wrapper.dart';
import 'package:client_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:client_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:client_app/features/auth/presentation/pages/splash_screen.dart';
import 'package:client_app/features/home/presentation/pages/home_page.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: RouteNames.splashScreen,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider.value(
            value: serviceLocator<AuthBloc>(),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: RouteNames.splashScreen,
            builder: (context, state) => SplashScreen(),
          ),
          GoRoute(
            path: RouteNames.authWrapper,
            builder: (context, state) => AuthWrapper(),
          ),
          GoRoute(
            path: RouteNames.signIn,
            builder: (context, state) => SignInPage(),
          ),
          GoRoute(
            path: RouteNames.signUp,
            builder: (context, state) => SignUpPage(),
          ),
        ],
      ),
      GoRoute(path: RouteNames.home, builder: (context, state) => HomePage()),
    ],
  );
}
