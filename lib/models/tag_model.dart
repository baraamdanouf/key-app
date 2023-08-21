class TagModel {
  TagModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
        id: json["tag_id"].toString() ?? '',
        name: json["tag_name"]?.toString() ?? '',

    );
  }
}