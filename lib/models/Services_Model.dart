class ServicesModel {
  late dynamic title;
  late dynamic image;
  late dynamic name;


  ServicesModel({
    required this.title,
    required this.image,
    required this.name,
  });

  ServicesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? ' ';
    image = json['image'] ?? ' ';
    name = json['name'] ?? ' ';
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'name': name,
    };
  }
}