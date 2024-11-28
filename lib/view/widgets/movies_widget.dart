import 'package:flutter/material.dart';
import 'package:tentwenty/view/widgets/text_widget.dart';

import '../../data/response/status.dart';
import '../../res/app_url/app_url.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/skelton_loader.dart';
import '../../view_models/controller/movies/movies_view_model.dart';

Widget buildBody(MoviesController controller) {
  if (controller.isSearching.value && controller.searchController.text.isEmpty) {
    return Container(
      color: AppColor.n2Color,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 0.0,
          ),
          itemCount: controller.movies.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(controller.movies[index]['imageUrl']!),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: controller.movies[index]['genre']!,
                        color: AppColor.whiteColor,
                        size: 18.0,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  if (controller.isSearching.value && controller.searchController.text.isNotEmpty) {
    final filteredMovies = controller.filteredMoviesList;
    if (filteredMovies.isEmpty) {
      return const Center(
        child: CustomText(
          text: 'No movies found',
          color: AppColor.redColor,
          size: 16.0,
          weight: FontWeight.bold,
        ),
      );
    }
    return Container(
      color: AppColor.n2Color,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!controller.isSubmitted.value) ...[
              const CustomText(
                text: 'Top Results',
                color: AppColor.blackColor,
                size: 13.0,
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
              const Divider(
                color: AppColor.n5Color,
              ),
            ],
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.detailView,
                      arguments: {'movies': filteredMovies[index]}, // Passing the selected movie
                    );
                  },
                  child: ListTile(
                    title: CustomText(
                      text: filteredMovies[index].title,
                      color: AppColor.blackColor,
                      size: 14.0,
                      weight: FontWeight.w600,
                      align: TextAlign.start,
                    ),
                    subtitle: CustomText(
                      text: filteredMovies[index].genreIds.toString(),
                      color: AppColor.blackColor,
                      size: 12.0,
                      weight: FontWeight.w400,
                      align: TextAlign.start,
                    ),
                    leading: SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                        child: Image.network(
                          AppUrl.imagesUrl + (filteredMovies[index].posterPath ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    trailing: Image.asset(
                      ImageAssets.indicatorIcon,
                      height: 3,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  switch (controller.rxRequestStatus.value) {
    case Status.LOADING:
      return const CardSkelton();
    case Status.ERROR:
      if (controller.error.value == 'No internet') {
        return InterNetExceptionWidget(
          onPress: () {
            controller.refreshApi();
          },
        );
      } else {
        return GeneralExceptionWidget(onPress: () {
          controller.refreshApi();
        });
      }
    case Status.COMPLETED:
      final movies = controller.filteredMoviesList;
      if (movies.isEmpty) {
        return const Center(
          child: CustomText(
            text: 'No movies found',
            color: AppColor.blackColor,
            size: 16.0,
            weight: FontWeight.bold,
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.only(left: 17, right: 17, top: 30),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.detailView,
                  arguments: {'movies': movies[index]},
                );
              },
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              AppUrl.imagesUrl + (movies[index].posterPath ?? ''),
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // Black overlay
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Positioned(
                        bottom: 16,
                        left: 16,
                        child: CustomText(
                          text: movies[index].title ?? 'Unknown Title',
                          color: AppColor.whiteColor,
                          size: 16.0,
                          weight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      );

    default:
      return const SizedBox.shrink();
  }
}
