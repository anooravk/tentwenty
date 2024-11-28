import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/assets/image_assets.dart';
import 'package:tentwenty/res/colors/app_color.dart';
import 'package:tentwenty/view/movies_view/movies_view.dart';

import '../../res/fonts/app_fonts.dart';
import '../../view_models/controller/bottom_nav/bottom_nav_view_model.dart';
import '../dummy_view/dummy_view.dart';

class Bottomnavigationwidget extends StatelessWidget {
  Bottomnavigationwidget({Key? key}) : super(key: key);

  final BottomNavigationController controller = Get.put(BottomNavigationController());

  final List<Widget> tabs = [const Dummy(), MoviesView(), const Dummy()];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColor.n2Color,
        body: tabs[controller.index.value],
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
            color: AppColor.n11Color,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (index) {
                controller.changeTabIndex(index);
              },
              selectedItemColor: AppColor.whiteColor,
              unselectedItemColor: AppColor.n12Color,
              selectedIconTheme: IconThemeData(color: AppColor.whiteColor),
              unselectedIconTheme: IconThemeData(color: AppColor.n12Color),
              selectedLabelStyle: TextStyle(color: AppColor.whiteColor, fontSize: 10, fontFamily: AppFonts.poppinsRegular),
              unselectedLabelStyle: TextStyle(color: AppColor.n2Color, fontSize: 10, fontFamily: AppFonts.poppinsRegular),
              backgroundColor: AppColor.n11Color,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(
                        ImageAssets.dashboardIcon,
                        height: 20,
                        color: controller.index.value == 0 ? AppColor.whiteColor : AppColor.n12Color,
                      ),
                    ),
                    label: 'Dashboard'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(
                        ImageAssets.watchIcon,
                        height: 20,
                        color: controller.index.value == 1 ? AppColor.whiteColor : AppColor.n12Color,
                      ),
                    ),
                    label: 'Watch'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Image.asset(
                        ImageAssets.mediaIcon,
                        height: 20,
                        color: controller.index.value == 2 ? AppColor.whiteColor : AppColor.n12Color,
                      ),
                    ),
                    label: 'Media Library'),
              ],
            ),
          ),
        ),
      );
    });
  }
}
