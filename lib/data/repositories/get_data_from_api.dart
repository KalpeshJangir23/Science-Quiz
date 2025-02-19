  import 'package:dio/dio.dart';
  import 'package:flutter/foundation.dart';
  import 'package:quiz_science_app/data/model/base_course_model.dart';

  class ApiService {
    final Dio _dio = Dio();

    static final ApiService _instance = ApiService._internal();

    factory ApiService() => _instance;

    ApiService._internal();

    Future<BaseCourseModel> getCourseData() async {
      try {
        final Response response =
            await _dio.get("https://api.jsonserve.com/Uw5CrX");

        if (response.statusCode == 200) {
            if (kDebugMode) {
              print('Success on data fetch');
            }
        }
        return BaseCourseModel.fromJson(response.data);
      } on DioException catch (e) {
        if (kDebugMode) {
          print('Dio error: ${e.message}');
        }
        rethrow;
      } catch (e) {
        if (kDebugMode) {
          print('Error: ${e.toString()}');
        }
        rethrow;
      }
    }
  }
