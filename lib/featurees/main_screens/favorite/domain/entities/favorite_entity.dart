import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String id;
  final String productId;
  final DateTime addedAt;

  const FavoriteEntity({
    required this.id,
    required this.productId,
    required this.addedAt,
  });

  @override
  List<Object?> get props => [id, productId, addedAt];
}
