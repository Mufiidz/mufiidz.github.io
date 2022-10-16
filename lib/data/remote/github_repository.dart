import 'package:myporto/data/config/api_client.dart';
import 'package:myporto/models/pinned_github.dart';

abstract class GithubRepository {
  Future<List<PinnedGithub>> getPinnedGithub();
}

class GithubRepositoryImpl implements GithubRepository {
  final ApiClient _apiClient;

  GithubRepositoryImpl(this._apiClient);

  @override
  Future<List<PinnedGithub>> getPinnedGithub() async => await _apiClient.pinnedGithub('Mufiidz');
}
