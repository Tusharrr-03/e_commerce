abstract class CartEvent{}

class AddToCartEvent extends CartEvent{
  int productId;
  int qty;
  AddToCartEvent({required this.qty, required this.productId});
}