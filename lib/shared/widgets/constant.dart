import 'package:flutter/material.dart';

import '../../screens/reviews/models/cartModal.dart';
import '../../screens/reviews/models/reviewModal.dart';

String? token = '';
String? resetPasstoken = '';
String? SPDeleteEmail = '';
const WhiteColor = Color(0xFFFFFFFF);
const BlueColor = Color(0xff023859);
const YellowColor = Color(0xffdaa520);
const Transparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;

const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: BlueColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 20.0,
  color: YellowColor,
);

const kDarkTextStyle = TextStyle(
  fontSize: 20.0,
  color: BlueColor,
);

const kDivider = Divider(
  color: YellowColor,
  thickness: kLessPadding,
);

const kSmallDivider = Divider(
  color: YellowColor,
  thickness: 5.0,
);

final reviewList = [
  ReviewModal(

    image: 'assets/icons/icon_proflie.png',
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2023",
    comment:
        "جميل",
  ),
  ReviewModal(
    name: "Jana ",
    rating: 4.5,
    date: "17 Mar 2023",
    comment:
        "nice",
      image: 'assets/icons/icon_proflie.png'
  ),
  ReviewModal(

    name: "Michael Jordan",
    rating: 1.5,
    date: "12 Apr 2021",
    comment:"vergood", image: 'assets/icons/icon_proflie.png'),
  ReviewModal(
    image: 'assets/icons/icon_proflie.png',
    name: "Ali  ",
    rating: 2.0,
    date: "28 May 2022",
    comment:
        "مذهل",
  ),
  ReviewModal(

    image: 'assets/icons/icon_proflie.png',
    name: "mohmmed ",
    rating: 3,
    date: "01 Feb"
        " 2023",
    comment:
    "جميل",
  ),
  ReviewModal(
      name: "Jennifer ",
      rating: 4.5,
      date: "17 Mar 2023",
      comment:
      "nice",
      image: 'assets/icons/icon_proflie.png'
  ),
  ReviewModal(

      name: "Michael Jordan",
      rating: 1.5,
      date: "12 Apr 2021",
      comment:"vergood", image: 'assets/icons/icon_proflie.png'),

];

final cartItems = [
  CartModal(
      image: "assets/images/iMac.jpg",
      title: "Apple iMac All-In-One Desktop",
      desc: "60.96 cm (24-inch) (8-core Apple M1 chip/8 GB/256 GB), MJV93HN/A",
      price: 1712.34,
      quantity: 0),
  CartModal(
      image: "assets/images/watch.jpg",
      title: "SEIKO",
      desc: "Presage SRPD37J1",
      price: 557.84,
      quantity: 0),
  CartModal(
      image: "assets/images/book.jpg",
      title: "Carpe Diem",
      desc: "Paperback – Import, 26 May 2009",
      price: 24.89,
      quantity: 0),
  CartModal(
      image: "assets/images/joyStick.jpg",
      title: "Xbox Wireless Controller",
      desc: "Carbon Black",
      price: 76.12,
      quantity: 0),
  CartModal(
      image: "assets/images/shoes.jpg",
      title: "Nike Air Max 270",
      desc: "React Marathon Running Shoes/Sneakers Multi-Color DA2610-161",
      price: 120.00,
      quantity: 0),
  CartModal(
      image: "assets/images/dumbbell.jpg",
      title: "Cockatoo Dumbbell",
      desc: "Rubber Coated Professional Hex Dumbbell Set",
      price: 78.56,
      quantity: 0),
  CartModal(
      image: "assets/images/football.jpg",
      title: "Nivia Simbolo Football",
      desc: "Size 5 (White/Yellow)",
      price: 18.00,
      quantity: 0),
  CartModal(
      image: "assets/images/shirt.jpg",
      title: "Checked Casual Shirt",
      desc: "Flying Machine Men Yellow & Blue Regular Fit",
      price: 21.45,
      quantity: 0),
  CartModal(
      image: "assets/images/furniture.jpg",
      title: "Wolper Lounge Chair",
      desc: "Ivory Nude",
      price: 315.00,
      quantity: 0),
  CartModal(
      image: "assets/images/headPhone.jpg",
      title: "Sony WH-XB700 Wireless Bluetooth Headphones",
      desc:
          "Extra Bass Headphones with 30 Hours Battery Life, Passive Operation, Quick Charge, Headset with mic for Phone Calls with Alexa - (Black)",
      price: 128.26,
      quantity: 0),
  CartModal(
      image: "assets/images/camera.jpg",
      title: "Canon EOS M50 Mirrorless Camera",
      desc: "Camera with 15-45 mm Lens Kit",
      price: 756.22,
      quantity: 0),
];
