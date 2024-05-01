class UserDataModel {
  String? name;
  String? surname;
  String? gender;
  String? age;
  String? id;

  UserDataModel({this.name, this.surname, this.gender, this.age, this.id});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    gender = json['gender'];
    age = json['age'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['id'] = this.id;
    return data;
  }
}