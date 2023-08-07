// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/bloc/internet_bloc.dart';
import 'package:internet_connectivity/screens/home_screen.dart';

void main(List<String> args) {
  runApp(ConnectivityApp());
}

class ConnectivityApp extends StatelessWidget {
  const ConnectivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
