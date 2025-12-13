import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Radiobuttom extends StatefulWidget {
  final String selectedColor;
  final Function(String) onChanged;

  const Radiobuttom({
    super.key,
    required this.selectedColor,
    required this.onChanged,
  });

  @override
  State<Radiobuttom> createState() => _RadiobuttomState();
}

class _RadiobuttomState extends State<Radiobuttom> {
  late String selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          side: BorderSide(color: Colors.white),
          activeColor: Colors.redAccent,
          value: 'red',
          groupValue: selectedColor,
          onChanged: (value) {
            setState(() {
              selectedColor = value ?? 'red';
            });
            widget.onChanged(selectedColor);
            print(selectedColor);
          },
        ),
        SizedBox(width: 12.w),
        Radio(
          side: BorderSide(color: Colors.white),
          activeColor: Colors.greenAccent,
          value: 'green',
          groupValue: selectedColor,
          onChanged: (value) {
            setState(() {
              selectedColor = value ?? 'green';
            });
            widget.onChanged(selectedColor);
            print(selectedColor);
          },
        ),
        SizedBox(width: 12.w),
        Radio(
          side: BorderSide(color: Colors.white),
          value: 'blue',
          activeColor: const Color.fromARGB(255, 24, 52, 213),
          groupValue: selectedColor,
          onChanged: (value) {
            setState(() {
              selectedColor = value ?? 'blue';
            });
            widget.onChanged(selectedColor);
            print(selectedColor);
          },
        ),
        SizedBox(width: 12.w),
        Radio(
          side: BorderSide(color: Colors.white),
          activeColor: const Color.fromARGB(255, 21, 21, 21),
          value: 'deff',
          groupValue: selectedColor,
          onChanged: (value) {
            setState(() {
              selectedColor = value ?? 'deff';
            });
            widget.onChanged(selectedColor);
            print(selectedColor);
          },
        ),
      ],
    );
  }
}
