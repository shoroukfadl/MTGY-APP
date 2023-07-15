import '../../../services/widgets/constant.dart';


class GetrestuModel{
  bool? status;
  //natural_datamodel? data;
  GetrestuModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      cafe_list.add(restDataModel.fromjson(element));
    }
    );
  }
}



class restDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  restDataModel.fromjson(Map<String,dynamic> json){
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





