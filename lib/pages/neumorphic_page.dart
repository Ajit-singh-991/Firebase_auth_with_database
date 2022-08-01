// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:welcome_screen/api%20screen/apihome_screen.dart';

class NeumorphicPage extends StatefulWidget{
  const NeumorphicPage({Key? key}) : super(key: key);

  @override
  _NeumorphicPageState createState() => _NeumorphicPageState();
}

class _NeumorphicPageState extends State<NeumorphicPage>with TickerProviderStateMixin{

  final anshu = "https://images.pexels.com/photos/2990641/pexels-photo-2990641.jpeg?auto=compress&cs=tinysrgb&w=600";
  final bear = "https://c.tenor.com/mRHeooBie4IAAAAi/cute-animals-cute.gif";
  

  late TabController _tabController;

  @override
  
  void initState() {
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
    
  }

  @override

Widget build(BuildContext context){

return Scaffold(
  backgroundColor: Vx.purple500,
  
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: VStack([
      VxBox().size(20, 5).white.make(),
      5.heightBox,
        VxBox().size(15, 4).white.make(),
        5.heightBox,
          VxBox().size(10, 3).white.make(),

    ]).pOnly(left: 16, top: 16),
  ),
  drawer: const Drawer(),
  body: VStack([

          
        VxBox(
          
          child: [
            VxBox().square(100).roundedFull
            .neumorphic(color: Vx.purple500, elevation: 30.0)
            .bgImage(DecorationImage(image: NetworkImage(bear)))
            .make().p8(),
            "User ".richText
            .withTextSpanChildren(["Login".textSpan.bold.make()])
            .white.xl2.make(),
          ].column(),
        ).makeCentered().h32(context),
             ClipRRect(
             borderRadius: const BorderRadius.only(
               topLeft: Radius.circular(100),
          ),
          // ignore: prefer_const_constructors
          child: VxBox(child: VStack( [
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.purple,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Vx.purple500,
              unselectedLabelColor: Vx.gray400,
              labelPadding: Vx.m16,
              tabs: const[
                Icon(Icons.login_sharp),
                Icon(Icons.home_filled),
                ]).p16(),
                 TabBarView(
                    controller: _tabController,
                    children: [
                      
                       //"Login".text.purple600.xl2.bold.makeCentered(),
                        SingleChildScrollView(
                          child: VStack([
                           "Login".text.purple600.xl2.bold.makeCentered(),
                          20.heightBox,
                          HStack([
                            VStack([
                              Center(
                                child: ElevatedButton(
                                  style:TextButton.styleFrom(backgroundColor:Vx.purple500),
                                  onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>const ApiHomePage()),
                                  );
                                },
                                 child: const Text("Api")),
                              )
                            ]),
                          ]).px64().px64().px16(),
                          ]).px12(),
                        ),
                     
                       //"Home".text.purple600.xl2.bold.makeCentered(),
                         SingleChildScrollView(
                           child: VStack([
                            "Home".text.purple600.xl2.bold.makeCentered(),
                            20.heightBox,
                          HStack([
                            VStack([
                              Center(
                                child: ElevatedButton(
                                  style:TextButton.styleFrom(backgroundColor:Vx.purple500),
                                  onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>const ApiHomePage()),
                                  );
                                },
                                 child: const Text("Api Calling")),
                              )
                            ]),
                          ]).px64().px64(),
                            ]).px12(),
                         ),
                      ]
                    ).expand(),
                
                  
          ])).white.make(),
        ).expand()
      ]),
   
);
}
}