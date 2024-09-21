import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/custom_button.dart';
import 'package:fashion_app/common/widgets/email_textfield.dart';
import 'package:fashion_app/common/widgets/password_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _usernameController =
      TextEditingController();
      late final TextEditingController _emailController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const AppBackButton(),
          elevation: 0),
      body: ListView(
        children: [
          SizedBox(
            height: 160.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Stylio",
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Hi! Welcome back. You've been missed",
            style: appStyle(13, Kolors.kGray, FontWeight.normal),
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                EmailTextField(
                    radius: 25,
                   
                    hintText: "Username",
                    controller: _usernameController,
                    prefixIcon: Icon(
                      CupertinoIcons.profile_circled,
                      size: 20,
                      color: Kolors.kGray,
                    ),
                    keyboardType: TextInputType.name,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordNode);
                    }),
                SizedBox(
                  height: 25.h,
                ),
                EmailTextField(
                    radius: 25,
                    focusNode: _passwordNode,
                    hintText: "Email",
                    controller: _emailController,
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 20,
                      color: Kolors.kGray,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_passwordNode);
                    }),
                SizedBox(
                  height: 25.h,
                ),
                PasswordField(
                  controller: _passwordController,
                  focusNode: _passwordNode,
                  radius: 25,
                ),
                SizedBox(
                  height: 25.h,
                ),
                 CustomButton(
                  text: "S I G N U P",
                  btnWidth: ScreenUtil().screenWidth,
                  btnHieght: 40,
                  radius: 20,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
      
    );
  }
}
