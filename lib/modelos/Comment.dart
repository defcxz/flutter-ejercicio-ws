class Comment {
  int? idComment;
  String? userName;
  String? commentary;
  int? idRoom;

  Comment({this.idComment, this.userName, this.commentary, this.idRoom});

  Comment.fromJson(Map<String, dynamic> json) {
    idComment = json['IdComment'];
    userName = json['UserName'];
    commentary = json['Commentary'];
    idRoom = json['IdRoom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdComment'] = this.idComment;
    data['UserName'] = this.userName;
    data['Commentary'] = this.commentary;
    data['IdRoom'] = this.idRoom;
    return data;
  }
}
