import 'package:flutter/material.dart';

class CustomChips extends StatelessWidget {
  final String? text;
  final int? val;
  const CustomChips({Key? key, this.text, this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[val ?? 100],
        border: Border.all(
          color: Colors.grey[400]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(text!, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: val != null ? Colors.white : Colors.black),)),
    );
  }
}
