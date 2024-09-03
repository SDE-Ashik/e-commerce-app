import 'package:fashion_app/const/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoriesList extends StatelessWidget {
  HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: 
            List.generate(categories.length, (i) {
              final category = categories[i];
              return GestureDetector(
                onTap: () {
                  
                },
              );
            }),
          
        ),
      ),
    );
  }
}
