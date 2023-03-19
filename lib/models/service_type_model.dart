class ServiceTypeModel {
  final String name;
  final String image;
  final String rate;
  ServiceTypeModel({
    required this.image,
    required this.name,
    required this.rate
  });
}

List<ServiceTypeModel> ServiceType = [
  ServiceTypeModel(
    image: "assets/images/elhytan.jpg", name: 'Hotel1', rate: '3.5',
  ),
  ServiceTypeModel(
    image: "assets/images/elhytan.jpg", name: 'Hotel2', rate: '3.3',
  ),
  ServiceTypeModel(
    image: "assets/images/elhytan.jpg", name: 'Hotel3', rate: '3.1',
  ),
  ServiceTypeModel(
    image: "assets/images/elhytan.jpg", name: 'Hotel4', rate: '2.9',
  ),


];
