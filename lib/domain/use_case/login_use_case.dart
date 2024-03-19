import 'package:dartz/dartz.dart';
import 'package:store_app_advanced/data/network/Failure.dart';
import 'package:store_app_advanced/data/network/requests.dart';
import 'package:store_app_advanced/domain/models/models.dart';
import 'package:store_app_advanced/domain/reposetry/reposetry.dart';
import 'package:store_app_advanced/domain/use_case/base_use_case.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentecation> {
  final Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentecation>> execute(
      LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
