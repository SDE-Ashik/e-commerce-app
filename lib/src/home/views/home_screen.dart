
import 'package:fashion_app/src/home/widget/custom_app_bar.dart';
import 'package:fashion_app/src/home/widget/home_header.dart';
import 'package:fashion_app/src/home/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(110), child: CustomAppBar()),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
        SizedBox(height: 20.h,),
      const  HomeSlider(),
      SizedBox(height: 15.h,),
      const HomeHeader()

      ],)
    );
  }
}