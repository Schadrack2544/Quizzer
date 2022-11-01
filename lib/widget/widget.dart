import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
            fontSize: 32
        ),
        children: <TextSpan>[
          TextSpan(text: 'Quiz', style: TextStyle(fontWeight: FontWeight.w600
              , color: Colors.black54)),
          TextSpan(text: 'zer', style: TextStyle(fontWeight: FontWeight.w600
              , color: Colors.redAccent)),
        ],
      ),
    );
  }
}
