import '../../services/widgets/constant.dart';

class SPGetReviews{
  bool? status;

  SPGetReviews.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      SP_reviews.add(SPGetReviewsDataModel.fromjson(element));
    }
    );
  }
}


class SPGetReviewsDataModel{
  String? comment;
  String? userid;
  String? SPid;
  int? rate;
  String? username;
  String? createdat;
  SPGetReviewsDataModel.fromjson(Map<String,dynamic> json){

    comment = json['comment'];
    username = json['username'];
    SPid = json['sp_id'];
    userid = json['userId'];
    createdat = json['createdAt'];
    rate = json['rate'];


  }
}