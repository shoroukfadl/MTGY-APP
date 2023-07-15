import '../../../services/widgets/constant.dart';



class GetCinemaModel{
  bool? status;
  //natural_datamodel? data;
  GetCinemaModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      cinama_list.add(CinemaDataModel.fromjson(element));
    }
    );
  }
}



class CinemaDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  CinemaDataModel.fromjson(Map<String,dynamic> json){
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





