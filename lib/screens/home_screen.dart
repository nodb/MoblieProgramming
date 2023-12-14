import 'package:flutter/material.dart';
import 'package:showview/models/show_model.dart';
import 'package:showview/services/api_service.dart';
import 'package:showview/widgets/show_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<ShowModel>> showsAAAA = ApiService.getShows('AAAA');
  final Future<List<ShowModel>> showsBBBC = ApiService.getShows('BBBC');
  final Future<List<ShowModel>> showsBBBE = ApiService.getShows('BBBE');
  final Future<List<ShowModel>> showsCCCA = ApiService.getShows('CCCA');
  final Future<List<ShowModel>> showsCCCC = ApiService.getShows('CCCC');
  final Future<List<ShowModel>> showsCCCD = ApiService.getShows('CCCD');
  final Future<List<ShowModel>> showsEEEA = ApiService.getShows('EEEA');
  final Future<List<ShowModel>> showsEEEB = ApiService.getShows('EEEB');
  final Future<List<ShowModel>> showsGGGA = ApiService.getShows('GGGA');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xfff89e86),
        title: const Text(
          "쇼:뷰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 3100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              genre("클래식"),
              Expanded(
                child: futurebuilder(showsCCCA),
              ),
              genre("뮤지컬"),
              Expanded(
                child: futurebuilder(showsGGGA),
              ),
              genre("공연"),
              Expanded(
                child: futurebuilder(showsAAAA),
              ),
              genre("무용"),
              Expanded(
                child: futurebuilder(showsBBBC),
              ),
              genre("대중무용"),
              Expanded(
                child: futurebuilder(showsBBBE),
              ),
              genre("국악"),
              Expanded(
                child: futurebuilder(showsCCCC),
              ),
              genre("대중음악"),
              Expanded(
                child: futurebuilder(showsCCCD),
              ),
              genre("복합"),
              Expanded(
                child: futurebuilder(showsEEEA),
              ),
              genre("서커스/마술"),
              Expanded(
                child: futurebuilder(showsEEEB),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding genre(genre) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        genre,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  FutureBuilder<List<ShowModel>> futurebuilder(future) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return makeList(snapshot);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  ListView makeList(AsyncSnapshot<List<ShowModel>> snapshot) {
    return ListView.separated(
      // 사용자가 보고 있는 아이템만 build
      scrollDirection: Axis.horizontal, // 스크롤 방향
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 0,
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
