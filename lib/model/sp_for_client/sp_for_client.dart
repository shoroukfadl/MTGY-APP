import '../../../services/widgets/constant.dart';

class GetSPproForCModel{
  bool? status;
  ProfileDataModel? data;
  GetSPproForCModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    data =json["Partner_Profile"] != null? ProfileDataModel.fromjson(json["Partner_Profile"])  :null;
  }
}
class ProfileDataModel{
  String? serviceName;
  String? email;
  String? id;
  String? address;
  String? phoneNumber;
  String? cat;
 // String? image;
  ProfileDataModel.fromjson(Map<String,dynamic> json){
    id = json["_id"];
    email = json["email"] ;
    address = json["Address"] ;
    phoneNumber =  json["phoneNumber"];
    //image =  json[ "image"];
    serviceName = json["serviceName"];
    cat =  json["category"];

  }
}