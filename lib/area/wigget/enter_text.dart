import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class enter_text extends StatelessWidget {
  const enter_text({
    Key? key,
    required this.plantController,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController plantController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: plantController,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 12,
        ),
        fillColor: txtg,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
