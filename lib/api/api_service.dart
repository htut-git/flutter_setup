import 'package:flutter_setup/app/config.dart';
import 'package:flutter_setup/modal/login_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
part 'api_service.g.dart';

@RestApi(baseUrl: AppConfig.apiUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @Headers(<String, dynamic>{
    'x-authorization': AppConfig.apiKey,
  })
  @POST("authenticate")
  Future<LoginResponse> login(
      @Field('mobile') String mobile, @Field('password') String password);
}
