// ignore_for_file: use_key_in_widget_constructors
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mainproject/colors/colors.dart';
import 'package:mainproject/providers/bannerProvider/bannerDataProvider.dart';
import 'package:mainproject/view/widgets/ipaddress/ipaddress.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BannerDataProvider>().getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerDataProvider>(
      builder: (BuildContext context, value, Widget? child) {
        if (value.isloading) {
          return Center(
              child: CircularProgressIndicator(color: ColorData.grey));
        }
        final bannerImage = value.bannerModel.banner;
        if (bannerImage == null || bannerImage.isEmpty) {
          return Container(); // or any other appropriate widget for when bannerImage is null or empty
        }

        return Swiper(
          itemBuilder: (context, index) {
            final image = bannerImage[index];
            return Container(
              height: 22.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                image: DecorationImage(
                  image: NetworkImage(
                    'http://$ip:3000/products-images/${image.image ?? ""}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: bannerImage.length,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
        );
      },
    );
  }
}
