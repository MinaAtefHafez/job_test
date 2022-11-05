
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_test/core/constants/constants.dart';
import 'package:job_test/core/helpers/dio_helper.dart';
import 'package:job_test/models/gallery_home_model.dart';
import 'package:job_test/presentation/components/snack_bar.dart';

class HomeController extends GetxController {

  

   void pickImage () async{
      try {
        XFile? pick = await ImagePicker().pickImage(source: ImageSource.gallery );
         if ( pick != null ) {
           
          upLoadImage(token: GetStorage().read('token') , path: pick.path );
         }
      } catch (e) {
            showSnackBar(title: 'Error', message: e.toString() );
      }      
   }


   void upLoadImage ({
       required String token ,
       required String path
   }) async {

       try {              
      var fileResult = await DioHelper.form(imagePath: path ); 
        await DioHelper.postData(url: AppConstants.upLoadImageUrl , upLoadData :  fileResult , 
            headers: {
          'Authorization' : 'Bearer $token'
         }  
         );
         showSnackBar(title: 'image upLoaded Successfully', message: '' );
       } on DioError catch (e) {
              showSnackBar(title: 'Error', message: e.message );
       } catch (e) {
             showSnackBar(title: 'Error', message: e.toString() );
       }
       
   }

 Future <GalleryHomeModel?> getMyGallery ({
    required String token
  }) async 
  {
     GalleryHomeModel galleryHomeModel ;
      try {
         var response = await DioHelper.getData(url: AppConstants.myGalleryUrl ,
         headers: {
          'Authorization' : 'Bearer $token'
         } 
          );
         galleryHomeModel = GalleryHomeModel.fromJson(response.data);    
         return galleryHomeModel ;
         
      } on DioError catch (e) {
           showSnackBar(title: 'Error', message: e.message );
           return null ;
      } catch (e) {
        
             showSnackBar(title: 'Error', message: e.toString() );
             return null ;
      }
      
  }

 
   

}