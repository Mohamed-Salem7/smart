class DeliveryModel{
  late dynamic name;
  late dynamic title;
  late dynamic state;
  late dynamic image;


  DeliveryModel({
    required this.name,
    required this.title,
    required this.state,
    required this.image,
  });

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? ' ';
    title = json['title'] ?? ' ';
    state = json['state'] ?? ' ';
    image = json['image'] ?? ' ';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'image': image,
    };
  }
}