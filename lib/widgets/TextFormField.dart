import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextformfield extends StatelessWidget {
  final int maxLines;
  final double rightpadding;
  final double leftpadding;
  final String labeltext;
  final TextEditingController controller;
  final GlobalKey<FormState>? validation;
  const CustomTextformfield({
    super.key,
    required this.leftpadding,
    required this.rightpadding,
    required this.maxLines,
    required this.controller,
    this.validation,
    required this.labeltext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftpadding.w, right: rightpadding.w),
      child: Form(
        key: validation,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This filed required';
            }
          },
          style: TextStyle(fontSize: 25.sp, color: Colors.white),
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20.r),
            ),
            errorStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 91, 3, 3),
            ),
            filled: true,
            fillColor: const Color.fromARGB(87, 79, 79, 79),
            labelStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
            labelText: 'Task Title',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ),
      ),
    );
  }
}
