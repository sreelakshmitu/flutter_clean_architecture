import 'package:clean_architecture/bloc/post_bloc.dart';
import 'package:clean_architecture/postpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    final PostBloc postbloc=PostBloc();
    return BlocProvider(
      create: (context) => postbloc,
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: PostPage(),
      ),
    );
  }
}

