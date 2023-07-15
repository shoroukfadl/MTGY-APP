import '../../../services/widgets/constant.dart';



class GetresortModel{
  bool? status;
  //natural_datamodel? data;
  GetresortModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      resort_list.add(resortDataModel.fromjson(element));
    }
    );
  }
}



class resortDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  resortDataModel.fromjson(Map<String,dynamic> json){
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





