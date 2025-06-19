class ProductModel {
  String? id;
  String? category_id;
  String? status;
  String? name;
  String? price;
  String? image;
  String? created_at;
  String? updated_at;

  ProductModel({
    required this.name,
    required this.id,
    required this.status,
    required this.image,
    required this.price,
    required this.category_id,
    required this.created_at,
    required this.updated_at,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json['name'],
    id: json['id'],
    status: json['status'],
    image: json['image'],
    price: json['price'],
    category_id: json['category_id'],
    created_at: json['created_at'],
    updated_at: json['updated_at'],
  );
}

class ProductDataModel {
  String? message;
  bool? status;
  List<ProductModel>? data;

  ProductDataModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) => ProductDataModel(
    status: json['status'],
    data: List<ProductModel>.from(json['data'].map((e) => ProductModel.fromJson(e))),
    message: json['message']);

}
