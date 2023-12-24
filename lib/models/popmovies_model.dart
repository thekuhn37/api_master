class PopMoviesModel {
  final String title, thumb;
  final int id;

  // PopMoviesModel({
  //   required this.title,
  //   required this.thumb,
  //   required this.id,
  // });

  PopMoviesModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        thumb = 'https://image.tmdb.org/t/p/w500/${json['backdrop_path']}',
        id = json['id'];
}
