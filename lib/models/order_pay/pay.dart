class PayModel{
  String? message;
  bool? status;

  PayModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
  }
}

