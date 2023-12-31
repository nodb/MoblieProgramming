import 'package:flutter/material.dart';
import 'package:showview/screens/detail_screen.dart';

class Show extends StatelessWidget {
  final String id,
      title,
      startDate,
      endDate,
      location,
      img,
      genre,
      state,
      openrun;

  const Show({
    super.key,
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.img,
    required this.genre,
    required this.state,
    required this.openrun,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          // MaterialPageRoute(
          //   builder: (context) => DetailScreen(
          //     id: id,
          //     title: title,
          //     startDate: startDate,
          //     endDate: endDate,
          //     location: location,
          //     img: img,
          //     genre: genre,
          //     state: state,
          //     openrun: openrun,
          //   ),
          //   fullscreenDialog: true, // 카드 or 전체
          // ),
          PageRouteBuilder(
            // 애니메이션
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(
                CurveTween(
                  curve: curve,
                ),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, anmation, secondaryAnimation) =>
                DetailScreen(
                    id: id,
                    title: title,
                    startDate: startDate,
                    endDate: endDate,
                    location: location,
                    img: img,
                    genre: genre,
                    state: state,
                    openrun: openrun),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 150,
              height: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 15,
                    // offset: const Offset(10, 10),
                    // color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  img,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 150,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              overflow: TextOverflow.clip, // Handle text overflow with ellipsis
            ),
          ),
        ],
      ),
    );
  }
}
