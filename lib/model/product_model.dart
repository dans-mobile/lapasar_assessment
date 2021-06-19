class ProductModel {
  ProductModel({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.brand,
    this.model,
    this.version,
    this.images,
    this.tags,
    this.active,
    this.moq,
    this.isNew,
    this.isBest,
    this.createdDate,
    this.category,
    this.price,
    this.expiryDate,
    this.promotions,
  });

  String id;
  String sku;
  String name;
  String description;
  String brand;
  String model;
  String version;
  List<String> images;
  List<dynamic> tags;
  bool active;
  int moq;
  bool isNew;
  bool isBest;
  DateTime createdDate;
  List<String> category;
  int price;
  dynamic expiryDate;
  dynamic promotions;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        brand: json["brand"],
        model: json["model"],
        version: json["version"],
        images: List<String>.from(json["images"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        active: json["active"],
        moq: json["moq"],
        isNew: json["isNew"],
        isBest: json["isBest"],
        createdDate: DateTime.parse(json["createdDate"]),
        category: List<String>.from(json["category"].map((x) => x)),
        price: json["price"],
        expiryDate: json["expiry_date"],
        promotions: json["promotions"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sku": sku,
        "name": name,
        "description": description,
        "brand": brand,
        "model": model,
        "version": version,
        "images": List<dynamic>.from(images.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "active": active,
        "moq": moq,
        "isNew": isNew,
        "isBest": isBest,
        "createdDate": createdDate.toIso8601String(),
        "category": List<dynamic>.from(category.map((x) => x)),
        "price": price,
        "expiry_date": expiryDate,
        "promotions": promotions,
      };
}
