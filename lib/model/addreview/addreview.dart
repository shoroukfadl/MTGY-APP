class AddreviewModel{
  String? message;
  bool? status;

  AddreviewModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
  }
}