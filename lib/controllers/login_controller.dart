


import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_test/core/constants/constants.dart';
import 'package:job_test/core/constants/enums.dart';
import 'package:job_test/models/login_user_model.dart';
import 'package:job_test/presentation/components/snack_bar.dart';
import 'package:job_test/presentation/screens/home_screen.dart';


class LoginController extends GetxController {
  
   LoginUserModel? loginUserModel ;
   LoadState loginState = LoadState.stable ;
  

   void login ({
    required String email ,
    required String password ,
   }) async

   {

    loginState =  LoadState.loading ;
    update();

    try {
       var response = await  Dio().post('${AppConstants.baseUrl}${AppConstants.loginUrl}' , 
     data: {'email' : email , 'password' : password } );
        
        if ( response.data['user'] == null ) {
          showSnackBar(title: 'Error', message: 'Incorrect Details . Please try again');
        }  else {
          loginUserModel = LoginUserModel.fromJson(response.data);
          await GetStorage().write('token', '${loginUserModel!.token}');
          await GetStorage().write('name', '${loginUserModel!.user!.name}');
          Get.to(()=>HomeScreen(
            name: loginUserModel!.user!.name! ,
            token: 'Bearer ${loginUserModel!.token!}' ,
          ));
        }

    } on DioError catch (e) {
      showSnackBar(title: 'Error', message: e.message );
      
    } catch (error) {
      showSnackBar(title: 'Error', message: error.toString());
      
    }
    loginState = LoadState.loaded ;
    update();
  
   }


}