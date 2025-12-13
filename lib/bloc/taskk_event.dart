part of 'taskk_bloc.dart';

sealed class TaskkEvent extends Equatable {
  const TaskkEvent();

  @override
  List<Object> get props => [];
}

final class LoadTaskkEvent extends TaskkEvent {
  const LoadTaskkEvent();

  @override
  List<Object> get props => [];
}

final class AddTaskkEvent extends TaskkEvent {
  final Taskmodel taskmodel;
  const AddTaskkEvent(this.taskmodel);

  @override
  List<Object> get props => [taskmodel];
}

final class RemoveTaskkEvent extends TaskkEvent {
  final int id;
  const RemoveTaskkEvent(this.id);

  @override
  List<Object> get props => [];
}

final class ToggelTaskkEvent extends TaskkEvent {
  final int id;
  const ToggelTaskkEvent(this.id);

  @override
  List<Object> get props => [];
}

final class editTaskkEvent extends TaskkEvent {
  final int id;
  final String newTitle;
  final String newDescription;
  const editTaskkEvent(this.id, this.newTitle, this.newDescription);

  @override
  List<Object> get props => [id];
}

final class searchTaskkEvent extends TaskkEvent {
  final String keyword;
  const searchTaskkEvent(this.keyword);

  @override
  List<Object> get props => [keyword];
}

final class Sorting_A_to_Z_TaskEvent extends TaskkEvent {}

final class Sorting_Z_to_A_TaskEvent extends TaskkEvent {}

final class Sorting_by_old_TaskEvent extends TaskkEvent {}

final class Sorting_by_new_TaskEvent extends TaskkEvent {}

final class Sorting_by_is_not_complet_TaskEvent extends TaskkEvent {}

final class Sorting_by_is_complet_TaskEvent extends TaskkEvent {}
