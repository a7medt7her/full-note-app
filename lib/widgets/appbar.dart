import 'package:asw/widgets/sorting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbarn extends StatefulWidget implements PreferredSizeWidget {
  const Appbarn({super.key, required this.check, required this.issearche});
  final Function(bool) check;
  final bool issearche;
  @override
  State<Appbarn> createState() => _AppbarnState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarnState extends State<Appbarn> {
  late bool issearche;
  @override
  void initState() {
    super.initState();
    issearche = widget.issearche;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: IconButton(
          iconSize: 30.sp,
          onPressed: () {
            setState(() {
              issearche = !issearche;
            });
            widget.check(issearche);
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 30.w),
          child: Sorting(),
        ),
      ],
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      centerTitle: true,
      title: Text(
        'Note App',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
