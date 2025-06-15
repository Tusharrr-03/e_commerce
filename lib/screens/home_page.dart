import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:e_commerce/screens/detail_page.dart';
import 'package:e_commerce/utils/app_const.dart';
import 'package:e_commerce/utils/utils_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  var queryTextController = TextEditingController();
  MediaQueryData? mediaQueryData;
  double mHeight = 0.0;
  double mWidth = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            /// Top of the Screen to the text field area
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                          ),
                          child: Icon(Iconsax.menu),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade100,
                          ),
                          child: Icon(Iconsax.notification),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    TextField(
                      controller: queryTextController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintStyle: mTextStyle14(),
                        hintText: "Search",
                        prefixIcon: Icon(Iconsax.search_normal),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 1,
                                height: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              Icon(Iconsax.setting_4),
                            ],
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Poster of the screen
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Poster_e-commerce.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Super Sale",
                          style: mTextStyle24(mFontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Discount",
                          style: mTextStyle34(mFontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              "Up to",
                              style: mTextStyle24(mFontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "50%",
                              style: mTextStyle34(mFontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 160,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: AppConstants.primaryColors,
                            ),
                            child: Text(
                              "Shop me",
                              style: mTextStyle16(mColors: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// Categories Sections
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: UtilsHelper.mCategories.length,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            UtilsHelper.mCategories[index]['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("${UtilsHelper.mCategories[index]['title']}"),
                    ],
                  );
                },
              ),
            ),

            /// Grid View
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Special For You",
                          style: mTextStyle24(mFontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See all",
                            style: mTextStyle16(mColors: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 285,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: UtilsHelper.mProduct.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              /// to pass the the index of the product for detail page make the constructor of the detail page.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailPage(
                                        /// Constructor of the detail page calling here.
                                        productDetail:
                                            UtilsHelper.mProduct[index],
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "${UtilsHelper.mProduct[index]['image']}",
                                    width: 100,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),

                                  /// Title
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "${UtilsHelper.mProduct[index]['title']}",
                                      style: mTextStyle16(
                                        mFontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),

                                  /// Rupees and Colors
                                  Row(
                                    children: [
                                      Text("₹ 9,600"),
                                      SizedBox(width: 40),
                                      SizedBox(
                                        height: 15,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: UtilsHelper.mColors.length,
                                          itemBuilder: (_, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 1,
                                              ),
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    UtilsHelper
                                                        .mColors[index]['color'],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
