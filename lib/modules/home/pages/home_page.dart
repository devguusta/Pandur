import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:pandur/shared/services/user_manager.dart';

class HomePage extends StatefulWidget {
 
  HomePage({Key? key}) : super(key: key);

  

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
   final UserManager userManager = GetIt.I<UserManager>();
  ScrollController? scrollController;
   bool fabIsVisible = true;
  @override
  void initState() { 
    super.initState();
    scrollController = ScrollController();
   

    scrollController!.addListener(() {
      setState(() {
        fabIsVisible = scrollController!.position.userScrollDirection ==
            ScrollDirection.forward;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(userManager.user!.name),
        ],
      ),
    );
  }
}