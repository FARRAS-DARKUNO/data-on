import 'package:flutter/material.dart';
import '../../global/colors.dart';
import '../../global/size.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController text;
  final VoidCallback action;
  const SearchInput({
    Key? key,
    required this.text,
    required this.action,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: sWidthDynamic(context, 0.8) - 30,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 2, color: cPremier)),
            child: TextField(
              controller: widget.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search ...',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.action();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Container(
              width: sWidthDynamic(context, 0.2) - 27,
              height: sWidthDynamic(context, 0.2) - 27,
              decoration: BoxDecoration(
                color: cTersier,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(
                Icons.search,
                color: cWhite,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
