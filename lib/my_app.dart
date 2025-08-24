import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/core/di/service_locator.dart';
import 'package:projectx/features/users/domain/repositories/user_repositories.dart';
import 'package:projectx/features/users/presentation/bloc/user/user_bloc.dart';
import 'package:projectx/features/users/presentation/ui/dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(userRepository:  sl<UserRepository>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}
