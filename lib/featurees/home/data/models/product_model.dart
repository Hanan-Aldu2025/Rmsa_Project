class ProductModel {
  final String productName;
  final String productImage;
  final String productPrice;
  final List<String> productSizes;

  ProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productSizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      productName: jsonData['productName'],
      productImage: jsonData['productImage'],
      productPrice: jsonData['productPrice'],
      productSizes: List<String>.from(jsonData['productSizes']),
    );
  }
}
