import 'package:flutter/material.dart';

class SubAvatar extends StatelessWidget {
  int index;
  String name;
  SubAvatar({Key? key, required this.index, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/vids/${index+1}.jpeg'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 5),
            child: Text(name, overflow: TextOverflow.ellipsis, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontSize: 14 ),),
          )
        ],
      ),
    );
  }
}
