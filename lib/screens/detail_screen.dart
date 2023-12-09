import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String id,
      title,
      startDate,
      endDate,
      location,
      img,
      genre,
      state,
      openrun;
  const DetailScreen({
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xff1b263b),
        foregroundColor: const Color(0xfff89e86),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: id,
                child: Container(
                  width: 250,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                  ),
                  child: Image.network(img),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
