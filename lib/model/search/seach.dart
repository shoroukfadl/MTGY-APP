class USearchModel{

  bool? status;
  USearchDataModel? data;

  USearchModel.fromjson(Map<String,dynamic> json){
    status =json["success"];
    data =json['data'] != null? USearchDataModel.fromjson(json['data'])  :null;
  }
}

class USearchDataModel{
  String? servicename;
  String? offerTitle;
  String? postDetails;
  String? id;
  int? price;
  String? category;
  String? address;
  String? image;

  USearchDataModel.fromjson(Map<String,dynamic> json){
    servicename = json['serviceName'];
    offerTitle = json['offerTitle'];
    postDetails = json['postDetails'];
    id = json['_id'];
    price = json['price'];
    image = json['image'];
    address =json['Address'];
    category =json['category'];
  }
}