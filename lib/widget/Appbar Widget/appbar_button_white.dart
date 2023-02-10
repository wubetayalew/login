import 'package:flutter/material.dart';

class AppBarButtonWhite extends StatelessWidget {
  const AppBarButtonWhite({
    Key? key,
    required this.callback,
    required this.icon,
  }) : super(key: key);
  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
        child: OutlinedButton(
            onPressed: callback,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
              child: Icon(
                icon,
                size: 15,
                color: Colors.white,
              ),
            ),
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)))),
      ),
    );
  }
}
