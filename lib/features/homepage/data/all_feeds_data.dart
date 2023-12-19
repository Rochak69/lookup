class AllFeeds {
  AllFeeds({required this.feedTitle, this.data});
  String feedTitle;
  List<FeedData>? data;
}

class FeedData {
  FeedData({
    required this.id,
    required this.image,
  });
  int id;
  String image;
}
