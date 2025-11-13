import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final bool isAvailable;
  final String categoryId;
  final List<String> branchIds;
  final String description;
  final double discount;
  final int points;
  final String selectedSize;
  final List<String> avaliableSize;

  // الحقل الجديد
  final List<ProductSize> sizes;
  final List<ExtraOptionModel> extraOption;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.isAvailable,
    required this.categoryId,
    required this.branchIds,
    required this.description,
    required this.discount,
    required this.points,
    required this.selectedSize,
    required this.avaliableSize,
    required this.sizes,
    required this.extraOption,
  });

  factory ProductModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      id: doc.id,
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: (data['ptice'] ?? data['price'] ?? 0).toDouble(),
      isAvailable: data['isAvaliable'] ?? true,
      categoryId: data['categoryId'] ?? '',
      branchIds: List<String>.from(data['branchIds'] ?? []),

      description: data['description'] ?? '',
      discount: (data['discount'] ?? 0).toDouble(),
      points: (data['points'] ?? 0).toInt(),
      selectedSize: data['selectedSize'] ?? '',
      avaliableSize: List<String>.from(data['avaliableSize'] ?? []),

      // ✅ قراءة الحقول الجديدة من Firestore:
      sizes:
          (data['sizes'] as List<dynamic>?)
              ?.map((e) => ProductSize.fromMap(e))
              .toList() ??
          [],
      extraOption:
          (data['extraoption'] as List<dynamic>?)
              ?.map((e) => ExtraOptionModel.fromMap(e))
              .toList() ??
          [],
    );
  }
}

// 🔹 الموديل الفرعي للأحجام:
class ProductSize {
  final String label;
  final String size;
  final int? sizeOz; // ممكن ما يكون موجود ببعض المنتجات
  final double price;

  ProductSize({
    required this.label,
    required this.size,
    this.sizeOz,
    required this.price,
  });

  factory ProductSize.fromMap(Map<String, dynamic> map) {
    return ProductSize(
      label: map['lable'] ?? '',
      size: map['size'] ?? '',
      sizeOz: (map['size_oz'] != null) ? (map['size_oz'] as num).toInt() : null,
      price: (map['price'] ?? 0).toDouble(),
    );
  }
}

class ExtraOptionModel {
  final String option;
  final double? price; // ممكن ما يكون موجود ببعض المنتجات

  ExtraOptionModel({required this.option, required this.price});

  factory ExtraOptionModel.fromMap(Map<String, dynamic> map) {
    return ExtraOptionModel(
      option: map['option'] ?? '',
      price: (map['optionprice'] != null)
          ? (map['optionprice'] as num).toDouble()
          : null,
    );
  }
}

extension ProductModelSnapshot on ProductModel {
  Map<String, dynamic> toSnapshot() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'isAvailable': isAvailable,
      'categoryId': categoryId,
      'branchIds': branchIds,
      'description': description,
      'discount': discount,
      'points': points,
      'selectedSize': selectedSize,
      'avaliableSize': avaliableSize,
      'sizes': sizes
          .map(
            (s) => {
              'lable': s.label,
              'size': s.size,
              'size_oz': s.sizeOz,
              'price': s.price,
            },
          )
          .toList(),
      'extraoption': extraOption
          .map((e) => {'option': e.option, 'optionprice': e.price})
          .toList(),
    };
  }

  // لبناء المنتج من snapshot المفضلة
  static ProductModel fromDocSnapshotMap(String id, Map<String, dynamic> snap) {
    return ProductModel(
      id: id,
      name: snap['name'] ?? '',
      imageUrl: snap['imageUrl'] ?? '',
      price: (snap['price'] ?? 0).toDouble(),
      isAvailable: snap['isAvailable'] ?? true,
      categoryId: snap['categoryId'] ?? '',
      branchIds: List<String>.from(snap['branchIds'] ?? []),
      description: snap['description'] ?? '',
      discount: (snap['discount'] ?? 0).toDouble(),
      points: (snap['points'] ?? 0).toInt(),
      selectedSize: snap['selectedSize'] ?? '',
      avaliableSize: List<String>.from(snap['avaliableSize'] ?? []),
      sizes:
          (snap['sizes'] as List<dynamic>?)
              ?.map((e) => ProductSize.fromMap(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
      extraOption:
          (snap['extraoption'] as List<dynamic>?)
              ?.map(
                (e) => ExtraOptionModel.fromMap(Map<String, dynamic>.from(e)),
              )
              .toList() ??
          [],
    );
  }
}
