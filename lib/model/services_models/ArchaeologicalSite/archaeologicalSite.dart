
import '../../../services/widgets/constant.dart';

class getagrsitesModel{
  bool? status;
  //natural_datamodel? data;


  getagrsitesModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      agr_list.add(AgrDataModel.fromjson(element));
    }
    );
  }
}
class AgrDataModel{
  String? serviceName;
  String? time;
  String? id;
  String? date;
  String? about;
  String? image;
  String? address;
  AgrDataModel.fromjson(Map<String,dynamic> json){
    serviceName = json['serviceName'];
    time = json['available_time'];
    id = json['_id'];
    date = json['available_day'];
    about = json['About'];
    address = json['Address'];

  }
}





