import 'package:e_commerce/utils/constants/app_const.dart';
import 'package:e_commerce/utils/constants/utils_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var couponController = TextEditingController();

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
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.5,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: UtilsHelper.mProduct.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 6,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            UtilsHelper.mProduct[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 90,
                              child: Text(
                                "${UtilsHelper.mProduct[index]['title']}",
                                style: mTextStyle24(mFontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "Type",
                              style: mTextStyle14(mColors: Colors.grey),
                            ),
                            Text(
                              "Mrp",
                              style: mTextStyle16(mFontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Iconsax.trash,
                                  color: AppConstants.primaryColors,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right: 7, bottom: 5),
                                width: 113,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Iconsax.minus),
                                      ),
                                      Text("1"),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Iconsax.add),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(child: SizedBox(height: 10)),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
              color: Colors.white
            ),
            child: Column(
              children: [
                Container(
                  height : 60,
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
                ),SizedBox(height: 20,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: mTextStyle16(mFontWeight: FontWeight.normal,mColors: Colors.grey),),
                      Text("MRP", style: mTextStyle16(mFontWeight: FontWeight.bold,mColors: Colors.black),)
                    ],
                  ),
                ),SizedBox(height: 20,),Divider(height: 1,color: Colors.grey,thickness: 2,),SizedBox(height: 15,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: mTextStyle16(mFontWeight: FontWeight.normal,mColors: Colors.black),),
                      Text("MRP", style: mTextStyle16(mFontWeight: FontWeight.bold,mColors: Colors.black),)
                    ],
                  ),
                ),SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppConstants.primaryColors,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  ) ,child: Text("Checkout", style: mTextStyle24(mColors: Colors.white),)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
