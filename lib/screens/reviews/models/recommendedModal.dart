class RecommendedModal {
  late String image;
  late String title;
  late double price;
  late double rating;
  late int sale;

  RecommendedModal({ required this.image,required this.title,required this.price
    ,required this.rating,required this.sale});

  RecommendedModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    price = json['price'];
    rating = json['rating'];
    sale = json['sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['sale'] = this.sale;
    return data;
  }
}