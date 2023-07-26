class Barber {
  final int id;
  final String name;
  final String image;
  final String specialist;
  final String rating;
  final String reviews;

  const Barber(
      {required this.id,
      required this.name,
      required this.image,
      required this.specialist,
      required this.rating,
      required this.reviews});
}

class BarberList {
  static List<Barber> list() {
    const data = <Barber>[
      Barber(
          id: 1,
          name: 'Robert Greats',
          image: 'assets/images/barber/barber01.png',
          specialist: 'Spa & Skin Specialist',
          rating: '4.0',
          reviews: '120'),
      Barber(
          id: 2,
          name: 'Portia Chinhambo',
          image: 'assets/images/barber/barber02.png',
          specialist: 'Body & Skin Specialist',
          rating: '5.0',
          reviews: '120'),
      Barber(
          id: 3,
          name: 'Lisa Zulu',
          image: 'assets/images/barber/barber03.png',
          specialist: 'Hair Specialist',
          rating: '4.0',
          reviews: '120'),
      Barber(
          id: 4,
          name: 'Washin Gondwe',
          image: 'assets/images/barber/barber04.png',
          specialist: 'Message Specialist',
          rating: '5.0',
          reviews: '52'),
    ];
    return data;
  }
}
