class SignInModel{
  String? message;
  String? token;
  bool? status;
  SignInDataModel? data;

  SignInModel.fromjson(Map<String,dynamic> json){
          status =json["success"];
          message = json["message"];
          token =json["token"] ;
          data =json['userData'] != null? SignInDataModel.fromjson(json['userData'])  :null;
  }
}

class SignInDataModel{
  String? username;
  String? email;
  String? phone;
  //String? token;
  int? is_varified;

  SignInDataModel.fromjson(Map<String,dynamic> json){
    username = json['username'];
    email = json['email'];
    phone = json['phoneNumber'];
    //token = json['token'];
    is_varified = json['is_varified'];
  }
}