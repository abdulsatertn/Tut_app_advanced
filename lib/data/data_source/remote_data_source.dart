import 'package:store_app_advanced/data/network/app_api.dart';
import 'package:store_app_advanced/data/network/requests.dart';
import 'package:store_app_advanced/data/response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthentecationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthentecationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
