import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';

class ProviderService extends StatelessWidget {
  const ProviderService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          tileColor: ColorData.wgrey,
          leading: Text("id"),
          title: Text("tittle"),
          subtitle: Text("body"),
        );
      }),
    );
  }
}
