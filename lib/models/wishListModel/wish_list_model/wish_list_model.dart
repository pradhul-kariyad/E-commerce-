import 'wishlist.dart';

class WishListModel {
  List<Wishlist>? wishlist;

  WishListModel({this.wishlist});

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        wishlist: (json['wishlist'] as List<dynamic>?)
            ?.map((e) => Wishlist.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'wishlist': wishlist?.map((e) => e.toJson()).toList(),
      };
}
