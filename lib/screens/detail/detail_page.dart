import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/Routes_Helper/routes_helper.dart';
import 'package:e_commerce/data/remote/models/product_model.dart';
import 'package:e_commerce/screens/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/screens/cart/bloc/cart_event.dart';
import 'package:e_commerce/screens/cart/bloc/cart_state.dart';
import 'package:e_commerce/screens/cart/cart_page.dart';
import 'package:e_commerce/utils/constants/app_const.dart';
import 'package:e_commerce/utils/constants/utils_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  MediaQueryData? mediaQueryData;
  double mHeight = 0.0;
  double mWidth = 0.0;
  int selectedIndex = 0;
  int curIndex = 1;
  ProductModel? currModel;
  bool isLoading = false;
  late final CarouselSliderController _carouselSliderController;

  List<String> images = [
    'assets/images/boat_ear_burds.png',
    'assets/images/boat_ear_burds.png',
    'assets/images/boat_ear_burds.png',
    'assets/images/boat_ear_burds.png',
    'assets/images/boat_ear_burds.png',
  ];
  List<Color> colorsList = [
    Color(0xff921D30),
    Color(0xff151515),
    Color(0xff1D4492),
    Color(0xff90471E),
    Color(0xffD9D7D7),
  ];

  @override
  void initState() {
    super.initState();
    _carouselSliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    currModel = ModalRoute.of(context)!.settings.arguments as ProductModel;
    images = List.generate(5, (index) {
      return currModel!.image!;
    });

    mediaQueryData = MediaQuery.of(context);
    mHeight = mediaQueryData!.size.height;
    mWidth = mediaQueryData!.size.width;
    print("Screen Width : $mWidth");
    print("Screen Height : $mHeight");

    bool isSmallScreen = mWidth < 600;
    bool isMediumScreen = mWidth >= 600 && mWidth < 1024;
    bool isLargeScreen = mWidth >= 1024;

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
      body: Stack(
        children: [
          /// Image Slider Positioned
          Positioned(
            top: mHeight * 0.01,
            left: 0,
            right: 0,
            child: Container(
              height: 280,
              width:
                  isSmallScreen
                      ? mWidth * 0.9
                      : isMediumScreen
                      ? mWidth * 0.6
                      : mWidth * 0.4,
              child: CarouselSlider.builder(
                carouselController: _carouselSliderController,
                itemCount: images.length,
                itemBuilder: (_, index, realIndex) {
                  return Image.network("${images[index]}");
                },
                options: CarouselOptions(
                  height: 210,
                  viewportFraction: 1.1,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  enlargeCenterPage: false,
                ),
              ),
            ),
          ),

          /// Product Details Positioned Below
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: DraggableScrollableSheet(
              initialChildSize: 0.8,
              maxChildSize: 1,
              minChildSize: 0.7,
              builder: (context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: mWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(51),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 3,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            currModel!.name!,
                            style: mTextStyle24(mFontWeight: FontWeight.w800),
                          ),
                        ),
                        Container(
                          child: Text(
                            "₹ ${currModel!.price!}",
                            style: mTextStyle24(mFontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 220,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: AppConstants.primaryColors,
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: Text(
                                  "★ ${4.8}",
                                  style: mTextStyle16(mColors: Colors.white),
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                child: Text(
                                  "(320 Review)",
                                  style: mTextStyle16(mColors: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Color",
                          style: mTextStyle34(mFontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 10),

                        /// Colors Gird
                        Row(
                          children: List.generate(
                            colorsList.length,
                            (index) => InkWell(
                              onTap: () {
                                //print("Button Tap");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 7),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: colorsList[index],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        /// Tab Grid
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            UtilsHelper.mProductDetails.length,
                            (index) => InkWell(
                              onTap: () {
                                selectedIndex = index;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
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
                                    style: mTextStyle14(
                                      mColors:
                                          selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),

                        /// Dynamic Content Based on selectedIndex
                        if (selectedIndex == 0)
                          Text(
                            'This is the description of the product. It includes features, usage instructions, and benefits.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          )
                        else if (selectedIndex == 1)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "★ 4.8 - Excellent services!",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "★ 4.5 - Worth the price.",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "★ 4.0 - Could be better in packaging.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        else if (selectedIndex == 2)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "• Item: ${currModel!.name}",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "• Storage: 128/4",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                "• Warranty: 12 Months",
                                style: TextStyle(fontSize: 16),
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

          /// Bottom Bar / Add to cart option
          Positioned(
            bottom: 20,
            top: mHeight * 0.8,
            left: 20,
            right: 20,
            child: Container(
              width:
                  isSmallScreen
                      ? mWidth * 0.8
                      : isMediumScreen
                      ? mWidth * 0.6
                      : mWidth * 0.4,
              decoration: BoxDecoration(
                color: AppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(31),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Item Count Increase
                  Container(
                    width: 100,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (curIndex >= 1) {
                              curIndex--;
                            }
                            setState(() {});
                          },
                          child: Icon(Iconsax.minus, color: Colors.white),
                        ),
                        Text(
                          "$curIndex",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            curIndex++;
                            setState(() {});
                            print(curIndex);
                          },
                          child: Icon(Iconsax.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  /// Add to cart Option
                  Container(
                    width: 150,
                    height: 40,
                    margin: EdgeInsets.only(right: 15),
                    child: BlocListener<CartBloc, CartState>(
                      listener: (context, state) {
                        if (state is CartLoadingState) {
                          isLoading = true;
                          setState(() {});
                        }
                        if (state is CartFailureState) {
                          isLoading = false;
                          print("Error message : ${state.errMsg}");
                          setState(() {});
                        }
                        if (state is CartSuccessState) {
                          isLoading = false;
                          setState(() {});
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.ROUTEHOMESCREEN,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text("Item added successfully!"),
                              ),
                            ),
                          );
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<CartBloc>().add(AddToCartEvent(qty: curIndex, productId: int.parse(currModel!.id!)));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor: AppConstants.primaryColors,
                          foregroundColor: Colors.white,
                        ),
                        child: Text("Add to Cart"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
