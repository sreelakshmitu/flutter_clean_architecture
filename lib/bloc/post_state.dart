import 'package:clean_architecture/models/post.dart';

abstract class PostState{}

class PostInitialFetchState extends PostState{}

class PostFetchLoadingState extends PostState{}

class PostFetchSuccessfulState extends PostState{
  
  final List<Post> data;

  PostFetchSuccessfulState({required this.data});
}

class PostFetchErrorState extends PostState{}