class Coupon {
  final int id;
  final String name;
  final String image;
  final String time;
  final String discount;

  const Coupon({required this.id, required this.name,required this.image,required this.time,required this.discount});
}

class CouponList {
  static List<Coupon> list() {
    const data = <Coupon> [
      Coupon(
        id: 1,
        name: 'Hair cut',
        image: 'assets/images/services/1.png',
        time: '20',
        discount: '50'
      ),
      Coupon(
          id: 2,
          name: 'Facial',
          image: 'assets/images/services/2.png',
          time: '20',
          discount: '30'
      ),
      Coupon(
          id: 3,
          name: 'hair Treatment',
          image: 'assets/images/services/3.png',
          time: '15',
          discount: '20'
      ),
      Coupon(
          id: 4,
          name: 'Makeup',
          image: 'assets/images/services/4.png',
          time: '30',
          discount: '10'
      ),
      Coupon(
          id: 5,
          name: 'Spa',
          image: 'assets/images/services/3.png',
          time: '7',
          discount: '45'
      ),
      Coupon(
          id: 6,
          name: 'Body Message',
          image: 'assets/images/services/4.png',
          time: '9',
          discount: '33'
      ),
    ];
    return data;
}
}