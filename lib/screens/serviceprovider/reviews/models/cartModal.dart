class CartModal {
 late String image;
  late String title;
  late String desc;
  late double price;
  late int quantity;

  CartModal({required this.image, required this.title,required this.desc,required this.price,required this.quantity});

  CartModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}