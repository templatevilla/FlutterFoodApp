import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../generated/l10n.dart';
import '../../routes/app_routes.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../../util/icons.dart';
import '../../util/images.dart';
import 'models/home_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getVerSpace(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getCustomFont(S.of(context).date, 18.sp, darkGrayColor, 1,
                    fontWeight: FontWeight.w400),
                getCustomFont(S.of(context).hiLorem, 24.sp, regularBlack, 1,
                    fontWeight: FontWeight.w700),
              ],
            ),
            getAssetImage(GetImages.userImage, height: 48.h, width: 48.h),
          ],
        ).paddingSymmetric(horizontal: 20.h),
        getVerSpace(32.h),
        getSearchField(S.of(context).search, searchController).paddingSymmetric(horizontal: 20.h),
        getVerSpace(24.h),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont(S.of(context).theBestChefs, 20.sp, regularBlack, 1,
                      fontWeight: FontWeight.w700),
                  getCustomFont( S.of(context).viewAll, 14.sp, darkGrayColor, 1,
                      fontWeight: FontWeight.w400),
                ],
              ),
              getVerSpace(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  best_chefs_formate(GetImages.user1stImage, S.of(context).esthen),
                  best_chefs_formate(GetImages.user2ndImage, S.of(context).cooper),
                  best_chefs_formate(GetImages.user3rdImage, S.of(context).devon),
                  best_chefs_formate(GetImages.user4thImage, S.of(context).jerom),
                  best_chefs_formate(GetImages.user5thImage, S.of(context).kathryn),
                ],
              ),
              getVerSpace(24.h),
              getCustomFont(S.of(context).dishOfTheWeek, 20.sp, regularBlack, 1,
                  fontWeight: FontWeight.w700),
              getVerSpace(24.h),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.h),
                    border: Border.all(color: bordrColor),
                    color: regularWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 181.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.h),
                            topRight: Radius.circular(16.h),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                Constant.assetImagePath + GetImages.dishImage,
                              ),
                              fit: BoxFit.fill)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              getSvgImage(GetIcons.watchIcon,
                                  height: 16.h, width: 16.h),
                              getHorSpace(4.h),
                              getCustomFont(S.of(context).mini, 14.sp, regularWhite, 1,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          getHorSpace(16.h),
                          Row(
                            children: [
                              getSvgImage(GetIcons.fireIcon,
                                  height: 16.h, width: 16.h),
                              getHorSpace(4.h),
                              getCustomFont(S.of(context).count, 14.sp, regularWhite, 1,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 8.h,vertical: 8.h),
                    ),
                    getVerSpace(16.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont(S.of(context).spicyRamenNoodle, 20.sp, regularBlack, 1,
                            fontWeight: FontWeight.w700),
                        getVerSpace(16.h),
                        getCustomFont(S.of(context).ingredients, 16.sp, darkGrayColor, 1,
                            fontWeight: FontWeight.w400),
                        getVerSpace(8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            getAssetImage(GetImages.ingredients1stImage,
                                height: 48.h, width: 48.h),
                            getAssetImage(GetImages.ingredients1stImage,
                                height: 48.h, width: 48.h),
                            getAssetImage(GetImages.ingredients1stImage,
                                height: 48.h, width: 48.h),
                            getAssetImage(GetImages.ingredients1stImage,
                                height: 48.h, width: 48.h),
                            getAssetImage(GetImages.ingredients1stImage,
                                height: 48.h, width: 48.h),
                            getAssetImage(GetImages.ingredients1stImage,
                                height: 48.h, width: 48.h),
                          ],
                        ),
                        getVerSpace(24.h),
                        getButton(context, buttonColor, S.of(context).orderChief, regularWhite,
                                () {
                          Constant.sendToNext(context, Routes.orderScreenRoute);
                                }, 18.sp,
                            weight: FontWeight.w500,
                            borderRadius: BorderRadius.circular(16.h)),
                        getVerSpace(16.h),
                      ],
                    ).paddingSymmetric(horizontal: 16.h),


                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget best_chefs_formate(image, name) {
    return Column(
      children: [
        getAssetImage(image, height: 64.h, width: 64.h),
        getVerSpace(8.h),
        getCustomFont(name, 18.sp, regularBlack, 1, fontWeight: FontWeight.w400)
      ],
    );
  }
}
