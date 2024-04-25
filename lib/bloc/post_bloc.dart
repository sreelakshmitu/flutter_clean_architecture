import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture/bloc/post_events.dart';
import 'package:clean_architecture/bloc/post_state.dart';


class PostBloc extends Bloc<PostEvent,PostState>{
  PostBloc():super(PostInitialFetchState()){
    on<PostFetchEvent>(postfetchevent);
  }
  

  FutureOr<void> postfetchevent(PostFetchEvent event, Emitter<PostState> emit) {
    emit(PostInitialFetchState());
  }
}


