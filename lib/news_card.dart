import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> articleData;
  NewsCard({required this.articleData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            _launchUrl(context, articleData['url']);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildImage(articleData['thumbnail']),
              _buildTitle(articleData['title']),
              _buildBody(articleData['body']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String? imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: CachedNetworkImage(
        placeholder: (BuildContext context, String url) =>
            Container(
              height: 200.0,
              color: Colors.grey[300],
            ),
        errorWidget: (BuildContext context, String url, dynamic error) =>
        const SizedBox(),
        imageUrl: imageUrl ?? '',
        fit: BoxFit.cover,
        height: 200.0,
      ),
    );
  }

  Widget _buildTitle(String? title) {
    return ListTile(
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBody(String? body) {
    return ListTile(
      subtitle: Text(
        body ?? '',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Future<void> _launchUrl(BuildContext context, String? url) async {
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // Notify users which urls are inaccessible.
          content: Text('URL: $url not available or cannot be launched'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    }
  }

}
