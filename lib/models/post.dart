import 'dart:convert';

class Post{
  
  final String title,body ;




  Post({required this.title, required this.body});

  Map<String, dynamic> toMap() {
    return {
      'title':title,
      'body':body
      
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}

  
