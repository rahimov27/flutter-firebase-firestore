class DataModel {
  String? data;
  String? image;

  DataModel({this.data, this.image, required String id});

  DataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    image = json['image'];
  }

  get id => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['image'] = image;
    return data;
  }
}
