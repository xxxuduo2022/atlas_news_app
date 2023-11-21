import 'package:atlas_news_app/news_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Create Firestore instance, uncomment it to add data records to database.
  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // await FirebaseNewsUploader(
  //     firestore: firestore,
  //     collectionName: 'news',
  //   ).uploadDummyData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: NewsList()
    );
  }
}



