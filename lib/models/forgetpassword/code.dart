class CodeVerificationModel{
  String? token;
  bool? status;

  CodeVerificationModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    token = json["token"];
  }
}

