import 'dart:ui';

import 'package:asw/bloc/taskk_bloc.dart';

import 'package:asw/screens/addtaskpadg.dart';
import 'package:asw/widgets/appbar.dart';
import 'package:asw/widgets/dialog.dart';
import 'package:asw/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskBloc>(context).add(LoadTaskkEvent());
  }

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  final Color white = Colors.white;

  bool chek = true;

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/b.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withOpacity(0.3)),
        ),
        Scaffold(
          backgroundColor: Color.fromARGB(140, 41, 41, 41),
          appBar: chek
              ? Appbarn(
                  check: (val) {
                    setState(() {
                      chek = val;
                    });
                  },
                  issearche: chek,
                )
              : SearchAppbar(
                  check: (val) {
                    setState(() {
                      chek = val;
                    });
                  },
                  issearche: chek,
                ),
          body: Column(
            children: [
              Expanded(
                child: BlocBuilder<TaskBloc, TaskkState>(
                  builder: (context, state) {
                    final task = state.tasks;

                    if (state is TaskkLoaded) {
                      return ListView.builder(
                        itemCount: task.length,
                        itemBuilder: (context, index) {
                          final TextEditingController newtitlee = title;
                          final TextEditingController newcont = desc;
                          final t = task[index];
                          String titles = t.title;
                          String dec = t.description;

                          return Container(
                            margin: EdgeInsets.only(
                              top: 20.h,
                              left: 10.w,
                              right: 10.w,
                              bottom: 20.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(
                                t.taskcolor ??
                                    Color.fromARGB(255, 155, 18, 18).toARGB32(),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(30.r),
                                bottomLeft: Radius.circular(30.r),
                                bottomRight: Radius.circular(10.r),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                bottom: 15.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20.h),
                                  Text(
                                    titles,
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 30.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    dec,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: white,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    'Date: ${t.date ?? 'No Date'}',
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 16.sp,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: Colors.green,
                                        checkColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                        side: BorderSide(
                                          width: 3.w,
                                          color: Color.fromARGB(
                                            255,
                                            199,
                                            195,
                                            195,
                                          ),
                                        ),
                                        value: t.isCompleted,
                                        onChanged: (value) {
                                          context.read<TaskBloc>().add(
                                            ToggelTaskkEvent(t.id),
                                          );
                                        },
                                      ),
                                      Text(
                                        'Completed',
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(flex: 50),
                                      IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 24.sp,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => CustomDialog(
                                              newtitlee: newtitlee,
                                              newcont: newcont,
                                              id1: t.id,
                                            ),
                                          );
                                        },
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 24.sp,
                                        ),
                                        onPressed: () {
                                          context.read<TaskBloc>().add(
                                            RemoveTaskkEvent(t.id),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No Tasks Added Yet',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addtaskpadg()),
              );
            },
            child: Icon(Icons.add, size: 28.sp),
          ),
        ),
      ],
    );
  }
}
