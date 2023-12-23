import 'package:api_intro_46/models/products/product_model.dart';

class DataProductModel {
  int? limit;
  List<ProductModel>? products;
  int? skip;
  int? total;

  DataProductModel({
    this.limit,
    this.products,
    this.skip,
    this.total,
  });

  factory DataProductModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> mProducts = [];

    for (Map<String, dynamic> eachProduct in json["products"]) {
      mProducts.add(ProductModel.fromJson(eachProduct));
    }

    return DataProductModel(
      limit: json["limit"],
      products: mProducts,
      skip: json["skip"],
      total: json["total"],
    );
  }
}
