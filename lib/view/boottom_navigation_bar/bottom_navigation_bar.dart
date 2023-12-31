import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../util/color_category.dart';
import '../../util/constant.dart';
import '../../util/constant_widget.dart';
import '../../util/icons.dart';
import '../home/home_screen.dart';
import 'controller/home_main_screen_controller.dart';


class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemNavigator.pop();
    });
  }
  HomeMainScreenController homeMainScreenController =
  Get.put(HomeMainScreenController());

  @override
  Widget build(BuildContext context) {
    Constant.setupSize(context);
    return WillPopScope(
        onWillPop: () async {
          closeApp();
          return false;
        },
        child: GetBuilder<HomeMainScreenController>(
          init: HomeMainScreenController(),
          builder: (homeMainScreenController) => Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: _body(),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(offset: Offset(0, 0),
                  blurRadius: 11,
                  color: regularBlack.withOpacity(0.08))
                ],
                color: regularWhite
              ),
                child: BottomNavigationBar(
                    selectedFontSize: 0,
                    unselectedFontSize: 0,
                    backgroundColor: regularWhite,
                    currentIndex: homeMainScreenController.position.value,
                    onTap: (index) {
                      // setState(() {
                      //   currentvalue = index;
                      // });
                      homeMainScreenController.onChange(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          activeIcon: Container(
                            decoration:
                          BoxDecoration(
                              color:buttonColor,
                            borderRadius: BorderRadius.circular(16.h)

                          ),child: getSvgImage(GetIcons.homerIconselected,height: 24.h,width: 24.h).paddingSymmetric(horizontal: 12.h,vertical: 4.h)).paddingSymmetric(vertical: 25.h),
                          icon:  getSvgImage(GetIcons.homerIconUnselected,height: 24.h,width: 24.h),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Container(
                            decoration:
                          BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(16.h)

                          ),child: getSvgImage(GetIcons.calenderIcon,height: 24.h,width: 24.h,color: regularWhite).paddingSymmetric(horizontal: 12.h,vertical: 4.h)).paddingSymmetric(vertical: 25.h),
                          icon:
                          getSvgImage(GetIcons.calenderIcon,color:darkGrayColor,height: 24.h,width: 24.h),
                          label: ''),
                      BottomNavigationBarItem(
                          activeIcon: Container(
                              decoration:
                          BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(16.h)

                          ),child: getSvgImage(GetIcons.saveIcon,height: 24.h,width: 24.h,color: regularWhite).paddingSymmetric(horizontal: 12.h,vertical: 4.h)).paddingSymmetric(vertical: 25.h),
                          icon:
                          getSvgImage(GetIcons.saveIcon,color:darkGrayColor,height: 24.h,width: 24.h).paddingAll(9.h),
                          label: ''),
                      BottomNavigationBarItem(
                        activeIcon: Container(decoration:
                        BoxDecoration(
                            color:buttonColor,
                            borderRadius: BorderRadius.circular(16.h)

                        ),child: getSvgImage(GetIcons.userIcon,height: 24.h,width: 24.h,color: regularWhite).paddingSymmetric(horizontal: 12.h,vertical: 4.h)).paddingSymmetric(vertical: 25.h),
                        icon: getSvgImage(GetIcons.userIcon,color:darkGrayColor,height: 24.h,width: 24.h).paddingAll(9.h),
                        label: '',
                      ),
                    ])),
          ),
        ));
  }

  _body() {
    switch (homeMainScreenController.position.value) {
      case 0:
        return HomeScreen();
      case 1:
        return HomeScreen();
    //FavouriteItemScreen();

      case 2:
        return HomeScreen();
    //NoCartItemScreen();
      case 3:
        return HomeScreen();
      default:
        return  Center(
          child: getCustomFont("invalid", 16.sp, regularBlack, 1,fontWeight: FontWeight.w700),
        );
    }
  }
}
