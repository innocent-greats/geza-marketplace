class PopularCategory {
  final int id;
  final String name;
  final String image;
  final String places;

  const PopularCategory(
      {required this.id,
      required this.name,
      required this.image,
      required this.places});
}

class PopularCategoryList {
  static List<PopularCategory> list() {
    const data = <PopularCategory>[
      PopularCategory(
        id: 1,
        name: 'Facial Makeup',
        image: 'assets/images/popular_category/stylist01.png',
        places: '78',
      ),
      PopularCategory(
        id: 2,
        name: 'Glowing Skin',
        image: 'assets/images/popular_category/stylist02.png',
        places: '82',
      ),
      PopularCategory(
        id: 3,
        name: 'Screen Treatment',
        image: 'assets/images/popular_category/stylist03.png',
        places: '52',
      ),
    ];
    return data;
  }
}
