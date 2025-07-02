abstract class CartEvent{}

class AddToCartEvent extends CartEvent{
  int productId;
  int qty;
  AddToCartEvent({required this.qty, required this.productId});
}

class FetchAllItemsEvents extends CartEvent{

}

class DeleteItemEvent extends CartEvent{
  int productIndex;
  DeleteItemEvent({required this.productIndex});
}

class UpdateItemListEvent extends CartEvent{
  final String productId;
  final int newQty;

  UpdateItemListEvent({required this.productId, required this.newQty});
}

class GetPrice extends CartEvent{
  final subTotal;
  final total;

  GetPrice({required this.total, required this.subTotal});
}
