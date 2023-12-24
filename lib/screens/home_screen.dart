import 'package:api_practice/models/popmovies_model.dart';
import 'package:api_practice/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopMoviesModel>> popmovies = ApiService.getPopMovies();
  // popmovies는 그냥 지어주는 이름이다.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: popmovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
            // return ListView(
            //   children: [
            //     for (var popmovie in snapshot.data!) Text(popmovie.thumb)
            //   ],
            // );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<PopMoviesModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        // print(index);
        var popmovie = snapshot.data![index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          width: 200,
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            popmovie.thumb,
          ),
        );
        // Text(popmovie.title);
      },
      separatorBuilder: ((context, index) => const SizedBox(
            width: 10,
          )),
    );
  }
}
