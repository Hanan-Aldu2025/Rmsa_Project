import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final List<String> branchIds;

  CategoryModel({
    required this.id,
    required this.name,
    required this.branchIds,
  });

  factory CategoryModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel(
      id: doc.id,
      name: data['name'] ?? '',
      branchIds: List<String>.from(data['branchIds'] ?? []),
    );
  }
}
