class Request {
  final int id;
  final String name;
  final String image;
  final String date;
  final String time;
  final String amount;
  final String rating;
  final String reviews;
  final String type;
  final String status;

  const Request(
      {required this.id,
      required this.name,
      required this.image,
      required this.date,
      required this.time,
      required this.amount,
      required this.rating,
      required this.reviews,
      required this.type,
      required this.status});
}

class RequestList {
  static List<Request> list() {
    const data = <Request>[
      Request(
          id: 1,
          name: 'Fahima Khan',
          image: 'assets/images/request/1.png',
          date: '2 Feb 2021',
          time: '12:00 pm',
          amount: '120',
          rating: '5',
          reviews: '12',
          type: 'Movie Actor',
          status: 'Running'),
      Request(
          id: 2,
          name: 'Mariya Tuba',
          image: 'assets/images/request/2.png',
          date: '1 Feb 2021',
          time: '05:00 pm',
          amount: '250',
          rating: '5',
          reviews: '12',
          type: 'Movie Actor',
          status: 'Running'),
      Request(
          id: 3,
          name: 'Sakina Joshifa',
          image: 'assets/images/request/3.png',
          date: '22 Jan 2021',
          time: '04.30 pm',
          amount: '99',
          rating: '5',
          reviews: '12',
          type: 'Movie Actor',
          status: 'Completed'),
      Request(
          id: 4,
          name: 'Lifaniya Mujo',
          image: 'assets/images/request/4.png',
          date: '21 Jan 2021',
          time: '09:15 am',
          amount: '130',
          rating: '5',
          reviews: '12',
          type: 'Movie Actor',
          status: 'Completed'),
      Request(
          id: 5,
          name: 'Wakina Tashiya',
          image: 'assets/images/request/5.png',
          date: '15 Jan 2021',
          time: '12:05 am',
          amount: '50',
          rating: '5',
          reviews: '12',
          type: 'Movie Actor',
          status: 'Completed'),
      Request(
          id: 6,
          name: 'Toba Hossen',
          image: 'assets/images/request/6.png',
          date: '05 Jan 2021',
          time: '10:15 am',
          amount: '450',
          rating: '5',
          reviews: '12',
          type: 'Movie Actor',
          status: 'Completed'),
    ];
    return data;
  }
}
