
class UaddtocartModel{
  bool? status;
  String? message;
  UaddtocartModel.fromjson(Map<String,dynamic> json){
    status = json["success"];
    message = json["msg"];

  }
}


