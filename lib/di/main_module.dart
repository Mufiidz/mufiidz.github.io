import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myporto/data/firebase/firebase_repository.dart';
import 'package:myporto/data/remote/github_repository.dart';

import '../data/config/api_client.dart';
import '../data/config/dio_client.dart';

final GetIt getIt = GetIt.I;

void setupDI() async {
  getIt.registerSingleton<Dio>(DioClient.init);
  getIt.registerSingleton(ApiClient(getIt<Dio>()));
  getIt.registerLazySingleton<GithubRepository>(
      () => GithubRepositoryImpl(getIt<ApiClient>()));
  getIt.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(FirebaseFirestore.instance));
}
