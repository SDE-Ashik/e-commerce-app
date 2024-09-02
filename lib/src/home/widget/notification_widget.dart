import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Storage().getString('accessToken') == null) {
          loginBottomSheet(context);
          // print("USER NOT LOGGED IN");
        } else {
          context.push('/notifications');
        }

        // TODO: Naviagtate to notifications page
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: CircleAvatar(
          backgroundColor: Kolors.kGrayLight.withOpacity(.3),
          child: Badge(
            label: Text("4"),
            child: Icon(
              Ionicons.notifications,
              color: Kolors.kPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
