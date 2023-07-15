class ChangeUPasswordModel{
  String? message;
  bool? status;

  ChangeUPasswordModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
  }
}

