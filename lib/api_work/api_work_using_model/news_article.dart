class NewsArticle {
  //chahine kuramatra class ma declare gareko
  final String? title;
  final String? author;
  final String? urlToImage;
  final String? publishedAt;

  //constructor banayeko
  NewsArticle({
    required this.title,
    required this.author,
    required this.urlToImage,
    required this.publishedAt,
  });
  //Aba json data lai dart ma convert garna ko lagi yeuta method banauna parxa
  //factory keyword chai yeuta Constructor nai ho jasle chai already exist instance of object or naya object ko instance chai new way bata banauxa
  //factory praya json lai dart convert garne method banauda badi use garinxa.

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      author: json['author'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}
