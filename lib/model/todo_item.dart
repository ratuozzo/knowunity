class TodoItem {
  int? id;
  int? userId;
  String? title;
  bool completed = false;

  static const String _ID_KEY = "id";
  static const String _USER_ID_KEY = "userId";
  static const String _TITLE_KEY = "title";
  static const String _COMPLETED_KEY = "completed";

  TodoItem({
    this.id,
    this.userId,
    this.title,
    required this.completed,
  });

  TodoItem.fromJson(Map<String, dynamic> json) {
    id = json[_ID_KEY];
    userId = json[_USER_ID_KEY];
    title = json[_TITLE_KEY];
    completed = json[_COMPLETED_KEY];
  }

  Map<String, dynamic> toJson() {
    return {
      _ID_KEY: id,
      _USER_ID_KEY: userId,
      _TITLE_KEY: title,
      _COMPLETED_KEY: completed
    };
  }
}
