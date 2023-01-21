import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_meetup/model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemCard1 extends StatelessWidget {
  final Artists artists;
  const ItemCard1({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: 120,
            width: 127,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage(artists.photo), fit: BoxFit.cover),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(20)),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[700],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 3),
                        child: Text(artists.rating,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ))),
            ),
          ),
          const SizedBox(height: 4),

          //  Title
          Text(artists.title),
        ],
      ),
    );
  }
}

class ItemCard2 extends StatelessWidget {
  final Artists artists;
  const ItemCard2({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Card(
        color: Colors.grey[200],
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        height: 150,
                        width: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(artists.photo),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container()),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(height: 3),
                          Text(artists.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              )),
                          Text(
                            artists.location,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: 'Category : ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: artists.category,
                                style: const TextStyle(color: Colors.black)),
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                                text: 'Price : ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: "NPR. " + artists.price,
                                style: const TextStyle(color: Colors.black)),
                          ])),
                          RatingBarIndicator(
                            rating: double.parse(artists.rating),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 21.0,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '                        More Details',
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
