// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../models/news_model.dart';

class DetailsPage extends StatelessWidget {
  Result result;
  DetailsPage({
    Key? key,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result.name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network('${result.image}'),
            Text(
              result.name.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(result.description.toString()),
            Text(result.source.toString()),
          ],
        ),
      ),
    );
  }
}
