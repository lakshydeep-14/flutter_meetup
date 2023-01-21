import 'package:advanced_rich_text/advanced_rich_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meetup/model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:intl/intl.dart';

Color mainColor = const Color(0xff114352);

class DetailsScreen extends StatefulWidget {
  final Artists artists;
  const DetailsScreen({super.key, required this.artists});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Text(
      //   widget.artists.title,
      // )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Quantity
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              height: 52,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: mainColor,
              ),
              child: InputQty(
                maxVal: 100,
                initVal: 2,
                minVal: 0,
                btnColor1: Colors.white,
                btnColor2: Colors.white,
                borderShape: BorderShapeBtn.circle,
                boxDecoration: const BoxDecoration(),
                steps: 1,
                onQtyChanged: (val) {
                  print(val);
                },
              ),
            ),

            const SizedBox(
              width: 30,
            ),

            //buy now button
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              height: 52,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: mainColor,
              ),
              child: const Center(
                child: Text(
                  'Buy Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                _image(widget.artists.photo),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.artists.title,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              _rating(double.parse(widget.artists.rating)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _price(widget.artists.price),
                              _location(widget.artists.location)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _artistImage(widget.artists.artistPhoto),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.artists.artistName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                "Added on: ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              _date(DateTime.now()),
                            ],
                          )
                        ],
                      ),
                      _desc(widget.artists.desc),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  _location(String name) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: mainColor,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        )
      ],
    );
  }

  _artistImage(String url) {
    return Container(
      height: 40,
      width: 40,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          )),
    );
  }

  _date(DateTime dateTime) {
    return Text(
      DateFormat('dd-MM-yyyy').format(dateTime),
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  _desc(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        name,
        textAlign: TextAlign.justify,
      ),
    );
  }

  _price(String price) {
    return AdvanceRichText(
        initialTextStyle: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: mainColor),
        secondaryTextStyle:
            TextStyle(fontWeight: FontWeight.bold, color: mainColor),
        textList: [TextSpanList(text: price)],
        initialText: "NPR. ");
  }

  _image(String url) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 15,
            left: 15,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration:
                    BoxDecoration(color: mainColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _rating(double star) {
    return RatingBarIndicator(
      rating: star.toDouble(),
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 21.0,
      direction: Axis.horizontal,
    );
  }
}
