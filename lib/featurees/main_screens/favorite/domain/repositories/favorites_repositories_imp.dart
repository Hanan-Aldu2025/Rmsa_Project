import 'package:appp/core/error/failure.dart';
import 'package:appp/featurees/main_screens/favorite/data/datasources/favorites_remote_data_source.dart';
import 'package:appp/featurees/main_screens/favorite/data/models/favorite_model.dart';
import 'package:appp/featurees/main_screens/favorite/data/repositories/favorites_repositories.dart';
import 'package:dartz/dartz.dart';

class FavoritesRepositoryImpl extends FavoritesRepository {
  final FavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<FavoriteModel>>> fetchFavorites(
    String uid,
  ) async {
    try {
      final data = await remoteDataSource.getFavorites(uid);
      return right(data);
    } catch (e) {
      return left(FailureServer('Error fetching favorites: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> addFavorite(
    String uid,
    String productId,
  ) async {
    try {
      await remoteDataSource.addFavorite(uid, productId);
      return right(null);
    } catch (e) {
      return left(FailureServer('Error adding favorite: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite(String uid, String favId) async {
    try {
      await remoteDataSource.removeFavorite(uid, favId);
      return right(null);
    } catch (e) {
      return left(FailureServer('Error removing favorite: $e'));
    }
  }
}
