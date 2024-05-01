class DataModel {
  String? id; // Include id property
  String? data;
  String? image;

  // Update constructor to include id parameter
  DataModel({this.id, this.data, this.image});

  // Update fromJson method to parse id
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id']; // Assign id from JSON
    data = json['data'];
    image = json['image'];
  }

  // Update toJson method to include id
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id; // Include id in JSON
    data['data'] = this.data;
    data['image'] = image;
    return data;
  }
}
