import 'package:dartz/dartz.dart';
import 'package:store_app_advanced/data/network/Failure.dart';
import 'package:store_app_advanced/data/network/requests.dart';
import 'package:store_app_advanced/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure, Authentecation>> login(LoginRequest loginRequest);
}
