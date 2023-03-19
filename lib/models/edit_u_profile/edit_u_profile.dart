class EditUserProfileModel{
  String? message;
  bool? status;

  EditUserProfileModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["msg"];
  }
}

