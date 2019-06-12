import 'package:dio/dio.dart';
import 'package:giphy_search/src/utils/constants.dart';

Dio client() {
  return Dio(BaseOptions(baseUrl: Constants.BASE_URL));
}