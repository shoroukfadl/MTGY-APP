import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  final List<Map<String, dynamic>> _allServices = [
    {"id": 1, "name": "Hotel 1", "address": "fayoum ,abshway"},
    {"id": 2, "name": "Hotel 2", "address": "fayoum ,fayoum"},
    {"id": 3, "name": "Hotel 3", "address": "fayoum ,qroun"},
    {"id": 4, "name": "Hotel 4", "address": "fayoum ,selyeen"},
    {"id": 5, "name": "Hotel 5", "address": "fayoum ,shaksok"},
    {"id": 6, "name": "Hotel 6", "address": "fayoum ,abshway"},

  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundServices = [];

  @override
  initState() {
    _foundServices = _allServices;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allServices;
    } else {
      results = _allServices
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: WhiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: BlueColor,
                            offset: Offset(0, 1),
                            blurRadius: 3.0,
                            spreadRadius: 1.0,
                          ),
                        ]), //icon inside button,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: YellowColor,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 40),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: BlueColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: BlueColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "search For Services ",
                      labelStyle: GoogleFonts.acme(
                          color: BlueColor.withOpacity(0.6), fontSize: 15),
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                        color: YellowColor,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _foundServices.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundServices.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Card(
                        key: ValueKey(_foundServices[index]["id"]),
                        color: BlueColor,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                            leading: Text(
                              _foundServices[index]["id"].toString(),
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: YellowColor),
                              ),
                            ),
                            title: Text(
                              _foundServices[index]['name'],
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: YellowColor),
                              ),
                            ),
                            subtitle: Text(
                              '${_foundServices[index]["address"].toString()} ',
                              style: GoogleFonts.acme(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: WhiteColor),
                              ),
                            )),
                      ),
                    ),
                  )
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}
