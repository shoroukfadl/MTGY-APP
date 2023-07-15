import '../../../services/widgets/constant.dart';
class GettOffersModel{
  bool? status;
  GettOffersModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      offer_list.add(OffersDataModel.fromjson(element));
    }
    );
  }
}
class OffersDataModel{
  String? serviceName;
  String? title;
  String? spid;
  String? content;
  int? price;
  String? image;
  String? cat;
  OffersDataModel.fromjson(Map<String,dynamic> json){
   spid = json["sp_id"];
   title = json["offerTitle"] ;
  content = json["postDetails"] ;
  price =  json["price"];
   image =  json[ "image"];
   serviceName = json["serviceName"];
  cat =  json["category"];

  }
}