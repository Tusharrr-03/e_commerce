class CartModel {
  int? id;
  int? product_id;
  int? quantity;
  String? image;
  String? price;
  String? name;

  CartModel({
    required this.name,
    required this.id,
    required this.price,
    required this.image,
    required this.product_id,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      name: json['name'],
      id: json['id'],
      price: json['price'],
      image: json['image'],
      product_id: json['product_id'],
      quantity: json['quantity'],
    );
  }
}

class GetPrice {
  List<CartModel> cartModel;
  double subtotal;
  double total;

  GetPrice({
    required this.total,
    required this.cartModel,
    required this.subtotal,
  });

  factory GetPrice.initial() => GetPrice(
    cartModel: [],
    subtotal: 0.0,
    total: 0.0,
  );
}
