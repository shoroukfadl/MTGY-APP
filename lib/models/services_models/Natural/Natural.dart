class getNaturalModel{
  bool? status;
  //natural_datamodel? data;
  List<DataModel> Natural_list =[];


  getNaturalModel.fromjson(Map<String,dynamic> json){
      status = json["success"];
       json['data'].forEach((element) {
        Natural_list.add(DataModel.fromjson(element));
      }
      );
  }
}


// class natural_datamodel{
//
//   List<DataModel> Natural_list =[];
//
//   natural_datamodel.fromjson(Map<String,dynamic> json){
//        json['data'].forEach((element){
//        Natural_list.add(DataModel.fromjson(element));
//      }
//
//      );
//   }
// }
class DataModel{
  String? serviceName;
  String? time;
  String? id;
  String? date;
  String? about;
  String? image;
  String? address;
  DataModel.fromjson(Map<String,dynamic> json){
    serviceName = json['serviceName'];
    time = json['available_time'];
    id = json['_id'];
    date = json['available_day'];
    about = json['About'];
    address = json['Address'];

  }
}