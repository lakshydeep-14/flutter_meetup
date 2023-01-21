class Artists {
  final int id;
  final String photo,
      title,
      price,
      date,
      location,
      desc,
      category,
      rating,
      artistName,
      artistPhoto;

  Artists(
      {required this.artistPhoto,
      required this.id,
      required this.photo,
      required this.title,
      required this.price,
      required this.date,
      required this.location,
      required this.desc,
      required this.category,
      required this.rating,
      required this.artistName});
}
