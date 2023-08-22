import 'package:data_on/global/fonts.dart';
import 'package:flutter/material.dart';

import '../../global/colors.dart';
import '../../global/size.dart';

class NormalButton extends StatelessWidget {
  final String title;
  const NormalButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: sWidthFull(context) - 40,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: cSekunder),
      child: Text(title, style: h2(cWhite)),
    );
  }
}
