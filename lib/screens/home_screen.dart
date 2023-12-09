import 'package:flutter/material.dart';
import 'package:toonflix/models/show_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/show_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<ShowModel>> shows = ApiService.getShows();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xff1b263b),
        foregroundColor: const Color(0xfff89e86),
        title: const Text(
          "공연",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: FutureBuilder(
          future: shows,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(child: makeList(snapshot))
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  ListView makeList(AsyncSnapshot<List<ShowModel>> snapshot) {
    return ListView.separated(
      // 사용자가 보고 있는 아이템만 build
      scrollDirection: Axis.horizontal, // 스크롤 방향
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var show = snapshot.data![index];
        return Show(
          id: show.id,
          title: show.title,
          startDate: show.startDate,
          endDate: show.endDate,
          location: show.location,
          img: show.img,
          genre: show.genre,
          state: show.state,
          openrun: show.openrun,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        // 아이템 사이 구분자
        width: 20,
      ),
    );
  }
}
