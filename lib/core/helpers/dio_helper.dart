import 'package:dio/dio.dart';
import 'package:job_test/core/constants/constants.dart';


class DioHelper {

  static Dio? dio;

   static init() {

    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl ,
        receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map <String ,dynamic> ? headers ,
  }) async {
    Response response =
        await Dio().get('${AppConstants.baseUrl}$url', queryParameters: query, 
        options: Options(
          headers: headers ,
           
        )
        );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }

  static Future<Response> postData({
    required String url,
     Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    FormData? upLoadData ,
    Map <String ,dynamic>? headers,
  }) async {
    Response response = await Dio().post('${AppConstants.baseUrl}$url',
        queryParameters: query, data: data ?? upLoadData ,
           options: Options(
          headers: headers ,
           followRedirects: false,
validateStatus: (status) { return status! < 500; }
    ),
        );
        
        

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      throw Exception(response.statusCode);
    }
  }

  
 static Future <FormData> form ({
    required String imagePath ,
    
  }) async {
      FormData formData =  FormData.fromMap({
        "image":
        await MultipartFile.fromFile(imagePath)});
     return formData ;
  }

  

}
