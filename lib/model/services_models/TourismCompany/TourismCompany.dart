import '../../../services/widgets/constant.dart';



class GettourismModel{
  bool? status;
  //natural_datamodel? data;
  GettourismModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      tourismcomp_list.add(tourismDataModel.fromjson(element));
    }
    );
  }
}



class tourismDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  tourismDataModel.fromjson(Map<String,dynamic> json){
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





