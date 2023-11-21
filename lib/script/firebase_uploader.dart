import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseNewsUploader {
  final FirebaseFirestore _firestore;
  final String _collectionName;
  final List<Map<String, dynamic>> _dummyNewsData = [
  {
  "title": "NASA's Perseverance Rover Sends Stunning Images from Mars",
  "body": "The Perseverance rover, NASA's latest Mars rover, has sent back breathtaking images from the Martian surface.",
  "thumbnail": "https://mars.nasa.gov/msl-raw-images/msss/03141/mcam/3141ML0163500041304999E01_DXXX.jpg",
  "url": "https://mars.nasa.gov/msl/",
  },
  {
  "title": "Tesla Announces Record-breaking Quarterly Profits",
  "body": "Electric car maker Tesla reported record-breaking profits in the latest quarter, surpassing expectations.",
  "thumbnail": "https://i.imgur.com/Y0oIUnh.jpg",
  "url": "https://www.tesla.com/",
  },
  {
  "title": "SpaceX Launches Starlink Satellites into Orbit",
  "body": "SpaceX successfully launched a batch of Starlink satellites, bringing global satellite internet closer to reality.",
  "thumbnail": "https://i.imgur.com/zwgM1K5.jpg",
  "url": "https://www.spacex.com/",
  },
  {
  "title": "Google Unveils Latest Pixel Smartphone with Impressive Camera Features",
  "body": "Google has revealed its newest Pixel smartphone, showcasing advanced camera capabilities and improved performance.",
  "thumbnail": "https://store.google.com/us/product/pixel_6?hl=en-US",
  "url": "https://store.google.com/us/product/pixel_6?hl=en-US",
  },
  {
  "title": "Amazon Prime Day Deals Attract Millions of Shoppers",
  "body": "Amazon's Prime Day event drew massive numbers of online shoppers seeking exclusive deals and discounts.",
  "thumbnail": "https://i.imgur.com/JMng6CN.jpg",
  "url": "https://www.amazon.com/",
  },
  // ... other news entries
  ];

  FirebaseNewsUploader({required FirebaseFirestore firestore, required String collectionName})
      : _firestore = firestore,
        _collectionName = collectionName;

  Future<void> uploadNews(List<Map<String, dynamic>> newsDataList) async {
    // Get a reference to the collection
    CollectionReference newsCollection = _firestore.collection(_collectionName);

    // Upload news data to Firestore
    for (var newsData in newsDataList) {
      await newsCollection.add(newsData);
    }

    print("News objects added to Firestore.");
  }

  Future<void> uploadDummyData() async {
    // Get a reference to the collection
    CollectionReference newsCollection = _firestore.collection(_collectionName);

    // Upload news data to Firestore
    for (var newsData in _dummyNewsData) {
      await newsCollection.add(newsData);
    }

    print("News objects added to Firestore.");
  }
}
