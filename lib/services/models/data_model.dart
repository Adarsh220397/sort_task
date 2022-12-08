class DataModel {
  String name;
  String age;
  String city;

  DataModel({
    required this.name,
    required this.age,
    required this.city,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['city'] = city;

    return data;
  }

  factory DataModel.fromJson(dynamic json) {
    return DataModel(
      name: json['name'] == null ? '' : json['name'] as String,
      age: json['age'] == null ? '' : json['age'] as String,
      city: json['city'] == null ? '' : json['city'] as String,
    );
  }
}
