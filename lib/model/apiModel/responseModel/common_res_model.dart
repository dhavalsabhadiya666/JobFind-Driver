class CommonResModel {
  CommonResModel({
    this.sucecess,
    this.data,
    this.message,
  });

  CommonResModel.fromJson(dynamic json) {
    sucecess = json['sucecess'];
    data = json['sucecess'] == false
        ? Data()
        : json['data'] != null
            ? json['data'] is List<dynamic>
                ? Data()
                : Data.fromJson(json['data'])
            : null;
    message = json['message'];
  }

  bool? sucecess;
  Data? data;
  String? message;
}

class Data {
  Data({
    this.id,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
  }

  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }
}
