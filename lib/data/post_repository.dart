import 'dart:developer';

import 'package:clean_architecture/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PostRepo{

 static Future<List<Post>> getposts() async{

  List<Post> posts=[];


  try{
    var response=await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));

      List result=jsonDecode(response.body);
        
        for(int i =0; i<result.length;i++){
          
          Post post=Post.fromMap(result[i] as Map<String, dynamic>);
          posts.add(post);
        }
     
      return posts;
     
  }
  catch(e){

    log(e.toString());
    return[];

  }
  
}

  
}