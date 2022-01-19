import 'package:flutter/material.dart';

class LibraryTile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? icon;
  final Color? color;
  const LibraryTile(
      {Key? key, this.title, this.subTitle, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(child: icon!),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  child: Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 17,
                        color: color ??
                            Theme.of(context).textTheme.bodyText1!.color,
                        fontWeight: FontWeight.w300),
                  )),
              subTitle != null
                  ? Text(
                      subTitle!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
