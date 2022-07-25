class ServicesModel {
  late dynamic title;
  late dynamic image;


  ServicesModel({
    required this.title,
    required this.image,
  });

  ServicesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? ' ';
    image = json['image'] ?? ' ';
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
    };
  }
}