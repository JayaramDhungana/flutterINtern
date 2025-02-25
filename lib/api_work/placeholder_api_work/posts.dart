class Posts {
  final int? userid;
  final int? id;
  final String? title;
  final String? body;

  Posts({
    required this.userid,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      userid: json['userid'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
