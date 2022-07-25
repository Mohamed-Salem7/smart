class ServiceModel {
  late dynamic name;
  late dynamic title;
  late dynamic price;


  ServiceModel({
    required this.name,
    required this.title,
    required this.price,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? ' ';
    title = json['title'] ?? ' ';
    price = json['price'] ?? ' ';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'price': price,
    };
  }
}