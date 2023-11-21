# atlas_news_app

The Atlas News App is an application developed using Flutter and Firebase. It provides a user-friendly interface for users to browse and read news articles. The app retrieves news data from a Firebase Firestore database and displays it in a paginated list.

## Components

1. main.dart
    - initializes Firebase, sets up the Firestore instance, and launches the `MyApp` widget.
    - `MyApp` is A stateless widget representing the overall structure of the app
2. news_list.dart
    - is a stateful widget that manages the list of news articles.
    - utilizes a `ScrollController` to detect when the user reaches the end of the list and triggers the loading of more news 
    - **Pagination**: this widget maintains a list of `DocumentSnapshot` objects(data record) retrieved from Firebase, and it fetches additional articles using pagination.
    - notify user by when no more news cannot be fetched
3. news_card.dart
    - Is a stateless widget `NewsCard` responsible for rendering a single news article card. 
    - Takes a `Map<String, dynamic>` as input, representing the details of a news article. The card displays: 
      - the article's thumbnail image, 
      - title, 
      - and article body
    - redirects user when user tap on the news card

## Screen shot
![Screenshot 2023-11-20 at 10 43 51 PM](https://github.com/xxxuduo2022/atlas_news_app/assets/89648748/93ad4629-5f40-438f-b96c-7eb1ad98e78a)

