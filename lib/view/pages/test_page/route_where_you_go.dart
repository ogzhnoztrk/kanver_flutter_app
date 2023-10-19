import 'package:flutter/material.dart';

class RouteWhereYouGo extends StatelessWidget {
  const RouteWhereYouGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
