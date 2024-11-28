import 'package:flutter/cupertino.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';

import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/fonts/app_fonts.dart';

class GenreChipsWidget extends StatefulWidget {
  const GenreChipsWidget({
    super.key,
  });

  @override
  _GenreChipsWidgetState createState() => _GenreChipsWidgetState();
}

class _GenreChipsWidgetState extends State<GenreChipsWidget> {
  int? _selectedGenreIndex;
  List<String> dates = [
    '5 Mar',
    '6 Mar',
    '7 Mar',
    '8 Mar',
    '9 Mar',
    '10 Mar',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List<Widget>.generate(dates.length, (index) {
            bool isSelected = index == _selectedGenreIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGenreIndex = isSelected ? null : index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: isSelected ? AppColor.n4Color : AppColor.n5Color, // Highlight selected chip
                ),
                child: CustomText(
                  text: dates[index].toString(),
                  align: TextAlign.center,
                  color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
                  // Change text color based on selection
                  size: 16,
                  weight: FontWeight.w400,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class TicketChipsWidget extends StatefulWidget {
  const TicketChipsWidget({
    super.key,
  });

  @override
  _TicketChipsWidgetState createState() => _TicketChipsWidgetState();
}

class _TicketChipsWidgetState extends State<TicketChipsWidget> {
  int? _selectedGenreIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List<Widget>.generate(3, (index) {
            bool isSelected = index == _selectedGenreIndex;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGenreIndex = isSelected ? null : index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '12:30',
                            style: TextStyle(fontSize: 16, color: AppColor.blackColor, fontWeight: FontWeight.bold, fontFamily: AppFonts.poppinsRegular),
                          ),
                          TextSpan(
                            text: ' Cinetech + hall 1 ',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: AppColor.n1Color, fontFamily: AppFonts.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: _selectedGenreIndex == index ? AppColor.n4Color : AppColor.n3Color),
                      ),
                      child: Image.asset(
                        ImageAssets.map1,
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.start,
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'From',
                            style: TextStyle(fontSize: 16, color: AppColor.n1Color, fontWeight: FontWeight.w300, fontFamily: AppFonts.poppinsRegular),
                          ),
                          TextSpan(
                            text: ' 50\$',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.blackColor, fontFamily: AppFonts.poppinsRegular),
                          ),
                          TextSpan(
                            text: ' or',
                            style: TextStyle(fontSize: 16, color: AppColor.n1Color, fontWeight: FontWeight.w300, fontFamily: AppFonts.poppinsRegular),
                          ),
                          TextSpan(
                            text: ' 2500 bonus',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.blackColor, fontFamily: AppFonts.poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
