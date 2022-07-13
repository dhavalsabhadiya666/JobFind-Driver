/// sucecess : true
/// data : {"filepath_url":"05e9ac334529a428c54e96f8364e6dbc.png","url":"https://teleport-devlopment.herokuapp.com/uploads/05e9ac334529a428c54e96f8364e6dbc.png"}
/// message : ""

class UploadFileResModel {
  UploadFileResModel({
    this.sucecess,
    this.data,
    this.message,
  });

  UploadFileResModel.fromJson(dynamic json) {
    sucecess = json['sucecess'];
    data = json['sucecess'] == false
        ? Data()
        : json['data'] != null
            ? Data.fromJson(json['data'])
            : null;
    message = json['message'];
  }

  bool? sucecess;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sucecess'] = sucecess;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

/// filepath_url : "05e9ac334529a428c54e96f8364e6dbc.png"
/// url : "https://teleport-devlopment.herokuapp.com/uploads/05e9ac334529a428c54e96f8364e6dbc.png"

class Data {
  Data({
    this.filepathUrl,
    this.url,
  });

  Data.fromJson(dynamic json) {
    filepathUrl = json['filepath_url'];
    url = json['url'];
  }

  String? filepathUrl;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filepath_url'] = filepathUrl;
    map['url'] = url;
    return map;
  }
}
