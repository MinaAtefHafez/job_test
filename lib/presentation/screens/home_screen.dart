// ignore_for_file: use_key_in_widget_constructors, must_be_immutable


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_test/controllers/home_controller.dart';
import 'package:job_test/core/colors/colors.dart';
import 'package:job_test/core/constants/constants.dart';
import 'package:job_test/models/gallery_home_model.dart';
import 'package:job_test/presentation/components/custom_home_button.dart';

class HomeScreen extends StatefulWidget {
  
  String token ;
  String name ;

  HomeScreen ({
    required this.name ,
    required this.token
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> gradientList = [
    AppColors.grayHome,
    AppColors.purpleLogin,
    AppColors.pinkHome,
  ];
   
   

  @override
  Widget build(BuildContext context) {

    

    return GetBuilder<HomeController>(builder: (homeController) {
     
        return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: gradientList,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
          ),
          topPart(homeController: homeController),
          const SizedBox(height: 10 ,),
         
        ],
      ),
    );
    } );
  }

  Widget topPart({
    required HomeController homeController
  }) {
   return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 20  ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Welcome',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          )),
                      Text(
                        widget.name ,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppColors.purpleContainer,
                  radius: 50,
                  child: const CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      AppConstants.homeImageUrl ,
                  ),
                ),
                ),
              ],
            ),
          ),
          const SizedBox( height: 40 , ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CustomHomeButton(icon: Icons.logout, iconColor: Colors.red , text: 'log out' , onTap: (){} , ),
                const SizedBox(width: 30 ,),
                CustomHomeButton(icon: Icons.upload, iconColor: Colors.amber , text: 'upload' , onTap: (){
                  homeController.pickImage();
                } , ),
               ],
            ),
          ),
          gridViewItem(homeController: homeController),
        ],
      ),
    );
  }


  Widget gridViewItem ({
    required HomeController homeController
  }) {
    return FutureBuilder<GalleryHomeModel?>(
      future: homeController.getMyGallery(token: widget.token ),
      builder: (context,snapshot) {
          if ( snapshot.hasData ) {
             if ( snapshot.data!.status == 'success' ) {
                   
                    return Expanded(
                      child: GridView.count(
                        crossAxisCount: 3 ,
                         mainAxisSpacing: 20 ,
                         crossAxisSpacing: 20 ,
                        
                         children: snapshot.data!.data.images.map((e) => homeGalleryItem(imageUrl: e) ).toList(), 
                         ),
                    );
             } else {
               return const Expanded(
                  child: Center(child:  Text('No Data Loaded' , style: TextStyle( fontSize: 30 , fontWeight:  FontWeight.w500 , color: Colors.deepPurple   ), )));
             }
          } else if ( snapshot.connectionState == ConnectionState.waiting ) {
            return  const Expanded(child: Center(child: CircularProgressIndicator(color: Colors.deepPurple ,)));
          } else {
            return const Expanded(
                  child: Center(child:  Text('No Data Loaded' , style: TextStyle( fontSize: 30 , fontWeight:  FontWeight.w500 , color: Colors.deepPurple   ), )));
          }
    } );
  }

  Widget homeGalleryItem ({
    required String imageUrl
  }) {
       return Container(
        height: 50 ,
        width: 50 ,
        clipBehavior: Clip.antiAliasWithSaveLayer ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20) ,
        ) ,
        child: Image.network(imageUrl , fit: BoxFit.cover, ) ,
       );
  }
}
