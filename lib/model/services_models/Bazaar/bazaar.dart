
import '../../../services/widgets/constant.dart';


class GetbazaarModel{
  bool? status;
  //natural_datamodel? data;
  GetbazaarModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      Bazaar_list.add(BazaarDataModel.fromjson(element));
    }
    );
  }
}



class BazaarDataModel{
  String? serviceName;
  String? id;
  String? spid;
  String? title;
  String? detail;
  String? image;
  String? category;
  int? price;
  BazaarDataModel.fromjson(Map<String,dynamic> json){
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





