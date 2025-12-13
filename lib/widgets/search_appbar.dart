import 'package:asw/bloc/taskk_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppbar({super.key, required this.check, required this.issearche});
  final Function(bool) check;
  final bool issearche;
  @override
  State<SearchAppbar> createState() => _SearchAppbarState();

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchAppbarState extends State<SearchAppbar> {
  late bool issearche = false;
  @override
  void initState() {
    super.initState();
    issearche = widget.issearche;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        SizedBox(
          width: 300.w,
          child: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: TextFormField(
              onChanged: (value) {
                context.read<TaskBloc>().add(searchTaskkEvent(value));
              },
              style: TextStyle(
                fontSize: 20.sp,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 181, 167, 167),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'search',
                labelStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        IconButton(
          iconSize: 30.sp,
          onPressed: () {
            setState(() {
              issearche = !issearche;
            });
            widget.check(issearche);
          },
          icon: Icon(Icons.cancel, color: Colors.white),
        ),
      ],
      backgroundColor: const Color.fromARGB(68, 41, 41, 41),
    );
  }
}
