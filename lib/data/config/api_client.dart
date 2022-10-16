import 'package:dio/dio.dart';
import 'package:myporto/models/pinned_github.dart';
import 'package:myporto/utils/utils_export.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/')
  Future<List<PinnedGithub>> pinnedGithub(@Query('username') String username);
}
