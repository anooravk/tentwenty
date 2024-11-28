import 'package:flutter/material.dart';
import 'package:tentwenty/res/assets/image_assets.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';

import '../../res/colors/app_color.dart';
import '../widgets/seat_widgets.dart';

class Seat extends StatelessWidget {
  const Seat({super.key, this.movies});

  final movies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.n2Color,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.whiteColor,
          title: CustomText(
            text: movies.title,
            align: TextAlign.center,
            color: AppColor.blackColor,
            size: 16,
            weight: FontWeight.w700,
          ),
          bottom: PreferredSize(
            preferredSize: const Size(0, 20),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CustomText(
                text: 'In Theaters ${movies.releaseDate.toString().split(' ').first}',
                align: TextAlign.center,
                color: AppColor.n4Color,
                size: 14,
                weight: FontWeight.w400,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomArea(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.map2),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColor.whiteColor,
                    child: Image.asset(
                      ImageAssets.addIcon,
                      height: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColor.whiteColor,
                    child: Image.asset(
                      ImageAssets.subIcon,
                      height: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
