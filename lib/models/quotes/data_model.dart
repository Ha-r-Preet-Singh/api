import 'package:api_intro_46/models/quotes/quote_model.dart';

class DataModel{


  List<QuoteModel> quotes;
  int limit;
  int skip;
  int total;

  DataModel({
   required this.quotes,
   required this.limit,
   required this.skip,
   required this.total});



  //map to model
  factory DataModel.fromJson(Map<String,dynamic> json){
    List<QuoteModel> mQuotes = [];
    for(Map<String,dynamic> quote in json["quotes"] ){

      mQuotes.add(
          QuoteModel.fromJson(quote),
      );
    }




    return DataModel(
    quotes: mQuotes,
    limit: json["limit"],
  skip: json["skip"],
  total: json["total"]
    );

  }
}