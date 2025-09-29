import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class ProductModel {
  dynamic sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  dynamic ratingsQuantity;
  String? mongoId; // عشان نفرق بين _id و id
  String? id; // ده من ال JSON باسم "id"
  String? title;
  String? slug;
  String? description;
  dynamic quantity;
  dynamic price;
  String? imageCover;
  Category? category;
  Brand? brand;
  dynamic ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.mongoId,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    sold: json['sold'] ?? '',
    images: (json['images'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    subcategory: (json['subcategory'] as List<dynamic>?)
        ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    ratingsQuantity: json['ratingsQuantity'] as int?,
    mongoId: json['_id'] as String?,
    id: json['id'] as String?,
    title: json['title'] as String?,
    slug: json['slug'] as String?,
    description: json['description'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as int?,
    imageCover: json['imageCover'] as String?,
    category: json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    brand: json['brand'] == null
        ? null
        : Brand.fromJson(json['brand'] as Map<String, dynamic>),
    ratingsAverage: (json['ratingsAverage'] ?? ''),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    'sold': sold,
    'images': images,
    'subcategory': subcategory?.map((e) => e.toJson()).toList(),
    'ratingsQuantity': ratingsQuantity,
    '_id': mongoId,
    'id': id,
    'title': title,
    'slug': slug,
    'description': description,
    'quantity': quantity,
    'price': price,
    'imageCover': imageCover,
    'category': category?.toJson(),
    'brand': brand?.toJson(),
    'ratingsAverage': ratingsAverage,
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
