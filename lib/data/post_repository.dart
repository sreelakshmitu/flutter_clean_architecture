import 'dart:developer';

import 'package:clean_architecture/models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PostRepo{

static Future<List<Post>> getposts() async{


  try{
    var response=await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));

    if(response.statusCode==200){
      
      Iterable<dynamic>data =jsonDecode(response.body);

      return data.map((e)=>Post(id: e['id'], title: e['title'], body: e['body'])).toList();



    }
    else{
      throw Exception('Failed to fetch posts');
    }
  }
  catch(e){

    log(e.toString());
    return[];

  }
  
}

  
}