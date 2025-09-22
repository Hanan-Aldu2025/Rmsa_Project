class CategoryModel {
  final String categoryName;
  final String categoryImage;
  final bool isSelected;

  CategoryModel({
    required this.categoryName,
    required this.categoryImage,
    required this.isSelected,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      categoryName: jsonData['categoryName'],
      categoryImage: jsonData['categoryImage'],
      isSelected: jsonData['isSelected'] ?? false,
    );
  }
}
