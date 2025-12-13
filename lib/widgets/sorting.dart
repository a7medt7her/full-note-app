import 'package:asw/bloc/taskk_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sorting extends StatelessWidget {
  const Sorting({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.sort),
      iconColor: Colors.white,
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(Sorting_A_to_Z_TaskEvent());
          },
          child: Text('A to Z', style: TextStyle(fontSize: 16.sp)),
        ),
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(Sorting_Z_to_A_TaskEvent());
          },
          child: Text('Z to A', style: TextStyle(fontSize: 16.sp)),
        ),
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(Sorting_by_new_TaskEvent());
          },
          child: Text('New', style: TextStyle(fontSize: 16.sp)),
        ),
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(Sorting_by_old_TaskEvent());
          },
          child: Text('Old', style: TextStyle(fontSize: 16.sp)),
        ),
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(Sorting_by_is_complet_TaskEvent());
          },
          child: Text('Completed', style: TextStyle(fontSize: 16.sp)),
        ),
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(Sorting_by_is_not_complet_TaskEvent());
          },
          child: Text('Not Completed', style: TextStyle(fontSize: 16.sp)),
        ),
        PopupMenuItem(
          onTap: () {
            context.read<TaskBloc>().add(LoadTaskkEvent());
          },
          child: Text('def', style: TextStyle(fontSize: 16.sp)),
        ),
      ],
    );
  }
}
