class ServiceModel {
  late dynamic name;
  late dynamic title;
  late dynamic price;
  late dynamic name2;
  late dynamic title2;


  ServiceModel({
    required this.name,
    required this.title,
    required this.price,
    required this.title2,
    required this.name2,
  });

  ServiceModel.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'] ?? ' ';
    title = json['title'] ?? ' ';
    price = json['price'] ?? ' ';
    title2 = json['title2'] ?? ' ';
    name2 = json['name2'] ?? ' ';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'price': price,
      'name2': name2,
      'title2': title2,
    };
  }
}