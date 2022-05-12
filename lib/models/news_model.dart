class NewsModel {
  bool? success;
  List<Result>? result;

  NewsModel({this.success, this.result});

  NewsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? key;
  String? url;
  String? description;
  String? image;
  String? name;
  String? source;

  Result({this.key, this.url, this.description, this.image, this.name, this.source});

  Result.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    url = json['url'];
    description = json['description'];
    image = json['image'];
    name = json['name'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['url'] = url;
    data['description'] = description;
    data['image'] = image;
    data['name'] = name;
    data['source'] = source;
    return data;
  }
}
