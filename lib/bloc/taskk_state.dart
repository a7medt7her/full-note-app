part of 'taskk_bloc.dart';

sealed class TaskkState extends Equatable {
  final List<Taskmodel> tasks;
  const TaskkState(this.tasks);

  @override
  List<Object> get props => [tasks];
}

final class TaskkInitial extends TaskkState {
  TaskkInitial() : super([]);
}

final class TaskkLoaded extends TaskkState {
  TaskkLoaded(super.tasks);
}
