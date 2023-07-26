class PopularParlour {
  final int id;
  final String name;
  final String image;
  final String location;
  final String rating;
  final String reviews;
  final String status;
  final String open;

  const PopularParlour(
      {required this.id,
      required this.name,
      required this.image,
      required this.location,
      required this.rating,
      required this.reviews,
      required this.status,
      required this.open});
}

class PopularParlourList {
  static List<PopularParlour> list() {
    const data = <PopularParlour>[
      PopularParlour(
          id: 1,
          name: 'Live Style Parlour',
          image: 'assets/images/popular_category/stylist01.png',
          location: 'Mutare',
          rating: '5.0',
          reviews: '120',
          status: 'open',
          open: '9.00am - 7.00pm'),
      PopularParlour(
          id: 2,
          name: 'KingFisher Spa Pro',
          image: 'assets/images/popular_category/stylist02.png',
          location: 'Harare',
          rating: '4.5',
          reviews: '25',
          status: 'open',
          open: '8.00am - 10.00pm'),
      PopularParlour(
          id: 3,
          name: 'Relax Body Message',
          image: 'assets/images/popular_category/stylist03.png',
          location: 'Bulawayo',
          rating: '5.0',
          reviews: '547',
          status: 'Close',
          open: '10.00am - 6.00pm'),
    ];
    return data;
  }
}
