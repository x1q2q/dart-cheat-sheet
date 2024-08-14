abstract interface class TaskComponent {
  String get name;
  int get estimatedTime;
  void addSubtask(TaskComponent task);
  void removeSubtask(TaskComponent task);
  List<TaskComponent> getSubtasks();
  void display([String indent = '']);
}

class Task implements TaskComponent {
  final String _name;

  final int _estimatedTime;

  const Task(String name, int estimatedTime)
      : _name = name,
        _estimatedTime = estimatedTime;

  @override
  String get name => _name;

  @override
  int get estimatedTime => _estimatedTime;

  @override
  void addSubtask(TaskComponent task) {
    throw UnsupportedError('Cannot add subtask to a Task');
  }

  @override
  void removeSubtask(TaskComponent task) {
    throw UnsupportedError('Cannot remove subtask from a Task');
  }

  @override
  List<TaskComponent> getSubtasks() => [];

  @override
  void display([String indent = '']) {
    print('$indent- $name (${estimatedTime}h)');
  }
}

class TaskGroup implements TaskComponent {
  final String _name;
  final List<TaskComponent> _subtasks = [];

  TaskGroup(String name) : _name = name;

  @override
  String get name => _name;

  @override
  int get estimatedTime {
    return _subtasks.fold(0, (sum, task) => sum + task.estimatedTime);
  }

  @override
  void addSubtask(TaskComponent task) {
    _subtasks.add(task);
  }

  @override
  void removeSubtask(TaskComponent task) {
    _subtasks.remove(task);
  }

  @override
  List<TaskComponent> getSubtasks() => List.unmodifiable(_subtasks);

  @override
  void display([String indent = '']) {
    print('$indent+ $name (${estimatedTime} h)');
    for (var subtask in _subtasks) {
      subtask.display('$indent  ');
    }
  }
}