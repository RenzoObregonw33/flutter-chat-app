import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const BotonAzul({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed != null
          ? () {
              this.onPressed!();
            }
          : null,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
      ),
      child: const Text(
        'Ingrese',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }
}
