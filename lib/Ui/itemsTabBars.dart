import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_club/Ui/toast_message.dart';
import 'package:menu_club/bloc/productsBloc/products_bloc.dart';
import 'package:menu_club/repositories/modelClass/allCategoriesModel.dart';
import 'package:menu_club/repositories/modelClass/productsModel.dart';

import 'editOrder.dart';


class ItemsTabBars extends StatefulWidget {
 final String  name;
 final String  number;
 final String  phone;
 final String  tableNo;
  const ItemsTabBars({
    Key? key, required this.name, required this.cat, required this.number, required this.phone, required this.tableNo

  }) : super(key: key);

  final List<AllCategoriesModel> cat;
  @override
  State<ItemsTabBars> createState() => _ItemsTabBarsState();
}

class _ItemsTabBarsState extends State<ItemsTabBars>
    with TickerProviderStateMixin {
  late List<AllCategoriesModel> categories = [];
  late TabController _tabController;
  late PageController _pageController;
  late List<ProductsModel> items = [];
  int selectedIndex = 0;
  List<String> opt = [];
  bool isSelectedQ = false;
  bool isSelectedH = false;
  bool isSelectedF = false;
  String selectedContainer = "";
  List<Widget> myTabsContent = [];
  int current = 0;
  bool A = false;
  String name='';
  String image='';

  PageController pageController = PageController();
  TextEditingController quantity =TextEditingController();
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        current = pageController.page!.round();
      });
    });

    _tabController = TabController(length: widget.cat.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _pageController = PageController(initialPage: 0);
    BlocProvider.of<ProductsBloc>(context).add(FetchProducts(id: widget.cat[0].id.toString()),
    );

    categories =widget.cat;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _fetchProductsForTabIndex(_tabController.index);
      _pageController.animateToPage(
        _tabController.index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void _fetchProductsForTabIndex(int index) {
    BlocProvider.of<ProductsBloc>(context).add(
      FetchProducts(id: widget.cat[index].id.toString()),
    );

  }

  List <String> itemName = [];
  List <String> itemQuantity = [];
  List <double> itemPrice = [];


  int selectedItemIndex = 0;
  int ProductquantityIndex = 0;
  int ProductpriceIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffff3333),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.h),
          child: AppBar(
            backgroundColor: Color(0xffff3333),
            leadingWidth: 300.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 22.w, top: 10.h),
              child: Text(
                "Items",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.w, bottom: 8.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset(
                    'assets/Group 226.png',
                    height: 36.h,
                    width: 36.w,
                  ),
                ),
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30.h),
              child:  TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Color(0xffff3333),
                      padding: EdgeInsets.only(left: 10.w),
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                      ),
                      labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      tabs: widget.cat.asMap().entries.map((MapEntry<int, AllCategoriesModel> entry) {
                        return Container(
                          height: 33.h,
                          width: 83.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.white, width: 1.w),
                          ),
                          child: Center(
                            child: Text(
                              entry.value.name.toString() ,
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              // BlocProvider.of<ProductsBloc>(context).add(FetchProducts(id:  entry.value.id.toString()));
                            ),
                          ),
                        );
                      }).toList(),
                    )
              ),
            ),
          ),

        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Container(
                  height: 510.h,
                  child: BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductsBlocLoading) {
                        print("loading");
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is ProductsBlocError) {
                        return Center(child: Text("Error"));
                      }

                      if (state is ProductsBlocLoaded) {
                        items = BlocProvider.of<ProductsBloc>(context).productsModel;



                        return PageView.builder(
                            controller: _pageController,
                            onPageChanged: (entry) {
                              _tabController.animateTo(entry);
                              print(entry);

                            },
                            itemCount: widget.cat.length,
                            itemBuilder: (BuildContext context,index) {
                              return GridView.builder(
                                itemCount: items.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 1.1,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: [
                                              // Check if the image URL is null, empty, or invalid
                                              (items[index].products?.image == null || items[index].products!.image.toString().isEmpty ||
                                                  !(Uri.tryParse(items[index].products!.image.toString())?.isAbsolute ?? false))
                                                  ? Image.asset(
                                                "assets/empty.png",
                                                fit: BoxFit.cover,
                                              )
                                                  : Image.network(
                                               image= items[index].products!.image.toString(),
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) {
                                                  // Handle errors that occur during image loading
                                                  print("Error loading image: $error");
                                                  return Image.asset(
                                                    "assets/empty.png",
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                backgroundColor:
                                                Colors.transparent,
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                    builder: (BuildContext
                                                    context,
                                                        void Function(
                                                            void Function())
                                                        setState) {
                                                      return Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 10.w,
                                                            right: 10.w),
                                                        child: Container(
                                                          width: 222.w,
                                                          height: A == false
                                                              ? 384.h
                                                              : 500.h,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.only(
                                                              topRight:
                                                              Radius.circular(
                                                                  50.r),
                                                              topLeft:
                                                              Radius.circular(
                                                                  50.r),
                                                            ),
                                                            color:
                                                            Color(0xffff3333),
                                                          ),
                                                          child:
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                            Axis.vertical,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                Padding(
                                                                  padding:  EdgeInsets
                                                                      .only(top: 10.h),
                                                                  child: Center(
                                                                    child: Text(
                                                                    name = items[index].products!.name.toString(),
                                                                      style: GoogleFonts.playfairDisplay(
                                                                          fontSize:
                                                                          22.sp,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                          color: Colors
                                                                              .white),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(left: 20.w, top: 10.h),
                                                                  child: Text(
                                                                    "Enter The Quantity",
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                        20.sp,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 47.w,
                                                                        top: 20.h),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context)
                                                                                .unfocus();
                                                                            setState(
                                                                                    () {
                                                                                  selectedContainer =
                                                                                  "Q";
                                                                                });
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            width:
                                                                            40.w,
                                                                            height:
                                                                            40.h,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              borderRadius:
                                                                              BorderRadius.circular(5.r),
                                                                              color: selectedContainer == "Q"
                                                                                  ? Colors.black
                                                                                  : Colors.white,
                                                                            ),
                                                                            //..
                                                                            child:
                                                                            Center(
                                                                              child:
                                                                              Text(
                                                                                "Q",
                                                                                style: GoogleFonts.poppins(
                                                                                  fontSize: 24.sp,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: Color(0xffff3333),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                          57.w,
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context)
                                                                                .unfocus();
                                                                            setState(
                                                                                    () {
                                                                                  selectedContainer =
                                                                                  "H";
                                                                                });
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            width:
                                                                            40.w,
                                                                            height:
                                                                            40.h,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              borderRadius:
                                                                              BorderRadius.circular(5),
                                                                              color: selectedContainer == "H"
                                                                                  ? Colors.black
                                                                                  : Colors.white,
                                                                            ),
                                                                            child:
                                                                            Center(
                                                                              child:
                                                                              Text(
                                                                                "H",
                                                                                style: GoogleFonts.poppins(
                                                                                  fontSize: 24.sp,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: Color(0xffff3333),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                          57.w,
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(context)
                                                                                .unfocus();
                                                                            setState(
                                                                                    () {
                                                                                  selectedContainer =
                                                                                  "F";
                                                                                });
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            width:
                                                                            40.w,
                                                                            height:
                                                                            40.h,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              borderRadius:
                                                                              BorderRadius.circular(5),
                                                                              color: selectedContainer == "F"
                                                                                  ? Colors.black
                                                                                  : Colors.white,
                                                                            ),
                                                                            child:
                                                                            Center(
                                                                              child:
                                                                              Text(
                                                                                "F",
                                                                                style: GoogleFonts.poppins(
                                                                                  fontSize: 24.sp,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  color: Color(0xffff3333),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                      top: 28
                                                                          .h,
                                                                      left: 38
                                                                          .w),
                                                                  child:
                                                                  Container(
                                                                    width: 257.w,
                                                                    height: 45.h,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      border: Border.all(
                                                                          color: Colors
                                                                              .white),
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          10.r),
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        SizedBox(
                                                                            width:
                                                                            9.w),
                                                                        Expanded(
                                                                          child:
                                                                          Padding(
                                                                            padding: EdgeInsets.only(
                                                                                left: 29.w,
                                                                                bottom: 13.h),
                                                                            child:
                                                                            TextFormField(
                                                                              onTap:
                                                                                  () {
                                                                                setState(() {
                                                                                  A = true;
                                                                                });
                                                                              },
                                                                              onTapOutside:
                                                                                  (newValue) {
                                                                                setState(() {
                                                                                  A = false;
                                                                                });
                                                                              },
                                                                              onFieldSubmitted:
                                                                                  (newValue) {
                                                                                setState(() {
                                                                                  A = false;
                                                                                });
                                                                              },
                                                                              controller: quantity,
                                                                              keyboardType: TextInputType.number,
                                                                              textInputAction: TextInputAction.done,
                                                                              style:
                                                                              TextStyle(color: Colors.white),
                                                                              decoration:
                                                                              InputDecoration(
                                                                                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                                                                                border: InputBorder.none,
                                                                                fillColor: Color(0xffff3333),
                                                                                hintText: "Enter The Quantity ",
                                                                                hintStyle: GoogleFonts.poppins(
                                                                                  textStyle: TextStyle(
                                                                                    color: Colors.white,
                                                                                    fontSize: 12.sp,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                      left: 94
                                                                          .w,
                                                                      top: 63
                                                                          .h),
                                                                  child:
                                                                  GestureDetector(onTap: () {
                                                                    if (quantity.text.isNotEmpty && selectedContainer.isNotEmpty) {
                                                                     itemName.add(
                                                                          items[index]
                                                                              .products!.name
                                                                              .toString());
                                                                      itemQuantity.add(
                                                                          quantity.text);
                                                                      itemPrice.add(
                                                                          double.parse(
                                                                              items[index]
                                                                                  .sellingAmount
                                                                                  .toString())*double.parse(quantity.text.toString()));
                                                                      Navigator.of(context).pop();
                                                                    } else {
                                                                      ToastMessage().toastmessage(
                                                                          message:
                                                                          "Select your quantity");
                                                                    }
                                                                  },
                                                                    child: Container(
                                                                      width: 145.w,
                                                                      height: 41.h,
                                                                      decoration: BoxDecoration(
                                                                          boxShadow:
                                                                          kElevationToShadow[
                                                                          4],
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.r),
                                                                          color: Colors
                                                                              .white),
                                                                      child: Center(
                                                                        child: Text(
                                                                          "ok",
                                                                          style: GoogleFonts
                                                                              .poppins(
                                                                            fontSize:
                                                                            20.sp,
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                            color: Color(
                                                                                0xffff3333),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional.bottomEnd,
                                              child: Container(
                                                width: 184.w,
                                                height: 63.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                    Radius.circular(20.r),
                                                    bottomLeft:
                                                    Radius.circular(20),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 9.w, top: 10.h),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        items[index]
                                                            .products!
                                                            .name
                                                            .toString(),
                                                        style:
                                                        GoogleFonts.poppins(
                                                          fontSize: 16.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        items[index]
                                                            .sellingAmount
                                                            .toString(),
                                                        style:
                                                        GoogleFonts.poppins(
                                                          fontSize: 16.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                        );}else
                        {return SizedBox();
                        }
                      },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50.h, left: 25.w),
            child: Row(
              children: [
                Container(
                  width: 117.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: Color(0xffff3333),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text("ordered",
                        style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: 54.w,
                ),
                GestureDetector(
                  onTap: () {

                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> EditOrder(name: widget.name, number: widget.number, image: image,
                          quantity: quantity.text, itemName: itemName, itemQuantity: itemQuantity, itemPrice: itemPrice, phone: widget.phone, tableNo: widget.tableNo,)));
                    },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: kElevationToShadow[4],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    width: 145.w,
                    height: 41.h,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 32.w,
                          ),
                          child: Text("Continue",
                              style: GoogleFonts.poppins(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFF0000))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ])
    );
  }

}
