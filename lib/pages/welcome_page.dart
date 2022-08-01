
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:welcome_screen/pages/login_page.dart';
import 'package:welcome_screen/text_widgets/headertext.dart';
import 'package:welcome_screen/text_widgets/normaltext.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
   "mount1.jpg",
   "sea.jpg",
   "waterfall.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage( "assets/img/" +images[index]),fit: BoxFit.cover)
          ),
          child: Container(
            
            margin: const EdgeInsets.only(top:150,right:16,left: 16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(
                      color: Colors.white,
                     text: "Mountain"),
                    const NormalText(color: Colors.white,
                     text: "Discover Nature",
                     size: 30,
                     ),
                     const SizedBox(height: 20,),
                     const SizedBox(
                      width: 300,
                      child: NormalText(
                      color: Colors.white, 
                      text: "Hey there have fun with my new most exciting mobile application hope this performs well "
                      ),
                      
                     ),
                     const SizedBox(height: 20,),
                     ElevatedButton(
                                  style:TextButton.styleFrom(backgroundColor:Vx.purple500),
                                  onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>const LoginPage()),
                                  );
                                },
                                 child: const Text("Api Calling")),
                  ],
                ),
                
                Column(
                  children: List.generate(3, (indexDots){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:index==indexDots?Colors.red:Colors.white,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}