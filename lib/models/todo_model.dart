
class Todo {
  Todo({required this.title, required this.key});

  Todo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        key = json['key'];

  String title;
  String key;

  Map<String, dynamic> toJson() {
    return {'title': title, 'key': key};
  }
}
