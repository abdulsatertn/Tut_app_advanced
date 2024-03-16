import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:store_app_advanced/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:store_app_advanced/data/response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/customers/login')
  Future<AuthentecationResponse> login(
      @Field('email') String email, @Field('password') String password);
}

// to auto generate , in trminal we run 'dart run build_runner build --delete-conflicting-outputs'