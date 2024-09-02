import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/home/widget/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 3),
              child: ReusableText(
                text: "Location",
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              )),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Icon(
                Ionicons.location,
                size: 16,
                color: Kolors.kPrimary,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: SizedBox(
                  width: ScreenUtil().screenWidth * 0.7,
                  child: Text(
                    "Please select a location",
                    maxLines: 1,
                    style: appStyle(
                      14,
                      Kolors.kDark,
                      FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      actions: [NotificationWidget()],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: GestureDetector(
            onTap: () {
              context.push('/search');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 6.w),
                    child: Container(
                      height: 40.h,
                      width: ScreenUtil().screenWidth - 80,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Kolors.kGrayLight),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Ionicons.search,
                              size: 20,
                              color: Kolors.kPrimaryLight,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            ReusableText(
                                text: "Search Products",
                                style:
                                    appStyle(14, Kolors.kGray, FontWeight.w400))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Kolors.kPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      FontAwesome.sliders,
                      color: Kolors.kWhite,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
