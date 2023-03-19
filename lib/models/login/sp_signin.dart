class SPSignInModel{
  String? message;
  String? token;
  bool? status;
  SPSignInDataModel? data;

  SPSignInModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
    token =json["token"] ;
    data =json['userData'] != null? SPSignInDataModel.fromjson(json['userData'])  :null;
  }
}

class SPSignInDataModel{
  String? servicename;
  String? email;
  String? phone;
  String? id;
  int? is_varified;
  String? category;
  String? address;

  SPSignInDataModel.fromjson(Map<String,dynamic> json){
    servicename = json['serviceName'];
    email = json['email'];
    phone = json['phoneNumber'];
    id = json['_id'];
    category = json['category'];
    is_varified = json['is_varified'];
    address =json['Address'];
  }
}