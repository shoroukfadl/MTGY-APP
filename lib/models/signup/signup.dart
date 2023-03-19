class SignUpModel{
  String? message;
  bool? status;
  SignUpInfo? data ;


  SignUpModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
    data =json['data'] != null? SignUpInfo.fromjson(json['data'])  :null;

  }
}

class SignUpInfo{
  String? username;
  String? email;
  String? password;
  String? phone;
  String? confirmpassword;
  String? token;
  int? is_varified;

  SignUpInfo.fromjson(Map<String,dynamic> jas){
    username = jas['username'];
    email = jas['email'];
    phone = jas['phoneNumber'];
    password = jas['password'];
    confirmpassword = jas['passwordConfirm'];
    token =jas['token'];
    is_varified = jas['is_varified'];
  }
}