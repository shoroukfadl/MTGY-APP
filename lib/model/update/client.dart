class ClientUpdateModel{
  String? message;
  bool? status;
  UpdateModel? data ;


  ClientUpdateModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
    data =json['data'] != null? UpdateModel.fromjson(json['data'])  :null;

  }
}

class UpdateModel{
  String? username;
  String? email;
  String? password;
  String? phone;
  String? confirmpassword;
  String? token;
  int? is_varified;

  UpdateModel.fromjson(Map<String,dynamic> jas){
    username = jas['username'];
    email = jas['email'];
    phone = jas['phoneNumber'];
    password = jas['password'];
    confirmpassword = jas['passwordConfirm'];
    token =jas['token'];
    is_varified = jas['is_varified'];
  }
}