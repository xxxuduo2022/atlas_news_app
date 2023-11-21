import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'news_card.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  late ScrollController _scrollController;
  late List<DocumentSnapshot> _articles;
  bool _isLoading = false;
  final _pageSize = 5;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _articles = [];
    _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atlas News App'),
      ),
      body: _buildNewsList(),
    );
  }

  Widget _buildNewsList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        var articleData = _articles[index].data() as Map<String, dynamic>;
        return NewsCard(articleData: articleData);
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchNews();
    }
  }

  void _fetchNews() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      QuerySnapshot<Object?> querySnapshot;

      if (_articles.isNotEmpty) {
        querySnapshot = await FirebaseFirestore.instance
            .collection('news')
            .orderBy('title')
            .startAfterDocument(_articles.last)
            .limit(_pageSize)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('news')
            .orderBy('title')
            .limit(_pageSize)
            .get();
      }

      setState(() {
        _isLoading = false;
        _articles.addAll(querySnapshot.docs);
      });
    }
  }
}
