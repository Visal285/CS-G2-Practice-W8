import 'package:flutter/material.dart';

import 'data/jokes.dart';

const Color appColor = Color(0xFF81C784);

void main() => runApp(
  MaterialApp(debugShowCheckedModeBanner: false, home: const JokeListApp()),
);

class JokeListApp extends StatefulWidget {
  const JokeListApp({super.key});

  @override
  State<JokeListApp> createState() => _JokeListAppState();
}

class _JokeListAppState extends State<JokeListApp> {
  int? _favoriteIndex;

  void _selectFavorite(int index) {
    setState(() {
      _favoriteIndex = _favoriteIndex == index ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Favorite Jokes'),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return FavoriteCard(
            title: joke.title,
            description: joke.description,
            isFavorite: _favoriteIndex == index,
            onFavoriteClick: () => _selectFavorite(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
