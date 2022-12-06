import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProfilePicture extends StatefulWidget {
  final String picture;
  final Color? color;
  final String id;
  const ProfilePicture(
      {Key? key, required this.picture, this.color, required this.id})
      : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      child: Padding(
          padding: const EdgeInsets.all(1.5), // Border radius
          child: ClipOval(child: getImage())),
    );
  }

  Widget getImage() {
    String id = widget.id;
    String pngPath = "assets/png/";
    if (id.isNotEmpty) {
      if (id == "1" ||
          id == "2" ||
          id == "3" ||
          id == "4" ||
          id == "5" ||
          id == "6" ||
          id == "7") {
        return Image.asset("${pngPath}${id}.png");
      }
    }
    return SvgPicture.asset(
      widget.picture,
      // color: widget.color ?? Colors.white,
    );
  }
}
