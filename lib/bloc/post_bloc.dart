import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture/bloc/post_events.dart';
import 'package:clean_architecture/bloc/post_state.dart';
import 'package:clean_architecture/data/post_repository.dart';
import 'package:clean_architecture/models/post.dart';


class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc():super(PostInitialFetchState()){
    on<PostFetchEvent>(postfetchevent);
  
  }
  

  FutureOr<void> postfetchevent(PostFetchEvent event, Emitter<PostState> emit) async{
    emit(PostFetchLoadingState());
    List<Post>post= await PostRepo.getposts();
    emit(PostFetchSuccessfulState(data:post));
  }
}


