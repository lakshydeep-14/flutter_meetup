import 'package:flutter/material.dart';

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
          backgroundColor: Colors.deepOrange,
          title: const Text(""),
          elevation: 0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
              const Text("Tools",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(
                  height: 130,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Card();
                  })),
              const SizedBox(height: 13),
              const Text("Jweleries",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(
                  height: 130,
                  child: Container(

                      // TODO : add cards here
                      )),
              const SizedBox(height: 13),
              const Text("Clothing",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(
                  height: 130,
                  child: Container(

                      // TODO : add cards here
                      )),
              const SizedBox(height: 13),
              const Text("Vintage",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              SizedBox(
                  height: 130,
                  child: Container(

                      // TODO : add cards here
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
