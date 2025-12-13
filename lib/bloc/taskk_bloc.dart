import 'package:asw/models/taskmodel.dart';
import 'package:asw/main.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'taskk_event.dart';
part 'taskk_state.dart';

class TaskBloc extends Bloc<TaskkEvent, TaskkState> {
  TaskBloc() : super(TaskkInitial()) {
    List<Taskmodel> getAllTasks() =>
        box.values.map((e) => e as Taskmodel).toList();
    on<LoadTaskkEvent>((event, emit) {
      final tasks = getAllTasks();
      if (tasks.isEmpty) {
        emit(TaskkInitial());
        return;
      }
      emit(TaskkLoaded(tasks));
    });
    on<AddTaskkEvent>((event, emit) {
      final Taskmodel newtask = event.taskmodel.copyWith(
        id: DateTime.now().millisecondsSinceEpoch.toInt(),
      );
      box.add(newtask);
      emit(TaskkLoaded(getAllTasks()));
    });
    on<RemoveTaskkEvent>((event, emit) {
      final index = box.values.toList().indexWhere((t) => t.id == event.id);
      if (index != -1) box.deleteAt(index);
      emit(TaskkLoaded(getAllTasks()));
    });
    on<editTaskkEvent>((event, emit) {
      final index = box.values.toList().indexWhere((t) => t.id == event.id);
      if (index == -1) return;
      final oldtask = box.getAt(index) as Taskmodel;
      final newtask = oldtask.copyWith(
        title: event.newTitle,
        description: event.newDescription,
        date: oldtask.date,
      );
      box.putAt(index, newtask);
      emit(TaskkLoaded(getAllTasks()));
    });
    on<ToggelTaskkEvent>((event, emit) {
      final index = box.values.toList().indexWhere((t) => t.id == event.id);
      if (index == -1) return;
      final oldtask = box.getAt(index) as Taskmodel;
      final newtask = oldtask.copyWith(isCompleted: !oldtask.isCompleted);
      box.putAt(index, newtask);
      emit(TaskkLoaded(getAllTasks()));
    });
    on<searchTaskkEvent>((event, emit) {
      final filtered = getAllTasks()
          .where(
            (t) =>
                t.title.toLowerCase().startsWith(event.keyword.toLowerCase()),
          )
          .toList();
      emit(TaskkLoaded(filtered));
    });
    on<Sorting_A_to_Z_TaskEvent>((event, emit) {
      final List<Taskmodel> Stortlest = getAllTasks()
        ..sort((a, b) => a.title.compareTo(b.title));
      emit(TaskkLoaded(Stortlest));
    });
    on<Sorting_Z_to_A_TaskEvent>((event, emit) {
      final List<Taskmodel> z_a = getAllTasks()
        ..sort((a, b) => b.title.compareTo(a.title));
      emit(TaskkLoaded(z_a));
    });
    on<Sorting_by_new_TaskEvent>((event, emit) {
      final List<Taskmodel> newest = getAllTasks()
        ..sort(
          (a, b) => DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)),
        );
      emit(TaskkLoaded(newest));
    });
    on<Sorting_by_old_TaskEvent>((event, emit) {
      final List<Taskmodel> oldest = getAllTasks()
        ..sort(
          (a, b) => DateTime.parse(a.date!).compareTo(DateTime.parse(b.date!)),
        );
      emit(TaskkLoaded(oldest));
    });
    on<Sorting_by_is_not_complet_TaskEvent>((event, emit) {
      final List<Taskmodel> notcombleted = getAllTasks()
        ..sort(
          (a, b) =>
              a.isCompleted.toString().compareTo(b.isCompleted.toString()),
        );
      emit(TaskkLoaded(notcombleted));
    });
    on<Sorting_by_is_complet_TaskEvent>((event, emit) {
      final List<Taskmodel> combleted = getAllTasks()
        ..sort(
          (a, b) =>
              b.isCompleted.toString().compareTo(a.isCompleted.toString()),
        );
      emit(TaskkLoaded(combleted));
    });
  }
}
