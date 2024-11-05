import 'package:flutter/material.dart';
import '../widgets/portrait_card.dart';

class NewMatchesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> newMatches;

  const NewMatchesScreen({Key? key, required this.newMatches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('New matches for you'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: newMatches.length,
        itemBuilder: (context, index) {
          final match = newMatches[index];
          return PortraitCard(
            photoUrl: match['photoUrl'],
            isVerified: match['isVerified'],
            userId: match['userId'],
            name: match['name'],
            age: match['age'],
            location: match['location'],
            initialLiked: false,
            onLikeChanged: (isLiked) {
              print('User ${match['name']} liked: $isLiked');
            },
          );
        },
      ),
    );
  }
}
