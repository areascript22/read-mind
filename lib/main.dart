import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/config/init_global_config.dart';
import 'package:client_app/core/routing/app_router.dart';
import 'package:client_app/core/theme/themes.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGlobalConfig();
  await initDependencies();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AppUserCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Read Mind',
      theme: AppThemes.lightTheme,
    );
  }
}
