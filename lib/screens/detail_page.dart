import 'package:e_commerce/screens/cart_page.dart';
import 'package:e_commerce/utils/app_const.dart';
import 'package:e_commerce/utils/utils_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatefulWidget {
  Map<String, dynamic> productDetail;
  DetailPage({required this.productDetail});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MediaQueryData? mediaQueryData;

  double mHeight = 0.0;

  double mWidth = 0.0;

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    mHeight = mediaQueryData!.size.height;
    mWidth = mediaQueryData!.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.share),
              ),
              SizedBox(width: 10),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.heart),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Image
            Container(
              width: double.infinity,
              height: mHeight * 0.4,
              child: Image.asset("${widget.productDetail['image']}"),
            ),
            /// Details of the Product.
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: mHeight * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.productDetail['title']}",
                    style: mTextStyle24(mFontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${widget.productDetail['mrp']}",
                    style: mTextStyle24(mFontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppConstants.primaryColors,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "4.8",
                                style: mTextStyle16(mColors: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Center(
                            child: Text(
                              "(320 Review)",
                              style: mTextStyle16(mColors: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${widget.productDetail['seller']}",
                        style: mTextStyle16(mFontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Color",
                    style: mTextStyle24(mFontWeight: FontWeight.w900),
                  ),
                  Container(
                    width: 200,
                    height: 60,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: UtilsHelper.mColors.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: UtilsHelper.mColors[index]['color'],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      UtilsHelper.mProductDetails.length,
                          (index) {
                        return InkWell(
                          onTap: (){
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            width: index == 1 ? 130 : (index == 0 ? 120 : 110),
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color:
                              selectedIndex == index
                                  ? AppConstants.primaryColors
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Center(
                              child: Text(
                                UtilsHelper.mProductDetails[index],
                                style: mTextStyle14(mColors: selectedIndex == index ? Colors.white : Colors.black),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                        'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                        'nisi ut aliquip ex ea commodo consequat.',
                    style: TextStyle(fontSize: 16),
                  ),SizedBox(height: 10,),
                  Center(
                    child: Container(
                      width: 320,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppConstants.secondaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    print("Button Tap");
                                  },
                                  child: Icon(Iconsax.minus, color: Colors.white,),
                                ),
                                Text("1", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                                InkWell(
                                  onTap: (){
                                    print("Button Tap");
                                  },
                                  child: Icon(Iconsax.add, color: Colors.white,),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            margin: EdgeInsets.only(right: 15),
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                            }, style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                              backgroundColor: AppConstants.primaryColors,
                              foregroundColor: Colors.white
                            ) ,child: Text("Add to Cart")),
                          )
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
  }
}

