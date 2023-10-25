import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePageCard extends StatelessWidget {
  late Color color;
  late IconData icon;
  late String title;
  late Widget route;
  late Animation<double> animation;
  late Animation<double> animation2;
  HomePageCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.route,
    required this.animation,
    required this.animation2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: animation.value,
      child: Transform.translate(
        offset: Offset(0, animation2.value),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            // HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            height: w / 2,
            width: w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(),
                Container(
                  height: w / 8,
                  width: w / 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color.withOpacity(.6),
                  ),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
