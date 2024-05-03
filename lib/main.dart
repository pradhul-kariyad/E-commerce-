// ignore_for_file: must_be_immutable
import 'package:mainproject/providers/auth/createDataProvider.dart';
import 'package:mainproject/providers/auth/logOutProvider.dart';
import 'package:mainproject/providers/bannerProvider/bannerDataProvider.dart';
import 'package:mainproject/providers/cartProvider/addCart/addCartProvider.dart';
import 'package:mainproject/providers/cartProvider/cartDataProvider/cartDataProvider.dart';
import 'package:mainproject/providers/cartProvider/deleteCart/deleteCartProvider.dart';
import 'package:mainproject/providers/cartProvider/quantityAdd/quantityAddProvider.dart';
import 'package:mainproject/providers/cartProvider/quantityMinus/quantityMinusProvider.dart';
import 'package:mainproject/providers/checkOutProvider/checkOutPostProvider/checkOutPost.dart';
import 'package:mainproject/providers/checkOutProvider/checkOutProvider.dart';
import 'package:mainproject/providers/checkOutProvider/verifyPaymentProvider/verifyPaymentProvider.dart';
import 'package:mainproject/providers/downloadPdfProvider/invoiceDownloadProvider.dart';
import 'package:mainproject/providers/homeProvider/homeDataProvider.dart';
import 'package:mainproject/providers/iconProvider/iconProvider.dart';
import 'package:mainproject/providers/orderCreationProvider/orderCreation.dart';
import 'package:mainproject/providers/ordersHistory/ordersHistoryProvider.dart';
import 'package:mainproject/providers/paginationProvider/paginationDataProvider.dart';
import 'package:mainproject/providers/profileProvider/imgProvider/imgProvider.dart';
import 'package:mainproject/providers/profileProvider/profileProvider.dart';
import 'package:mainproject/providers/searchProvider/searchDataProvider.dart';
import 'package:mainproject/providers/auth/signInProvider.dart';
import 'package:mainproject/providers/wishListProvider/favoriteProvider/favoriteProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishListDataProvider/wishListDataProvider.dart';
import 'package:mainproject/providers/wishListProvider/wishlistView.dart/wishListViewProvider.dart';
import 'package:mainproject/view/home/mainPage/mainPage.dart';
import 'package:mainproject/view/pages/splashScreen/firstScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userlogin = prefs.getBool('userlogin') ?? false;
  runApp(MyApp(
    userlogin: userlogin,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.userlogin});
  bool userlogin;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
            ChangeNotifierProvider(create: (context) {
          return LogOutProvider();
        }),
           ChangeNotifierProvider(create: (context) {
          return ImgProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return PaginationDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return CreateDateProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return SignInProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return InvoiceDownloadProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return OrdersHistoryProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return SearchDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return OrderCreationProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return VerifyPaymentProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return SaveCheckOut();
        }),
        ChangeNotifierProvider(create: (context) {
          return CheckOutProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return FavoriteProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return WishListViewProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return WishListDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return QuantityAddProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return QuantityMinusProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return DeleteCartProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return AddCartProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return CartDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return BannerDataProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return ProfileProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return IconProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return HomeDataProvider();
        }),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            //appBarTheme: ,
            //textTheme:  ,
            //TextTheme(bodyLarge: TextStyle(), displaySmall: TextStyle()),
            //iconTheme: IconThemeData(color: Colors.black)),
            debugShowCheckedModeBanner: false,
            home:
                // ProviderService()
                userlogin ? MainPage() : FirstSreen(),
          );
        },
      ),
    );
  }
}
