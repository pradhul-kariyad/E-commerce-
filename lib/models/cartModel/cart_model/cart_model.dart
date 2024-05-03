import 'data.dart';

class CartModel {
  String? success;
  Data? data;
  int? count;
  int? total;

  CartModel({this.success, this.data, this.count, this.total});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        success: json['success'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        count: json['count'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'count': count,
        'total': total,
      };
}
