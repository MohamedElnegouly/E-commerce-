import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:e_commerce/features/home/widgets/Custom_Banner.dart';
import 'package:flutter/material.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: cs.CarouselSlider(
        items: [
          CustomBanner(
            imagePath: 'assets/images/carousel_slider1.png',
            title: 'For all Headphones \n& AirPods',
            discount: '25%',
          ),
          CustomBanner(
            imagePath: 'assets/images/carousel_slider2.png',
            title: 'For all Makeup\n& Skincare',
            discount: '30%',
            direction: 'right',
          ),
          CustomBanner(
            imagePath: 'assets/images/carousel_slider3.png',
            title: 'For Laptops\n& Mobiles',
            discount: '25%',
          ),
        ],
        options: cs.CarouselOptions(
          height: 200,
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          autoPlayInterval: Duration(seconds: 3),
        ),
      ),
    );
  }
}
