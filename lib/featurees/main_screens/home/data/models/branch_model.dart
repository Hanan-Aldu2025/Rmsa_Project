import 'package:cloud_firestore/cloud_firestore.dart';

class BranchModel {
  final String id;
  final String name;
  final String location;
  final String phone;
  final String status; // "online" or "offline"
  final List<String> categoryIds;

  BranchModel({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.status,
    required this.categoryIds,
  });

  factory BranchModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BranchModel(
      id: doc.id,
      name: data['name'] ?? '',
      location: data['location'] ?? '',
      phone: data['phone'] ?? '',
      status: data['status'] ?? 'offline',
      categoryIds: List<String>.from(data['categoryIds'] ?? []),
    );
  }
}
