import '../../../services/widgets/constant.dart';


class GetHotelModel{
  bool? status;
  //natural_datamodel? data;


  GetHotelModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      hotel_list.add(HotelDataModel.fromjson(element));
    }
    );
  }
}



class HotelDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  HotelDataModel.fromjson(Map<String,dynamic> json){
    serviceName = json['serviceName'];
    title = json["offerTitle"];
    spid = json["sp_id"];
    detail = json["postDetails"];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    id = json['_id'];




  }
}





