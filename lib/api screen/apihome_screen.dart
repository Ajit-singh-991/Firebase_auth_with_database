// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:welcome_screen/pages/albums.dart';

import 'package:welcome_screen/services/remote_services.dart';

class ApiHomePage extends StatefulWidget {
  const ApiHomePage({Key? key}) : super(key: key);

  @override
  State<ApiHomePage> createState() => _ApiHomePageState();
}

class _ApiHomePageState extends State<ApiHomePage> {
  List<Problems>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

    getData()async{
     posts = (await RemoteServices().getPosts()) as List<Problems>?;
     if(posts!= null){
      setState(() {
        isLoaded= true;
      });
     }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Vx.purple500,
      title:const Text("Api Home"),
     ),
     
     body:Visibility(
      replacement: const Center(
       child: CircularProgressIndicator(),
       ),
      visible: isLoaded,
       child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index){
        return Container(
          padding: const EdgeInsets.all(16),

           child: Row(
             children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Vx.purple500,
                ),
              ),
              const SizedBox(width: 16,),
               Expanded(
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts![index].problems.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    
                     //Text(posts![index].problems,
                    //maxLines: 3,
                    //overflow: TextOverflow.ellipsis,
                   
                   // ),
                    ],
                  ),
               ),
             ],
           ),
         
        );
       }
       ),
       
     )
    );
    
  }
}