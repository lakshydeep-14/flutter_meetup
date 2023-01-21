import 'package:flutter/material.dart';
import 'package:flutter_meetup/item_card.dart';
import 'package:flutter_meetup/json_dummy.dart';

class ListArtist extends StatefulWidget {
  const ListArtist({super.key});

  @override
  State<ListArtist> createState() => _ListArtistState();
}

class _ListArtistState extends State<ListArtist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
          backgroundColor: Colors.deepOrange[800],
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
          ],
          title: const Text("Art Nepal"),
          elevation: 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            _recommendedCol(),
            const SizedBox(height: 10),
            categoryRow(context),
          ],
        ),
      ),
    );
  }
}

Widget _recommendedCol() {
  return Container(
    color: Colors.grey[100],
    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recommended",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ItemCard1(artists: data[index]);
              }),
        ),
      ],
    ),
  );
}

Widget categoryRow(BuildContext context) {
  int selectedIndex = 0;

  List categories = ['Painting', 'Tools', 'Vintage', 'Jweleries', 'Clothing'];

  Container cat(String title) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: selectedIndex == categories.indexOf(title)
                ? Border.all(color: Colors.black)
                : Border.all(color: Colors.grey)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title),
        ),
      );

  return Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.fromLTRB(5, 10, 15, 10),
          child: Row(
            children: [
              for (String c in categories) cat(c),
            ],
          ),
        ),
      ),
      lists(),
    ],
  );
}

Widget lists() {
  return Container(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
    child: ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        return ItemCard2(artists: data[index]);
      }),
    ),
  );
}
