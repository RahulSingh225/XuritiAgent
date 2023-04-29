import 'package:dio/dio.dart';
import 'package:groupeii_app/services/dio_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<DioClient>(DioClient());
}
