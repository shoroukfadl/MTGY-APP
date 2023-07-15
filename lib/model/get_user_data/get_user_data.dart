class ClientGetProfileModel{
  String? message;
  bool? status;
  GetDataModel? data ;


  ClientGetProfileModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
    data =json['data'] != null? GetDataModel.fromjson(json['data'])  :null;

  }
}

class GetDataModel{
  String? username;
  String? email;
  String? phone;
  int? is_varified;

  GetDataModel.fromjson(Map<String,dynamic> json){
    username = json['username'];
    email = json['email'];
    phone = json['phoneNumber'];
    is_varified = json['is_varified'];
  }
}