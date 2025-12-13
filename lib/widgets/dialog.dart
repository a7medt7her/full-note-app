import 'package:asw/bloc/taskk_bloc.dart';
import 'package:asw/widgets/TextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.newtitlee,
    required this.newcont,
    required this.id1,
  });
  final int id1;
  final TextEditingController newtitlee;
  final TextEditingController newcont;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,

      title: Text('Edit Notes', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(210, 103, 103, 103),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Title',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextformfield(
            maxLines: 1,
            controller: newtitlee,
            labeltext: 'new title',
            leftpadding: 10.w,
            rightpadding: 10.w,
          ),
          SizedBox(height: 20.h),
          Text(
            'Enter Task Description',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(height: 10.h),
          CustomTextformfield(
            maxLines: 3,
            controller: newcont,
            labeltext: 'new Description',
            leftpadding: 10.w,
            rightpadding: 10.w,
          ),
          SizedBox(height: 50.h),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 254, 254),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  context.read<TaskBloc>().add(
                    editTaskkEvent(id1, newtitlee.text, newcont.text),
                  );
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
              SizedBox(width: 30.w),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 255, 254, 254),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
