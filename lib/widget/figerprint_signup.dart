import 'package:flutter/material.dart';

class FingerprintSignup extends StatelessWidget {
  const FingerprintSignup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(12),
      children: [
        SizedBox(
          width: 500,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))),
              const Icon(
                Icons.check_circle,
                size: 40,
                color: Colors.green,
              ),
              const Center(
                child: Text(
                  "Fingerprint Autentication",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Center(
                child: Text("Please use your finger print to Signup",
                    style: TextStyle(
                        fontSize: 12, color: Color.fromARGB(132, 0, 0, 0))),
              ),
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.fingerprint,
                size: 120,
                color: Colors.orange,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
