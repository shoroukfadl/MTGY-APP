class CategoryModal {
  late String image;
  late String category;
  late int discount;

  CategoryModal({required this.image,required this.category,required this.discount});

  CategoryModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    category = json['category'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['category'] = this.category;
    data['discount'] = this.discount;
    return data;
  }
}