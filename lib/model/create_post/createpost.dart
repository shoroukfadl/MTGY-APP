class SPCreatePostModel{
  String? message;
  bool? status;
  SPCreatePostDataModel? data ;


  SPCreatePostModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    message = json["message"];
    data =json['data'] != null? SPCreatePostDataModel.fromjson(json['data'])  :null;

  }
}

class SPCreatePostDataModel{
  String? title;
  String? details;
  String? price;
  String? image;

  SPCreatePostDataModel.fromjson(Map<String,dynamic> json){
    title = json['offerTitle'];
    details = json['PostDetails'];
    price = json['price'];
    image = json['image'];
  }
}