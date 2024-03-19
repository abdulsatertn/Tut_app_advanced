import 'package:dartz/dartz.dart';
import 'package:store_app_advanced/data/network/Failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
