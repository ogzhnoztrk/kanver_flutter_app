import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanver_flutter_app/data/concretes/auth.dart';
import 'package:kanver_flutter_app/view/pages/Authentication/login_page.dart';
import 'package:kanver_flutter_app/view/pages/home/widgets/home_page_card.dart';
import 'dart:ui';

import 'package:kanver_flutter_app/view/pages/home/widgets/home_page_card_group.dart';
import 'package:kanver_flutter_app/view/pages/test_page/route_where_you_go.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });
    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kan Ver',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: _w / 35),
                    Text(
                      'Gönüllü olarak kan bağışı\nyapabilceğiniz gönüllü uygulama',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              HomePageCardsGroup(
                color: Colors.orange.shade900,
                icon: Icons.campaign,
                title: 'İlanlar',
                context: context,
                route: RouteWhereYouGo(),
                color2: Color(0xff63ace5),
                icon2: Icons.add_comment,
                title2: 'İlan Ekle',
                route2: RouteWhereYouGo(),
                animation: _animation,
                animation2: _animation2,
              ),
              HomePageCardsGroup(
                color: Colors.red,
                icon: Icons.medical_services,
                title: 'Hastaneler',
                context: context,
                route: RouteWhereYouGo(),
                color2: Colors.yellow.shade800,
                icon2: Icons.assignment_late,
                title2: 'Şikayet',
                route2: RouteWhereYouGo(),
                animation: _animation,
                animation2: _animation2,
              ),
              ElevatedButton(
                onPressed: () {
                  Auth.signOut().whenComplete(() {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                        (route) => true);
                  });
                },
                child: Text("Çıkış"),
              ),
              SizedBox(height: _w / 20),
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RouteWhereYouGo();
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: _w / 17,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
