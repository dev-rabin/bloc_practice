// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/cubits/internet_cubit.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Cubit Testing",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state == InternetState.Connected) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  ));
                } else if (state == InternetState.Lost) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Internet Disconnected",
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                if (state == InternetState.Connected) {
                  return Text("Connected");
                } else if (state == InternetState.Lost) {
                  return Text("Disconnected");
                } else {
                  return Text("Loading...");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
