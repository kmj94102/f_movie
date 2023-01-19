import 'package:f_movie/data/movie_list_item.dart';
import 'package:f_movie/network/network_util.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<MovieListItem> list;

  @override
  void initState() {
    super.initState();
    fetchMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 220),
          // padding: const EdgeInsets.fromLTRB(20, 15, 20, 50),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      list[index].getPosterImage(),
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          child: Text(
                            '${list[index].title}',
                          )),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }

  void fetchMovieList() async {
    var networkUtil = NetworkUtil();
    list = await networkUtil.fetchMovieList();
  }
}
