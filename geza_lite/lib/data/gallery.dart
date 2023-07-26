class Gallery {
  final int id;
  final String name;
  final String image;

  const Gallery({required this.id, required this.name, required this.image});
}

class GalleryList {
  static List<Gallery> list() {
    const data = <Gallery>[
      Gallery(
          id: 1,
          name: 'Hair Care',
          image: 'assets/images/popular_category/stylist01.png'),
      Gallery(
          id: 2,
          name: 'Makeover',
          image: 'assets/images/popular_category/stylist02.png'),
    ];
    return data;
  }
}
