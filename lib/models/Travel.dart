class Travel{

  String title;
  String photo;
  String date;
  String content;
  List<dynamic> comments;

  Travel({this.title, this.photo, this.date, this.content, this.comments});

  factory Travel.fromJson(Map<String, dynamic> json) => new Travel (
    title: json['title'],
    photo: json['photo'],
    date: json['date'],
    content: json['content'],
    comments: json['comments']
  );

}


class Comments{
  String comment;

  Comments({this.comment});

  factory Comments.fromJson(Map<String, dynamic> json) => new Comments (
    comment: json['comment']
  );
}