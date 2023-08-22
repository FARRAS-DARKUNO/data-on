import 'package:flutter/material.dart';

// Hight size

sHeightFull(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top;
}

sHeightDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.height * value;
}

sHeightMinus(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.height -
      value -
      MediaQuery.of(context).viewPadding.top;
}

sHighBottomBar(BuildContext context) {
  return 55.0;
}

sHightContainWithBar(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top -
      60;
}

sHightRoomHeader(BuildContext context) {
  return 70.0;
}

sKeyboard(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

sHightKeyboardShow(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).viewPadding.top -
      MediaQuery.of(context).viewInsets.bottom -
      70;
}

// Width size

sWidthFull(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

sWidthDynamic(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.width * value;
}

sWidthMinus(BuildContext context, dynamic value) {
  return MediaQuery.of(context).size.width - value;
}
