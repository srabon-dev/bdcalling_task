import 'package:bdcalling_task/model/android_version_model.dart';
import 'package:bdcalling_task/widget/item_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<AndroidVersion> androidVersionList = [];

  final List<dynamic> inputOne = [
    {
      "0": {"id": 1, "title": "Gingerbread"},
      "1": {"id": 2, "title": "Jellybean"},
      "3": {"id": 3, "title": "KitKat"},
    },
    [
      {"id": 4, "title": "Lollipop"},
      {"id": 5, "title": "Pie"},
      {"id": 6, "title": "Oreo"},
      {"id": 7, "title": "Nougat"},
    ]
  ];

  final List<dynamic> inputTwo = [
    {
      "0": {"id": 1, "title": "Gingerbread"},
      "1": {"id": 2, "title": "Jellybean"},
      "3": {"id": 3, "title": "KitKat"}
    },
    {
      "0": {"id": 8, "title": "Froyo"},
      "2": {"id": 9, "title": "Éclair"},
      "3": {"id": 10, "title": "Donut"}
    },
    [
      {"id": 4, "title": "Lollipop"},
      {"id": 5, "title": "Pie"},
      {"id": 6, "title": "Oreo"},
      {"id": 7, "title": "Nougat"},
    ]
  ];

  void convertJson(List<dynamic> data){
    List<AndroidVersion> version = [];
    for (var element in data){
      if(element is Map){
        element.forEach((key, value){
          version.add(AndroidVersion(
            id: value['id'],
            title: value['title'],
          ));
        });
      }else{
        for(var item in element){
          version.add(
              AndroidVersion(
              id: item['id'],
              title: item['title']
            )
          );
        }
      }
    }
    setState(() {
      androidVersionList = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text("BD Calling Task",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              width: width,
              child: ElevatedButton(onPressed: ()=> convertJson(inputOne), child: const Text("View Input 1")),
            ),
            const SizedBox(height: 12,),
            SizedBox(
              height: 50,
              width: width,
              child: ElevatedButton(onPressed: ()=>convertJson(inputTwo), child: const Text("View Input 2")),
            ),
            const SizedBox(height: 24,),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: androidVersionList.length,
              itemBuilder: (BuildContext context, int index){
                return ItemCard(androidVersion: androidVersionList[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
