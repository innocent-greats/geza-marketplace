class Services {
  final int id;
  final String name;
  final String image;
  final String service;
  final List<String> serviceList;

  const Services(
      {required this.id,
      required this.name,
      required this.image,
      required this.service,
      required this.serviceList});
}

class ServicesList {
  static List<Services> list() {
    const data = <Services>[
      Services(
        id: 1,
        name: 'Hair cut',
        image: 'assets/images/popular_category/stylist02.png',
        service: '20',
        serviceList: ['Style', 'Trending', 'Modern', 'Casual'],
      ),
      Services(
        id: 2,
        name: 'Facial',
        image: 'assets/images/barber/barber03.png',
        service: '20',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
      Services(
        id: 3,
        name: 'hair Treatment',
        image: 'assets/images/popular_category/stylist04.png',
        service: '15',
        serviceList: ['Style', 'Trending', 'Moderns', 'Casual'],
      ),
      Services(
        id: 4,
        name: 'Makeup',
        image: 'assets/images/barber/barber04.png',
        service: '30',
        serviceList: ['Style', 'Trending', 'Modern', 'Casuals'],
      ),
      Services(
        id: 5,
        name: 'Spa',
        image: 'assets/images/barber/barber02.png',
        service: '7',
        serviceList: ['Style', 'Trending', 'Modern', 'Casual'],
      ),
      Services(
        id: 6,
        name: 'Body Message',
        image: 'assets/images/popular_category/stylist01.png',
        service: '10',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
      Services(
        id: 7,
        name: 'Body Message',
        image: 'assets/images/popular_category/stylist01.png',
        service: '11',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
      Services(
        id: 8,
        name: 'Body Message',
        image: 'assets/images/popular_category/stylist01.png',
        service: '9',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
      Services(
        id: 9,
        name: 'Body Message',
        image: 'assets/images/popular_category/stylist01.png',
        service: '9',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
      Services(
        id: 10,
        name: 'Body Message',
        image: 'assets/images/popular_category/stylist01.png',
        service: '9',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
    ];
    return data;
  }
}
