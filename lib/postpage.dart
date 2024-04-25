import 'package:clean_architecture/bloc/post_bloc.dart';
import 'package:clean_architecture/bloc/post_events.dart';
import 'bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatefulWidget {

  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    postbloc.add(PostFetchEvent());
    super.initState();
  }
  final PostBloc postbloc=PostBloc();
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<PostBloc,PostState>(
      bloc:postbloc,
      listener:(context,state)=>{},
      builder:(context,state){
        switch(state.runtimeType){
          case PostFetchLoadingState:
          return const Scaffold(
          body: Center(
            child: CircularProgressIndicator()
          )
          );
          case PostFetchSuccessfulState:
          final successstate=state as PostFetchSuccessfulState;
          return Scaffold(
      
        appBar: AppBar(
          title:const Text('Post Page'),
          centerTitle: true,),
        body:Center(
          child: Container(
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0), // Optional: Adds rounded corners
            ),
            child:DataTable(
            columns: const [
              DataColumn(label: Text('title')),
              DataColumn(label: Text('body')),

                
            ],
            
            rows: 
              successstate.data.map((post){
              return DataRow(cells:[
                DataCell(Text(post.title.toString())),
                DataCell(Text(post.body.toString())),
              ]);
            }).toList(),
            
            )
            
          ),
        ),      
      );
      default:
      return const SizedBox();
        }
      
      }
    );
  }
}