import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tentwenty/res/assets/image_assets.dart';
import 'package:tentwenty/res/colors/app_color.dart';

import '../../view_models/controller/movies/movies_view_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/movies_widget.dart';
import '../widgets/text_widget.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoviesController>(
      init: MoviesController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.n2Color,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: AppColor.whiteColor,
            automaticallyImplyLeading: controller.isSubmitted.value ? true : false,
            title: controller.isSubmitted.value
                ? CustomText(
                    text: '${controller.filteredMoviesList.length} Results Found',
                    color: AppColor.n1Color,
                    size: 18.0,
                    weight: FontWeight.bold,
                  )
                : controller.isSearching.value
                    ? CustomTextField(
                        hasPrefixIcon: ImageAssets.searchIcon,
                        hasSuffixIcon: ImageAssets.closeIcon,
                        controller: controller.searchController,
                        onChanged: (query) {
                          controller.filterMovies(query);
                          controller.searchQuery.value = query;
                        },
                        hintText: 'TV shows, movies and more',
                        hasSuffixOnTap: () {
                          controller.searchController.clear();
                          controller.filterMovies('');
                          controller.setIsSearching(false);
                        },
                        hasPrefixOnTap: () {
                          controller.setIsSubmitted(true);
                        },
                        onSubmitted: (String value) {
                          controller.setIsSubmitted(true);
                        })
                    : const CustomText(
                        text: 'Watch',
                        color: AppColor.n1Color,
                        size: 18.0,
                        weight: FontWeight.bold,
                      ),
            actions: controller.isSearching.value
                ? null
                : [
                    InkWell(
                      onTap: () => controller.setIsSearching(true),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset(
                          ImageAssets.searchIcon,
                          height: 23,
                        ),
                      ),
                    ),
                  ],
          ),
          body: SingleChildScrollView(
            child: buildBody(controller),
          ),
        );
      },
    );
  }
}
