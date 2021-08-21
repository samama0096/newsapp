// ignore: camel_case_types
class articles {
  Source source;
  String author = '';
  String title = '';
  String description = '';
  String url = '';
  String urlToImage = '';
  String publishedAt = '';
  String content = '';

  articles(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  articles.fromJson(Map<String, dynamic> json) {
    if (json['source'] != null) {
      source = new Source.fromJson(json['source']);
    } else {
      source.name = 'source not available!';
      source.id = 'N/A';
    }
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}

class Source {
  String id;
  String name = '';

  Source(this.id, this.name);

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
