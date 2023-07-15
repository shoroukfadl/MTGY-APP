class ForgetUserPassModel{
  String? message;
  bool? status;

  ForgetUserPassModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["msg"];
  }
}

