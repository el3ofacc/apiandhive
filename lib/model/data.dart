 

class Data {
  String? title;
  String? description;
  String? image;
  Data(this.description, this.image, this.title);
  Data.fromjson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['urlToImage'];
  }
}
