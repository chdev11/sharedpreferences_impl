import 'dart:convert';

class Cloth {
  final ClothType type;
  final String image;
  final String name;
  final String description;
  final double price;
  final List<int> sizeList;
  final List<String> colorList;

  Cloth({
    required this.type,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.sizeList,
    required this.colorList,
  });

  factory Cloth.fromMap(Map<String, dynamic> source) {
    return Cloth(
      type: ClothType.values
          .firstWhere((element) => element.name == source['type']),
      image: source['image'],
      name: source['name'],
      description: source['description'],
      price: source['price'],
      sizeList: (source['sizeList'] as List).map((e) => e as int).toList(),
      colorList: (source['colorList'] as List).map((e) => e as String).toList(),
    );
  }

  factory Cloth.fromJson(String source) {
    return Cloth.fromMap(jsonDecode(source));
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'sizeList': sizeList,
      'colorList': colorList,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}

enum ClothType {
  tshirt,
}
