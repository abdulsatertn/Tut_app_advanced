import 'package:dartz/dartz.dart';
import 'package:store_app_advanced/data/data_source/remote_data_source.dart';
import 'package:store_app_advanced/data/mapper/mapper.dart';
import 'package:store_app_advanced/data/network/Failure.dart';
import 'package:store_app_advanced/data/network/network_info.dart';
import 'package:store_app_advanced/data/network/requests.dart';
import 'package:store_app_advanced/domain/models/models.dart';
import 'package:store_app_advanced/domain/reposetry/reposetry.dart';

class RepositryImpl implements Repositry {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentecation>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // it is connected to internet so itss safe to call API
      final respons = await _remoteDataSource.login(loginRequest);

      if (respons.status == 0) {
        //success
        // return Either right
        // return data
        return Right(respons.toDomain());
      } else {
        // failure ...return buisness error
        // return Either left
        return Left(Failure(409, respons.message ?? 'buisness error'));
      }
    } else {
      // return internet connection failure
      return Left(Failure(501, 'please check your internet connection'));
    }
  }
}
