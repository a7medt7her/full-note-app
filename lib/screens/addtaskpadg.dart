import 'dart:math';
import 'dart:ui';
import 'package:asw/bloc/taskk_bloc.dart';
import 'package:asw/models/taskmodel.dart';
import 'package:asw/widgets/TextFormField.dart';
import 'package:asw/widgets/radiobuttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addtaskpadg extends StatefulWidget {
  Addtaskpadg({super.key});

  @override
  State<Addtaskpadg> createState() => _AddtaskpadgState();
}

class _AddtaskpadgState extends State<Addtaskpadg> {
  final TextEditingController title = TextEditingController();
  final GlobalKey<FormState> istitle = GlobalKey();
  final GlobalKey<FormState> isdec = GlobalKey();
  final TextEditingController desc = TextEditingController();
  late String selecteddColor = 'deff';
  @override
  Widget build(BuildContext context) {
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
          child: Container(
            color: Colors.black.withOpacity(0.3), // اللون مع شفافية
          ),
        ),
        Scaffold(
          backgroundColor: const Color.fromARGB(2, 0, 0, 0),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            centerTitle: true,
            title: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Text(
                    'Enter Task title',
                    style: TextStyle(fontSize: 30.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextformfield(
                  maxLines: 1,
                  controller: title,
                  validation: istitle,
                  labeltext: 'Enter Task Description',
                  leftpadding: 40.w,
                  rightpadding: 40.w,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 50.w),
                  child: Text(
                    'Enter Task Description',
                    style: TextStyle(fontSize: 30.sp, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextformfield(
                  maxLines: 5,
                  controller: desc,
                  validation: isdec,
                  labeltext: 'enter title',
                  leftpadding: 40.w,
                  rightpadding: 40.w,
                ),
                SizedBox(height: 20.h),

                Column(
                  children: [
                    Radiobuttom(
                      selectedColor: selecteddColor,
                      onChanged: (val) {
                        setState(() {
                          selecteddColor = val;
                        });
                      },
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          'red',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          'green',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          'blue',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          'deff',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        SizedBox(width: 25.w),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(97, 7, 219, 39),
                            ),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 20),
                            ),
                          ),
                          onPressed: () {
                            print(selecteddColor);
                            if (istitle.currentState!.validate() &&
                                isdec.currentState!.validate()) {
                              if (selecteddColor == 'deff') {
                                context.read<TaskBloc>().add(
                                  AddTaskkEvent(
                                    Taskmodel(
                                      id: Random().nextInt(100000),
                                      title: title.text,
                                      description: desc.text,
                                      isCompleted: false,
                                      date: DateTime.now().toString(),
                                      taskcolor: const Color.fromARGB(
                                        163,
                                        80,
                                        80,
                                        80,
                                      ).toARGB32(),
                                    ),
                                  ),
                                );
                              } else if (selecteddColor == 'green') {
                                context.read<TaskBloc>().add(
                                  AddTaskkEvent(
                                    Taskmodel(
                                      id: Random().nextInt(100000),
                                      title: title.text,
                                      description: desc.text,
                                      isCompleted: false,
                                      date: DateTime.now().toString(),
                                      taskcolor: const Color.fromARGB(
                                        177,
                                        49,
                                        154,
                                        52,
                                      ).toARGB32(),
                                    ),
                                  ),
                                );
                              } else if (selecteddColor == 'red') {
                                context.read<TaskBloc>().add(
                                  AddTaskkEvent(
                                    Taskmodel(
                                      id: Random().nextInt(100000),
                                      title: title.text,
                                      description: desc.text,
                                      isCompleted: false,
                                      date: DateTime.now().toString(),
                                      taskcolor: const Color.fromARGB(
                                        193,
                                        194,
                                        115,
                                        109,
                                      ).toARGB32(),
                                    ),
                                  ),
                                );
                              } else if (selecteddColor == 'blue') {
                                context.read<TaskBloc>().add(
                                  AddTaskkEvent(
                                    Taskmodel(
                                      id: Random().nextInt(100000),
                                      title: title.text,
                                      description: desc.text,
                                      isCompleted: false,
                                      date: DateTime.now().toString(),
                                      taskcolor: const Color.fromARGB(
                                        176,
                                        106,
                                        154,
                                        194,
                                      ).toARGB32(),
                                    ),
                                  ),
                                );
                              }
                              Navigator.pop(context, selecteddColor);
                            }
                          },
                          child: Text(
                            'Add Task',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 80.w),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(137, 0, 0, 0),
                            ),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 25.sp),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
