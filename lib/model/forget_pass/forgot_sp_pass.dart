class ChangeSPPasswordModel{
  String? message;
  bool? status;

  ChangeSPPasswordModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["msg"];
  }
}