import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/app_routes.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/help_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/src/auth/views/login_screen.dart';
import 'package:fashion_app/src/profile/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    if (accessToken == null) {
      return const LoginPage();
      
    }
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: Kolors.kOffWhite,
              backgroundImage: NetworkImage(AppText.kProfilePic),
            ),
            SizedBox(
              height: 15.h,
            ),
            ReusableText(
              text: "samuelohn@gmail.com",
              style: appStyle(12, Kolors.kGray, FontWeight.normal),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ReusableText(
                text: "samuel john",
                style: appStyle(14, Kolors.kDark, FontWeight.w600),
              ),
              decoration: BoxDecoration(
                color: Kolors.kOffWhite,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          color: Kolors.kOffWhite,
          child: Column(
            children: [
              ProfilTitleWidget(
                title: 'My Orders',
                leading: Octicons.checklist,
                onTap: () {
                  context.push('/orders');
                },
              ),
              ProfilTitleWidget(
                title: 'Shipping Address',
                leading: MaterialIcons.location_pin,
                onTap: () {
                  context.push('/addresses');
                },
              ),
              ProfilTitleWidget(
                title: 'Privacy Policy',
                leading: MaterialIcons.policy,
                onTap: () {
                  context.push('/policy');
                },
              ),
              ProfilTitleWidget(
                title: 'Help Center',
                leading: AntDesign.customerservice,
                onTap: () => showHelpCenterBottomSheet(context),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: CustomButton(
                  text: 'Logout'.toUpperCase(),
                  btnHieght: 35,
                  btnColor: Kolors.kRed,
                  btnWidth: ScreenUtil().screenWidth,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
