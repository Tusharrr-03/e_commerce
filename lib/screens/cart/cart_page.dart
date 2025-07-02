import 'package:e_commerce/screens/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/screens/cart/bloc/cart_event.dart';
import 'package:e_commerce/screens/cart/bloc/cart_state.dart';
import 'package:e_commerce/utils/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var couponController = TextEditingController();
  List<int> itemCounts = [];

  /// Count price according to the item in cart.
  int getCartTotal(CartLoadedState state) {
    int total = 0;
    for (int i = 0; i < state.mCartList.length; i++) {
      /*
          Todo : Price is taken in String and so first convert it into
                 double then to int.
      */
      total += ((double.tryParse(state.mCartList[i].price ?? '0') ?? 0.0) * itemCounts[i]).toInt();
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    itemCounts = List.generate(10, (index) => 1);
    context.read<CartBloc>().add(FetchAllItemsEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "My Cart",
          style: mTextStyle24(mFontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            return Column(
              children: [
                /// Cart List
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: state.mCartList.isNotEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.mCartList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Card(
                          color: Colors.white,
                          elevation: 6,
                          child: Row(
                            children: [
                              /// Image
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  state.mCartList[index].image!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 8),

                              /// Product Detail
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 90,
                                    child: Text(
                                      "${state.mCartList[index].name}",
                                      style: mTextStyle24(
                                        mFontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "₹ ${state.mCartList[index].price!}",
                                    style: mTextStyle16(
                                      mFontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8),

                              /// Delete and Qty Update
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                        DeleteItemEvent(
                                          productIndex: state
                                              .mCartList[index].id!,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Iconsax.trash,
                                      color: AppConstants.primaryColors,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  /// Quantity Changer
                                  Container(
                                    padding: EdgeInsets.all(3),
                                    width: 113,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (itemCounts[index] > 1) {
                                                itemCounts[index]--;
                                                setState(() {});
                                              }
                                            },
                                            child: Icon(Iconsax.minus),
                                          ),
                                          Text("${itemCounts[index]}"),
                                          InkWell(
                                            onTap: () {
                                              itemCounts[index]++;
                                              setState(() {});
                                            },
                                            child: Icon(Iconsax.add),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                      : Center(child: Text("Cart Empty")),
                ),

                SizedBox(height: 10),

                /// Cart Summary Section
                Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      /// Coupon Input
                      Container(
                        height: 60,
                        child: TextField(
                          controller: couponController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: "Enter Discount Code",
                            suffix: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Apply",
                                style: mTextStyle16(
                                  mColors: AppConstants.primaryColors,
                                  mFontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      /// Subtotal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: mTextStyle16(
                              mFontWeight: FontWeight.normal,
                              mColors: Colors.grey,
                            ),
                          ),
                          Text(
                            "₹${getCartTotal(state)}",
                            style: mTextStyle16(
                              mFontWeight: FontWeight.bold,
                              mColors: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Divider(height: 1, color: Colors.grey, thickness: 2),
                      SizedBox(height: 15),

                      /// Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: mTextStyle16(
                              mFontWeight: FontWeight.normal,
                              mColors: Colors.black,
                            ),
                          ),
                          Text(
                            "₹${getCartTotal(state)}",
                            style: mTextStyle16(
                              mFontWeight: FontWeight.bold,
                              mColors: Colors.black,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      /// Checkout Button
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppConstants.primaryColors,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text(
                            "Checkout",
                            style: mTextStyle24(mColors: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          if (state is CartLoadingState) {
            //print("Cart Loading : ${state.toString()}");
            return Center(child: CircularProgressIndicator());
          }

          if (state is CartFailureState) {
            return Center(child: Text(state.errMsg));
          }

          return Container();
        },
      ),

    );
  }
}
