import 'package:data_on/data/model/university_model.dart';
import 'package:data_on/data/repositories/university_repo.dart';
import 'package:data_on/global/colors.dart';
import 'package:data_on/global/fonts.dart';
import 'package:data_on/global/size.dart';
import 'package:data_on/widget/input/search_input.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  List<UniversityModel> data = [];
  List<UniversityModel> tempDdata = [];

  getData() async {
    await UniversityRepository().getSearchData().then((value) {
      setState(() {
        tempDdata = value;
        data = value;
      });
    });
  }

  launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

  searchHandler() {
    setState(() {
      data = tempDdata;
    });
    if (searchController.text == '') {
      setState(() {
        data = tempDdata;
      });
    } else {
      setState(() {
        data.retainWhere((element) => element.name
            .toLowerCase()
            .contains(searchController.text.toLowerCase()));
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SizedBox(
            height: sHeightFull(context),
            width: sWidthFull(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchInput(text: searchController, action: searchHandler),
                  Column(
                      children: data.map((value) => university(value)).toList())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget university(UniversityModel data) {
    return GestureDetector(
      onTap: () => launchURL(data.web_pages[0]),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: const EdgeInsets.all(10),
        color: cPremier,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: cGrey,
              child: Icon(
                Icons.account_circle_outlined,
                color: cWhite,
                size: 30,
              ),
            ),
            SizedBox(
              width: sWidthMinus(context, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(data.name, style: h3(cBlack)),
                  Text(data.country, style: body3(cDarkPremier))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
