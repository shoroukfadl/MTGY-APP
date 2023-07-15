
import '../../services/widgets/constant.dart';

class CReviews{
  bool? status;

  CReviews.fromjson(Map<String,dynamic> json){
    status = json["success"];
    json['data'].forEach((element) {
      C_reviews.add(CGetReviewsDataModel.fromjson(element));
    }
    );
  }
}


class CGetReviewsDataModel{
  String? comment;
  String? userid;
  String? SPid;
  int? rate;
  String? username;
  String? createdat;
  String? id;
  CGetReviewsDataModel.fromjson(Map<String,dynamic> json){
    id = json['_id'];
    comment = json['comment'];
    username = json['username'];
    SPid = json['sp_id'];
    userid = json['userId'];
    createdat = json['createdAt'];
    rate = json['rate'];




  }
}