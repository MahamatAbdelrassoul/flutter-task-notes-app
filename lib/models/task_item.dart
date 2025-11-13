class TaskItem {
  int? id;
  String title;
  String priority;
  String description;
  bool isCompleted;

  TaskItem({
    this.id,
    required this.title,
    required this.priority,
    required this.description,
    this.isCompleted = false,
  });

  // Convert TaskItem to Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'priority': priority,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Create TaskItem from Map
  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      id: json['id'],
      title: json['title'],
      priority: json['priority'],
      description: json['description'],
      isCompleted: json['isCompleted'] == 1,
    );
  }
}