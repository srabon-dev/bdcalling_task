import 'package:bdcalling_task/model/android_version_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.androidVersion});
  final AndroidVersion? androidVersion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xffE5F1FD),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
                color: Color(0xff97A4B7),
                offset: Offset(8.0, 10.0),
                blurRadius: 20.0)
          ],
        ),
        child: ListTile(
          title: Text("ID: ${androidVersion?.id}"),
          subtitle: Text("Name: ${androidVersion?.title??""}",style: Theme.of(context).textTheme.titleMedium),
        ),
      ),
    );
  }
}