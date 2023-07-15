import '../../services/widgets/constant.dart';

class Ugetcart{
  bool? status;
  Ugetcart.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['cart'].forEach((element) {
      getcart_list.add(getcartDataModel.fromjson(element));
    }
    );
  }
}


class getcartDataModel{
  String? serviceName;
  int? amount;
  String? id;
  String? userid;
  int? price;
  String? image;
  String? createdAt;
  getcartDataModel.fromjson(Map<String,dynamic> json){
    serviceName = json['service'];
    amount = json['amount'];
    id = json['_id'];
    userid = json['userId'];
    price = json['price'];
    image = json['image'];
    createdAt=json['createdAt'];

  }
}