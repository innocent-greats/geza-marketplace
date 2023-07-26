class Services {
  final int id;
  final String name;
  final String image;
  final String time;
  final List<String> serviceList;

  const Services(
      {required this.id,
      required this.name,
      required this.image,
      required this.time,
      required this.serviceList});
}

class ServicesList {
  static List<Services> list() {
    const data = <Services>[
      Services(
        id: 1,
        name: 'Hair cut',
        image: 'assets/images/services/1.png',
        time: '20',
        serviceList: ['Styles', 'Trending', 'Modern', 'Casual'],
      ),
      Services(
        id: 2,
        name: 'Facial',
        image: 'assets/images/services/2.png',
        time: '20',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
      Services(
        id: 3,
        name: 'hair Treatment',
        image: 'assets/images/services/3.png',
        time: '15',
        serviceList: ['Style', 'Trending', 'Moderns', 'Casual'],
      ),
      Services(
        id: 4,
        name: 'Makeup',
        image: 'assets/images/services/4.png',
        time: '30',
        serviceList: ['Style', 'Trending', 'Modern', 'Casuals'],
      ),
      Services(
        id: 5,
        name: 'Spa',
        image: 'assets/images/services/3.png',
        time: '7',
        serviceList: ['Styles', 'Trending', 'Modern', 'Casual'],
      ),
      Services(
        id: 6,
        name: 'Body Message',
        image: 'assets/images/services/4.png',
        time: '9',
        serviceList: ['Style', 'Trendings', 'Modern', 'Casual'],
      ),
    ];
    return data;
  }
}
