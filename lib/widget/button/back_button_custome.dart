import 'package:data_on/utils/route.dart';
import 'package:flutter/material.dart';
import '../../global/colors.dart';
import '../../global/fonts.dart';

class BackButtonCustome extends StatelessWidget {
  final String tittle;
  const BackButtonCustome({required this.tittle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => goBack(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.chevron_left_sharp, size: 30, color: cPremier),
            Text(tittle, style: h1(cPremier))
          ],
        ),
      ),
    );
  }
}
