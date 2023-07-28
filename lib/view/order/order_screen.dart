import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/util/color_category.dart';
import 'package:food_order_app/util/constant.dart';
import 'package:food_order_app/util/constant_widget.dart';
import 'package:food_order_app/util/icons.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../routes/app_routes.dart';
import '../../util/images.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: 284.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  Constant.assetImagePath + GetImages.foodImage,
                                ),
                                fit: BoxFit.fill)),
                        child: SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Constant.backToPrev(context);
                                  },
                                  child: getSvgImage(GetIcons.backArrowIcon)),
                              getSvgImage(GetIcons.moreVertIcon),
                            ],
                          ).paddingOnly(top: 8.h, left: 16.h, right: 16.h),
                        )),
                    SafeArea(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.h),
                            border: Border.all(color: bordrColor),
                            color: regularWhite),
                        child: Row(
                          children: [
                            getAssetImage(GetImages.user2ndImage,
                                height: 56.h, width: 56.h),
                            getHorSpace(16.h),
                            Column(
                              children: [
                                getCustomFont(
                                    S.of(context).esthenHoward, 20.sp, regularBlack, 1,
                                    fontWeight: FontWeight.w500),
                                getVerSpace(4.h),
                                getCustomFont(
                                    S.of(context).professionalChef, 16.sp, darkGrayColor, 1,
                                    fontWeight: FontWeight.w400),
                              ],
                            )
                          ],
                        ).paddingSymmetric(horizontal: 16.h, vertical: 12.h),
                      ).paddingOnly(top: 206.h, left: 16.h, right: 16.h),
                    ),

                  ],
                ),
                getVerSpace(24.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getCustomFont(S.of(context).description, 20.sp, regularBlack, 1,
                        fontWeight: FontWeight.w500),
                    getVerSpace(16.h),
                    ExpandableText(
                      S.of(context).thereAreManyVariationsOfPassagesOfLoremIpsumAvailable,
                      expandText: S.of(context).readMore,
                      collapseText: S.of(context).readLess,
                      linkStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: Constant.fontsFamily,
                          color: regularBlack),
                      maxLines: 2,
                      linkColor: regularBlack,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          fontFamily: Constant.fontsFamily,
                          color: darkGrayColor),
                    ),
                    getVerSpace(12.h),
                    Divider(
                      color: bordrColor,
                    ),
                    getVerSpace(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getCustomFont(S.of(context).reviews, 20.sp, regularBlack, 1,
                            fontWeight: FontWeight.w700),
                        getCustomFont(S.of(context).viewAll, 14.sp, darkGrayColor, 1,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                    getVerSpace(16.h),
                    review_formate(GetImages.review1stImage, S.of(context).marvinMckinney, S.of(context).min, "3.0",S.of(context).utEnimAdMinimaVeniamQuisNostrumExercitationemUllamCorporis),
                    getVerSpace(24.h),
                    review_formate(GetImages.review2ndImage, S.of(context).dianneRussell, S.of(context).m15, "3.0",S.of(context).nemoEnimIpsamVoluptatemQuiaVoluptasSitAspernaturAutOdit),
                    getVerSpace(24.h),
                    review_formate(GetImages.review3rdImage, S.of(context).theresaWebb, S.of(context).m20, "3.0",S.of(context).nemoEnimIpsamVoluptatemQuiaVoluptasSitAspernaturAutOdit),


                  ],
                ).paddingSymmetric(horizontal: 16.h)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: getButton(context, buttonColor, S.of(context).order, regularWhite,
                      () {
                    // Constant.sendToNext(context, Routes.orderScreenRoute);
                  }, 18.sp,
                  weight: FontWeight.w500,
                  borderRadius: BorderRadius.circular(16.h)),
            ).paddingSymmetric(horizontal: 16.h,vertical: 16.h),
          ],
        ),
      ),
      onWillPop: () async {
        Constant.backToPrev(context);
        return false;
      },
    );
  }

  Widget review_formate(image,name,time,review,reviewMsg){
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                getAssetImage(image,
                    height: 40.h, width: 40.h),
                getHorSpace(16.h),
                getCustomFont(name, 15.sp, regularBlack, 1,
                    fontWeight: FontWeight.w500),
                getHorSpace(8.h),
                getCustomFont(time, 15.sp, darkGrayColor, 1,
                    fontWeight: FontWeight.w400),
              ],
            ),
            Row(
              children: [
                getSvgImage(GetIcons.starIcon,height: 24.h,width: 24.h),
                getHorSpace(2.h),
                getCustomFont(review, 15.sp, darkGrayColor, 1,
                    fontWeight: FontWeight.w400)
              ],
            )
          ],
        ),
        getVerSpace(16.h),
        getMultilineCustomFont(
            reviewMsg,
            15.sp,
            darkGrayColor,
            fontWeight: FontWeight.w400)
      ],
    );
  }
}
