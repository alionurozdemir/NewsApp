import 'dart:convert';
import 'dart:io';

import 'package:flutter_news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

Future<List<Result>> getNews() async {
  var response = await http
      .get(Uri.parse("https://api.collectapi.com/news/getNews?country=tr&tag=general"), headers: {
    HttpHeaders.authorizationHeader: 'apikey 69K8eX3UqXnlSXExDegbh7:0dFJynvuT9lYQmrivGzlHB',
    HttpHeaders.contentTypeHeader: 'application/json'
  });
  var jsonData = jsonDecode(response.body);

  var jsonArray = jsonData['result'];

  List<Result> news = [];

  for (var item in jsonArray) {
    news.add(Result(
        description: item['description'],
        name: item['name'],
        url: item['url'],
        key: item['key'],
        source: item['source'],
        image: item['image']));
  }

  return news;
}
