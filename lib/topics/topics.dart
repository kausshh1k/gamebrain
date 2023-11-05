import 'package:flutter/material.dart';
import 'package:gamebrain/shared/bottom_nav.dart';
import 'package:gamebrain/services/services.dart';
import 'package:gamebrain/shared/error.dart';
import 'package:gamebrain/shared/loading.dart';
import 'package:gamebrain/topics/drawer.dart';
import 'package:gamebrain/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return ErrorMessage(message: snapshot.error.toString());
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                title: const Text('Topics'),
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children:
                    topics.map((topic) => TopicItem(topic: topic)).toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Text('No topics found in Firestore. Check database');
          }
        });
  }
}
