import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/kcolors.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/common/widgets/back_button.dart';
import 'package:fashion_app/common/widgets/error_modal.dart';
import 'package:fashion_app/common/widgets/login_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/logout_bottom_sheet.dart';
import 'package:fashion_app/common/widgets/reusable_text.dart';
import 'package:fashion_app/const/constants.dart';
import 'package:fashion_app/src/products/controllers/colors_sizes_notifier.dart';
import 'package:fashion_app/src/products/controllers/product_notifer.dart';
import 'package:fashion_app/src/products/widgets/color_selection_widget.dart';
import 'package:fashion_app/src/products/widgets/expandable_text.dart';
import 'package:fashion_app/src/products/widgets/product_bottom_bar.dart';
import 'package:fashion_app/src/products/widgets/product_sizes.dart';
import 'package:fashion_app/src/products/widgets/similar_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');

    // context.read<ProductNotifer>().product!.title;
    // print(context.read<ProductNotifer>().product!.title);
    return Consumer<ProductNotifer>(builder: (context, productNotifier, child) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 320.h,
              collapsedHeight: 65.h,
              floating: false,
              pinned: true,
              leading: const AppBackButton(),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: Kolors.kSecondaryLight,
                      child: Icon(
                        AntDesign.heart,
                        color: Kolors.kRed,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                background: SizedBox(
                  height: 415.h,
                  child: ImageSlideshow(
                      indicatorColor: Kolors.kPrimaryLight,
                      autoPlayInterval: 15000,
                      isLoop: productNotifier.product!.imageUrls.length > 1
                          ? true
                          : false,
                      children: List.generate(
                          productNotifier.product!.imageUrls.length, (i) {
                        return CachedNetworkImage(
                          imageUrl: productNotifier.product!.imageUrls[i],
                          placeholder: placeholder,
                          errorWidget: errorWidget,
                          fit: BoxFit.cover,
                        );
                      })),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: productNotifier.product!.clothesType.toUpperCase(),
                      style: appStyle(13, Kolors.kGray, FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(
                          AntDesign.star,
                          size: 14,
                          color: Kolors.kGold,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        ReusableText(
                          text: productNotifier.product!.ratings
                              .toStringAsFixed(1),
                          style: appStyle(13, Kolors.kGray, FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ReusableText(
                  text: productNotifier.product!.title,
                  style: appStyle(16, Kolors.kDark, FontWeight.w600),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(8.h),
              child: ExpandableText(text: productNotifier.product!.description),
            )),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Divider(
                  thickness: .5.h,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                  text: "Select Sizes",
                  style: appStyle(14, Kolors.kDark, FontWeight.w600)),
            )),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ProductSizes(),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                  text: "Select Colour",
                  style: appStyle(14, Kolors.kDark, FontWeight.w600)),
            )),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ColorSelectionWidget(),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ReusableText(
                  text: "Similar Product",
                  style: appStyle(14, Kolors.kDark, FontWeight.w600)),
            )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10.h,
              ),
            ),
            SliverToBoxAdapter(
              child: const SimilarProducts(),
            )
          ],
        ),
        bottomNavigationBar: ProductBottomBar(
          onPressed: () {
            if (accessToken == null) {
              loginBottomSheet(context);
            } else {
              if (context.read<ColorsSizeNotifier>().color == '' ||
                  context.read<ColorsSizeNotifier>().sizes == '') {
                showErrorPopup(context, AppText.kCartErrorText,
                    'Error Adding to Cart', true);
              } else {
                //TODO:cart logic
              }
            }

            print("Add To Cart");
          },
          price: productNotifier.product!.price.toStringAsFixed(2),
        ),
      );
    });
  }
}
