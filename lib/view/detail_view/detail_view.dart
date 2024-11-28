import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/app_url/app_url.dart';
import 'package:tentwenty/res/assets/image_assets.dart';
import 'package:tentwenty/res/colors/app_color.dart';
import 'package:tentwenty/res/fonts/app_fonts.dart';
import 'package:tentwenty/view_models/controller/movies/movies_view_model.dart';

import '../../res/routes/routes_name.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_widget.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key, this.movies});

  final dynamic movies;

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  final controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    AppUrl.imagesUrl + movies.posterPath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(ImageAssets.backIcon, color: AppColor.whiteColor, height: 18),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const CustomText(
                          text: 'Watch',
                          align: TextAlign.center,
                          color: AppColor.whiteColor,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'In Theaters  ${movies.releaseDate.toString().split(' ').first}',
                          align: TextAlign.center,
                          color: AppColor.whiteColor,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 55,
                          width: 250,
                          child: CustomButton(
                            onPressed: () {
                              Get.toNamed(
                                RouteName.ticketView,
                                arguments: {'movies': movies},
                              );
                            },
                            title: 'Get Tickets',
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 250,
                          height: 55,
                          child: CustomButton(
                            isOutlined: true,
                            onPressed: () {
                              const videoUrl = 'https://firebasestorage.googleapis.com/v0/b/sadtalker-d67ba.appspot.com/o/sample-mp4-file'
                                  '.mp4?alt=media&token=eddb6240-7d63-4803-b400-b5dccc607f00';
                              const thumbnailUrl = 'https://firebasestorage.googleapis.com/v0/b/sadtalker-d67ba.appspot.com/o/Screenshot%202024-11-28%20at%204.24.44%E2%80%AFPM'
                                  '.png?alt=media&token=a28b6c4e-423a-4077-b5fc-8f9b300b37ca';
                              Get.toNamed(
                                RouteName.videoView,
                                arguments: {
                                  'videoUrl': videoUrl,
                                  'thumbnailUrl': thumbnailUrl,
                                },
                              );
                            },
                            title: 'Watch Trailer',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Genres',
                      align: TextAlign.center,
                      color: AppColor.blackColor,
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List<Widget>.generate(movies.genreIds.length, (index) {
                        Color randomColor = _getRandomColor();

                        List<String> genreNames = controller.getGenreNamesByIds(movies.genreIds);

                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: randomColor,
                          ),
                          child: CustomText(
                            text: genreNames[index],
                            align: TextAlign.center,
                            color: AppColor.whiteColor,
                            size: 16,
                            weight: FontWeight.bold,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: 'Overview',
                      align: TextAlign.center,
                      color: AppColor.blackColor,
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movies.overview,
                      style: const TextStyle(fontSize: 16, color: AppColor.n3Color, fontWeight: FontWeight.w500, fontFamily: AppFonts.poppinsRegular),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
