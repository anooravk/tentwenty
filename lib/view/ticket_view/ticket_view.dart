import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/view/seat_view/seat_view.dart';
import 'package:tentwenty/view/widgets/custom_button.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';

import '../../res/colors/app_color.dart';
import '../widgets/tickets_widget.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key, this.movies});

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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Date',
                align: TextAlign.center,
                color: AppColor.blackColor,
                size: 18,
                weight: FontWeight.w400,
              ),
              const GenreChipsWidget(),
              const TicketChipsWidget(),
              const Spacer(),
              CustomButton(
                  onPressed: () {
                    Get.to(Seat(
                      movies: movies,
                    ));
                  },
                  title: 'Select Seats')
            ],
          ),
        ),
      ),
    );
  }
}
