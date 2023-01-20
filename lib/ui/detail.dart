import 'package:f_movie/data/detail_info.dart';
import 'package:f_movie/network/network_util.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailInfo info = DetailInfo(genres: List.empty());

  @override
  void initState() {
    super.initState();
    fetchDetailInfo();
  }

  void fetchDetailInfo() async {
    info = await NetworkUtil().fetchMovieDetail(widget.movieId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network('${info.posterPath}'),
              const SizedBox(
                height: 30,
              ),
              Text(
                "${info.title}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(info.genres.length, (index) {
                    return Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        info.genres[index],
                        style: const TextStyle(color: Color(0x80000000)),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('${info.overview}')),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
