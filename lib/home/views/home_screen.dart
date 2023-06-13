import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:etut_mobile/cource_center/views/course_center_screen.dart';
import 'package:etut_mobile/faculties/views/departments_screen.dart';
import 'package:etut_mobile/faculties/views/faculties_screen.dart';
import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/utils/app_navigator.dart';
import 'package:etut_mobile/navigation/views/navigation.dart';
import 'package:etut_mobile/news/views/news_reader_screen.dart';
import 'package:etut_mobile/news/views/news_screen.dart';
import 'package:etut_mobile/repository/dio_service.dart';
import 'package:etut_mobile/repository/models/faculty.dart';
import 'package:etut_mobile/repository/models/news.dart';
import 'package:etut_mobile/talents/views/talents_screen.dart';
import 'package:etut_mobile/vrtour/views/vrtour_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gif/flutter_gif.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<News> news = [];
  List<Faculty> faculties = [];

  @override
  void initState() {
    super.initState();

    DioService().getNews(toHome: true).then((value) {
      if (value != null) {
        setState(() {
          news = value;
        });
      }
    });

    DioService().getFaculties().then((value) {
      if (value != null) {
        setState(() {
          faculties = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    final colors = AppStyles.colorScheme(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    "Oguz han Engineering and technology university of Turkmenistan",
                    style: styles.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 120,
                ),
              ],
            ),
          ),
          const Divider(),
          const Gap(16),
          GestureDetector(
            onTap: () {
              AppNavigation.pushScreen(context, const VrTourScreen());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/it.png",
                      height: 140,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 16,
                    child: Text(
                      "OGUZ360°",
                      style: styles.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: colors.surface),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () {
                AppNavigation.pushScreen(context, const FacultiesScreen());
              },
              child: Row(
                children: [
                  const Icon(
                    LineIcons.school,
                    size: 20,
                  ),
                  const Gap(4),
                  Text(
                    "Faculties",
                    style: styles.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Text(
                    "More",
                  ),
                  const Icon(
                    FeatherIcons.arrowRight,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                    faculties.length,
                    (index) => GestureDetector(
                          onTap: () {
                            AppNavigation.pushScreen(
                                context,
                                DepartmentsScreen(
                                    faculties: faculties[index].departments));
                          },
                          child: Container(
                            width: 200,
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    faculties[index].image ??
                                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                                    width: 200,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                          "assets/images/bio.png");
                                    },
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  faculties[index].title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: styles.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () {
                AppNavigation.pushScreen(context, const NewsScreen());
              },
              child: Row(
                children: [
                  const Icon(
                    UniconsLine.newspaper,
                    size: 20,
                  ),
                  const Gap(4),
                  Text(
                    "Latest news",
                    style: styles.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Text(
                    "See all",
                  ),
                  const Icon(
                    FeatherIcons.arrowRight,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              children: List.generate(
                  news.length,
                  (index) => NewsCard(
                        news: news[index],
                      )),
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  UniconsLine.info_circle,
                  size: 20,
                ),
                const Gap(4),
                Text(
                  "More from our university",
                  style:
                      styles.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Gap(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AppNavigation.pushScreen(
                          context, const CourseCenterScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/it.png",
                              height: 140,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 16,
                            child: Text(
                              "Course center",
                              style: styles.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colors.surface),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      AppNavigation.pushScreen(context, const TalentsScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              "assets/images/bio.png",
                              height: 140,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Positioned(
                            bottom: 8,
                            left: 16,
                            child: Text(
                              "Graduates",
                              style: styles.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: colors.surface),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Text("v.1.0.0", style: styles.bodySmall),
          const Gap(16),
        ],
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late FlutterGifController controller;

  @override
  void initState() {
    super.initState();

    // controller.repeat(
    //     min: 0, max: 187, period: const Duration(milliseconds: 2500));

    Timer(const Duration(milliseconds: 3000), () {
      // After 3 seconds, navigate to the home screen
      AppNavigation.pushReplace(context, const NavigationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              width: 200,
              height: 200,
              // child: GifImage(
              //   image: const AssetImage("assets/images/loading.gif"),
              //   width: 200,
              //   controller: controller,
              // ),
              child: Image.asset("assets/images/loading.gif"),
            ),
            const Gap(16),
            const Text(
              "ETUT Mobile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const Spacer(),
            const Text(
              "Made by Oguztech",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    String imageLink = "";
    int subStringLength = 1;

    if (news.body.length > 45) {
      subStringLength = 45;
    } else {
      subStringLength = news.body.length;
    }
    try {
      imageLink = news.images[0].source;
    } catch (e) {}
    return GestureDetector(
      onTap: () =>
          AppNavigation.pushScreen(context, NewsReaderScreen(news: news)),
      child: SizedBox(
        width: 216,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageLink,
                    height: 160,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Gap(8),
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye_rounded,
                      size: 16,
                    ),
                    const Gap(4),
                    Text(news.views.toString(), style: styles.labelSmall),
                    const Spacer(),
                    Flexible(
                      child: Text(
                        news.newsCategory.title,
                        style: styles.labelSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
                Text(
                  news.title,
                  style:
                      styles.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Html(
                //     data: "${news.body.substring(0, subStringLength)}...",
                //     defaultTextStyle: styles.bodySmall?.copyWith(
                //       overflow: TextOverflow.ellipsis,
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
