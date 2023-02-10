import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
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
                color: Color.fromARGB(167, 0, 0, 0),
              ),
            ),
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)))),
      ),
    );
  }
}
