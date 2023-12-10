import 'package:flutter/material.dart';
import 'package:showview/models/show_detail_model.dart';
import 'package:showview/services/api_service.dart';

class DetailScreen extends StatefulWidget {
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
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<ShowDetailModel> show;

  @override
  void initState() {
    super.initState();
    show = ApiService.getShowById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.black,
        foregroundColor: const Color(0xfff89e86),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
          overflow: TextOverflow.fade,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color:
                  Colors.black, // Set the background color of the Row to black
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 100,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Image.network(widget.img),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: FutureBuilder(
                      future: show,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '장르 : ${snapshot.data!.genre}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '일시 : ${snapshot.data!.startDate}~${snapshot.data!.endDate}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '장소 : ${snapshot.data!.facilities}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '관람등급 : ${snapshot.data!.age ?? "전연령"}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '관람시간 : ${snapshot.data!.runtime ?? "자유"}',
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }
                        return const Text("...");
                      },
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: show,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (snapshot.data.price != null)
                            info(snapshot, '티켓가격', snapshot.data!.price),
                          if (snapshot.data.time != null)
                            info(snapshot, '공연시간', snapshot.data!.time),
                          if (snapshot.data.cast != null)
                            info(snapshot, '출연진', snapshot.data!.cast),
                        ],
                      ),
                      Container(
                        width: 500,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                          children: List.generate(
                            snapshot.data!.img!.length,
                            (index) =>
                                Image.network(snapshot.data!.img![index]),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const Text("...");
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox info(AsyncSnapshot<dynamic> snapshot, title, data) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black38, width: 1.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
