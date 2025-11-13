import 'package:appp/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../models/favorite_model.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<FavoriteModel>>> fetchFavorites(String uid);
  Future<Either<Failure, void>> addFavorite(String uid, String productId);
  Future<Either<Failure, void>> removeFavorite(String uid, String favId);
}
