class ServiceModel {
  late dynamic name;
  late dynamic price;


  ServiceModel({
    required this.name,
    required this.price,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? ' ';
    price = json['price'] ?? ' ';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
    };
  }
}