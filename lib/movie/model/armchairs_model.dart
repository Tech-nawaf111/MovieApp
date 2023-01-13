class ArmChairsModel {

  final int rowSeats;
  final int seats;
  final List<int> freeSeats;

  ArmChairsModel({ required this.rowSeats, required this.seats, required this.freeSeats });


  static List<ArmChairsModel> listChairs = [

    ArmChairsModel(rowSeats: 1, seats: 18, freeSeats: [3,4,7,8,11,12,15,16]),
    ArmChairsModel(rowSeats: 2, seats: 22, freeSeats: [1,3,7,8,11,12,15,16,20,22]),
    ArmChairsModel(rowSeats: 3, seats: 22, freeSeats: [2,5,6,9,10,13,14,17,18,21]),
    ArmChairsModel(rowSeats: 4, seats: 22, freeSeats: [3,7,8,11,12,15,16,20]),
    ArmChairsModel(rowSeats: 5, seats: 24, freeSeats: [1,2,6,7,10,11,14,15,18,19,23,24]),
    ArmChairsModel(rowSeats: 6, seats: 24, freeSeats: [3,4,8,9,12,13,16,17,21,22]),
    ArmChairsModel(rowSeats: 7, seats: 24, freeSeats:  [1,2,6,7,10,11,14,15,18,19,23,24]),
    ArmChairsModel(rowSeats: 8, seats: 24, freeSeats: [3,4,8,9,12,13,16,17,21,22]),
    ArmChairsModel(rowSeats: 9, seats: 24, freeSeats:  [1,2,6,7,10,11,14,15,18,19,23,24]),
    ArmChairsModel(rowSeats: 10, seats: 24, freeSeats: []),
  ];



}