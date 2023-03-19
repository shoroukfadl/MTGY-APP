class SPSignUpModel{
  String? message;
  bool? status;
  SPSignUpInfo? data ;


  SPSignUpModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
    data =json['data'] != null? SPSignUpInfo.fromjson(json['data'])  :null;

  }
}

class SPSignUpInfo{
  String? sevicename;
  String? email;
  String? password;
  String? phone;
  String? category;
  String? confirmpassword;
  String? token;
  int? is_varified;
  String? id;
  String? image;
  SPSignUpInfo.fromjson(Map<String,dynamic> jas){
    sevicename = jas['serviceName'];
    email = jas['email'];
    phone = jas['phoneNumber'];
    password = jas['password'];
    confirmpassword = jas['passwordConfirm'];
    token =jas['token'];
    category =jas['category'];
    id =jas['_id'];
    is_varified = jas['is_varified'];
    image = jas['image'];
  }
}