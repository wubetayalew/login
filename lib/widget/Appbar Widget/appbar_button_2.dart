import 'package:flutter/material.dart';

class AppBarButton2 extends StatelessWidget {
  const AppBarButton2({
    Key? key,
    required this.callback,
    required this.icon,
  }) : super(key: key);
  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: OutlinedButton(
          onPressed: callback,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
            child: Icon(
              icon,
              size: 17,
              color: Color.fromARGB(167, 0, 0, 0),
            ),
          ),
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)))),
    );
  }
}
