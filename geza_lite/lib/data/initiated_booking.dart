class InitiatedBooking {
  late int id;
  final String selectedDate;
  final String selectedTime;
  final int customerId;
  final String customerType;
  final int vendorId;
  final int beautyStyleId;
  final String beautyStyleName;
  final double beautyStyleAmount;

  InitiatedBooking({
    required this.selectedDate,
    required this.selectedTime,
    required this.customerId,
    required this.customerType,
    required this.vendorId,
    required this.beautyStyleId,
    required this.beautyStyleName,
    required this.beautyStyleAmount,
  });
}

class InitiatedBookingList {
  static List<InitiatedBooking> list() {
    var data = <InitiatedBooking>[
      InitiatedBooking(
        selectedDate: '',
        selectedTime: '',
        customerId: 0,
        customerType: '',
        vendorId: 0,
        beautyStyleId: 0,
        beautyStyleName: '',
        beautyStyleAmount: 0.0,
      )
    ];
    return data;
  }
}

class Province {
  final String name;
  final List<CityTown> cities;

  Province({required this.name, required this.cities});
}

class CityTown {
  final String name;
  final List<Neighbourhood> neighbourhoods;

  CityTown({required this.name, required this.neighbourhoods});
}

class Neighbourhood {
  final String name;
  final Coordinates coordinates;

  Neighbourhood({required this.name, required this.coordinates});
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});
}
