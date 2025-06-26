abstract class CartState{}

class CartInitialState extends CartState{}
class CartLoadingState extends CartState{}
class CartSuccessState extends CartState{}
class CartFailureState extends CartState{
  String errMsg;
  CartFailureState({required this.errMsg});
}
