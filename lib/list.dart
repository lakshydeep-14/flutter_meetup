import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_meetup/details.dart';
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
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailsScreen(artists: data[i]))),
                child: Text("Item"));
          }),
    );
  }
}
