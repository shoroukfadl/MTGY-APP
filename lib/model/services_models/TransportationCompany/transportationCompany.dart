
import '../../../services/widgets/constant.dart';


class GettransportModel{
  bool? status;
  //natural_datamodel? data;
  GettransportModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      Transportation_list.add(transportDataModel.fromjson(element));
    }
    );
  }
}



class transportDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  transportDataModel.fromjson(Map<String,dynamic> json){
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





