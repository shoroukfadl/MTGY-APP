class SignOutModel{
  String? message;
  bool? status;

  SignOutModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["msg"];
  }
}

