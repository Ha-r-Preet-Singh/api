class QuoteModel {

  int id;
  String quote;
  String author;

  QuoteModel({
    required this.id,
    required this.quote,
    required this.author});



  //json to map
  factory QuoteModel.fromJson(Map<String,dynamic> json){
    return QuoteModel(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
    );


  }
}