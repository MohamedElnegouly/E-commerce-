import 'brand.dart';
import 'category.dart';
import 'subcategory.dart';

class ProductModel {
  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? mongoId; // _id
  String? id; // id
  String? title;
  String? slug;
  String? description;
  int? quantity;
  num? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  num? ratingsAverage;
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json['sold'] is num
          ? json['sold']
          : num.tryParse(json['sold']?.toString() ?? '0'),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsQuantity: json['ratingsQuantity'] is int
          ? json['ratingsQuantity']
          : int.tryParse(json['ratingsQuantity']?.toString() ?? '0'),
      mongoId: json['_id'] as String?,
      id: json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity']?.toString() ?? '0'),
      price: json['price'] is num
          ? json['price']
          : num.tryParse(json['price']?.toString() ?? '0'),
      imageCover: json['imageCover'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: json['ratingsAverage'] is num
          ? json['ratingsAverage']
          : num.tryParse(json['ratingsAverage']?.toString() ?? '0'),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt']),
    );
  }

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
