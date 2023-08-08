// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/bloc/internet_bloc.dart';
import 'package:internet_connectivity/bloc/internet_state.dart';
import 'package:internet_connectivity/screens/cubit_screen.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Bloc Testing",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetConnectedState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Internet Connected"),
                    backgroundColor: Colors.green,
                  ));
                } else if (state is InternetLostState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Internet Disconnected",
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, state) {
                if (state is InternetConnectedState) {
                  return Text("Connected");
                } else if (state is InternetLostState) {
                  return Text("Disconnected");
                } else {
                  return Text("Loading...");
                }
              },
            ),
            CupertinoButton(
                child: Text("Cubit Testing"),
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return CubitScreen();
                  }));
                })
          ],
        ),
      ),
    );
  }
}
