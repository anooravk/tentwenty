import 'package:flutter/cupertino.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/fonts/app_fonts.dart';
import 'custom_button.dart';

Widget BottomArea() => Container(
      color: AppColor.whiteColor,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                seatsWidget(ImageAssets.seat1Icon, 'Selected'),
                const SizedBox(
                  width: 30,
                ),
                seatsWidget(ImageAssets.seat2Icon, 'Not available'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                seatsWidget(ImageAssets.seat3Icon, 'VIP (\$150)'),
                const SizedBox(
                  width: 30,
                ),
                seatsWidget(ImageAssets.seat4Icon, 'Regular (\$50)'),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(5),
              width: 100,
              height: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: AppColor.n2Color),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '4/',
                          style: TextStyle(fontSize: 16, color: AppColor.blackColor, fontWeight: FontWeight.bold, fontFamily: AppFonts.poppinsRegular),
                        ),
                        TextSpan(
                          text: '3 row ',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: AppColor.n1Color, fontFamily: AppFonts.poppinsRegular),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    ImageAssets.closeIcon,
                    color: AppColor.blackColor,
                    height: 20,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: AppColor.n2Color),
                    width: 140,
                    height: 56,
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total price',
                              style: TextStyle(fontSize: 13, color: AppColor.n1Color, fontWeight: FontWeight.w300, fontFamily: AppFonts.poppinsRegular),
                            ),
                            TextSpan(
                              text: '\n\$50',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.blackColor, fontFamily: AppFonts.poppinsRegular),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 180,
                    child: CustomButton(
                      borderRadius: 10.0,
                      onPressed: () {},
                      title: 'Proceed to pay',
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

Widget seatsWidget(image, title) => Row(
      children: [
        Image.asset(
          image,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        CustomText(
          text: title,
          align: TextAlign.center,
          color: AppColor.blackColor,
          size: 16,
          weight: FontWeight.w400,
        ),
      ],
    );
