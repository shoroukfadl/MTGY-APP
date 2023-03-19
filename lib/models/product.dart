import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, description;
  final String image;
  final double  price;


  Service({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Service> demoServices = [
  Service(
    id: 1,
    image: "assets/icons/pound.png",
    title: "Service 1",
    price: 64.99,
    description: description,
  ),
  Service(
    id: 2,
    image: "assets/icons/pound.png",

    title: "Service 2",
    price: 50.5,
    description: description,
  ),
  Service(
    id: 3,
    image: "assets/icons/pound.png",

    title: "Service 3",
    price: 36.55,
    description: description,
  ),
  Service(
    id: 4,
    image:
      "assets/icons/pound.png",

    title: "Service 4",
    price: 20.20,
    description: description,

  ),
  Service(
    id: 1,
    image: "assets/icons/pound.png",
    title: "Service 1",
    price: 64.99,
    description: description,
  ),
  Service(
    id: 2,
    image: "assets/icons/pound.png",

    title: "Service 2",
    price: 50.5,
    description: description,
  ),
  Service(
    id: 3,
    image: "assets/icons/pound.png",

    title: "Service 3",
    price: 36.55,
    description: description,
  ),
  Service(
    id: 4,
    image:
    "assets/icons/pound.png",

    title: "Service 4",
    price: 20.20,
    description: description,

  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";