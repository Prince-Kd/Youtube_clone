import 'package:flutter/material.dart';

class BottomTile extends StatelessWidget {
  final Widget? icon;
  final String? text;
  const BottomTile({Key? key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      enableFeedback: true,
      hoverColor: Colors.grey[200],
      leading: CircleAvatar(
        backgroundColor: Colors.grey[100],
        radius: 25,
        child: Center(child: icon,),
      ),
      title: Text(text!, style: const TextStyle(fontSize: 18)),
    );
  }
}
