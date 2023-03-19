class DeleteAccountModel{
  String? message;
  bool? status;

  DeleteAccountModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["msg"];
  }
}

