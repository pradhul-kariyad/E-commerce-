// ignore_for_file: file_names
import 'ebanner.dart';

class BannerModel {
  List<EBanner>? banner;

  BannerModel({this.banner});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banner: (json['banner'] as List<dynamic>?)
            ?.map((e) => EBanner.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'banner': banner?.map((e) => e.toJson()).toList(),
      };
}
