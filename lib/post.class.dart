class Post {
  final String name;
  final String email;
  final String message;

  Post({
   required this.name,
   required this.email,
   required this.message,
});

  factory Post.fromJSON(Map<String,dynamic> json) => Post(
      name: json['name'],
      email: json['email'],
      message: json['message']
  );
}