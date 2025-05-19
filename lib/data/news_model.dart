class News {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const News({
    this.status,
    this.totalResults,
    this.articles,
  });

  News copyWith({String? status, int? totalResults, List<Article>? articles}) {
    return News(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles);
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: json['articles'] != null
            ? List<Article>.from(
                json['articles'].map((x) => Article.fromJson(x)))
            : []);
  }
}

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json['source']),
        author: json['author'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: DateTime.parse(json['publishedAt']),
        content: json['content'] ?? '');
  }
}

class Source {
  final String? id;
  final String? name;

  const Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }
}
