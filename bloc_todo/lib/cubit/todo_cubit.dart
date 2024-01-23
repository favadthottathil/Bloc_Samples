import 'package:bloc_todo/Model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(name: title, createdAt: DateTime.now());

    // state.add(todo);

    emit([
      ...state,
      todo
    ]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);

    print('todoCubit - $change');
  }
}
