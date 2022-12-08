import 'package:filter_option_task/services/database.dart';
import 'package:filter_option_task/services/models/data_model.dart';
import 'package:filter_option_task/utils/global_variable.dart';
import 'package:filter_option_task/widgets/circular_progress_indicator_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData themeData;
  bool isLoading = false;

  List<DataModel> dataList = [];

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    isLoading = true;
    // bool bUpoad = await UserService.instance.uploadData();
    // print(bUpoad);
    dataList = await UserService.instance.getData();

    setState(() {});
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);

    return isLoading
        ? const CircularIndicator()
        : Scaffold(
            appBar: AppBar(
              title: const Text('HOME'),
            ),
            body: SafeArea(
                child:
                    isLoading ? const CircularIndicator() : homeScreenBodyUI()),
          );
  }

  Widget homeScreenBodyUI() {
    return Column(
      children: [
        dropDownBoxUI(),
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: dataList.length,
            itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width > webScreenSize
                      ? MediaQuery.of(context).size.width * 0.3
                      : 0,
                  vertical: MediaQuery.of(context).size.width > webScreenSize
                      ? 15
                      : 0,
                ),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Column(children: [dataInfoUI(dataList[index])]))),
          ),
        ),
      ],
    );
  }

  Widget dataInfoUI(DataModel data) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name : ${data.name}',
            style: themeData.textTheme.subtitle1,
          ),
          Text('Age : ${data.age}', style: themeData.textTheme.subtitle1),
          Text('City : ${data.city}', style: themeData.textTheme.subtitle1),
        ],
      ),
    );
  }

  Widget dropDownBoxUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Options',
              style: themeData.textTheme.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            )),
        PopupMenuButton(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Sort By Name', 'Sort By Age', 'Sort By City'}
                .map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  Future<void> handleClick(String value) async {
    switch (value) {
      case 'Sort By Name':
        await sortByName();
        break;
      case 'Sort By Age':
        await sortByAge();
        break;
      case 'Sort By City':
        await sortByCity();
        break;
    }
  }

  Future<void> sortByName() async {
    dataList.sort(((a, b) => a.name.compareTo(b.name)));

    setState(() {});
  }

  Future<void> sortByAge() async {
    dataList.sort(((a, b) => a.age.compareTo(b.age)));

    setState(() {});
  }

  Future<void> sortByCity() async {
    dataList.sort(((a, b) => a.city.compareTo(b.city)));

    setState(() {});
  }
}
