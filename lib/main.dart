import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectx/bloc_observer.dart';
import 'package:projectx/core/di/service_locator.dart';
import 'package:projectx/my_app.dart';

void main() {
  // Bloc observer
  Bloc.observer = MyBlocObserver();
  //dependency injection
  initServiceLocator();
  runApp(const MyApp());
}
