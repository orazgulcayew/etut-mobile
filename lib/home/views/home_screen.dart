import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/utils/app_navigator.dart';
import 'package:etut_mobile/global/widgets/banner_slider.dart';
import 'package:etut_mobile/news/views/news_reader_screen.dart';
import 'package:etut_mobile/repository/dio_service.dart';
import 'package:etut_mobile/repository/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
  @override
  void initState() {
    super.initState();

    DioService().getNews().then((value) {
      if (value != null) {
        setState(() {
          news = value;
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
          const FlutterLogo(size: 120),
          const Gap(16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "https://images.pexels.com/photos/3405456/pexels-photo-3405456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
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
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  LineIcons.school,
                  size: 20,
                ),
                const Gap(4),
                Text(
                  "Faculties",
                  style:
                      styles.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                Container(
                  width: 200,
                  height: 180,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/it.png",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Computer Sciences and Information Technologies',
                        style: styles.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 180,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/chem.png",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Computer Sciences and Information Technologies',
                        style: styles.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 180,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/cyber.png",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Computer Sciences and Information Technologies',
                        style: styles.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 180,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/bio.png",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Computer Sciences and Information Technologies',
                        style: styles.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  height: 180,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/it.png",
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'Computer Sciences and Information Technologies',
                        style: styles.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(
                  UniconsLine.newspaper,
                  size: 20,
                ),
                const Gap(4),
                Text(
                  "Latest news",
                  style:
                      styles.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
          )
        ],
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
                    news.images[0].source,
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
                    Text(news.newsCategory.title, style: styles.labelSmall)
                  ],
                ),
                Text(
                  news.title,
                  style:
                      styles.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  news.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: styles.bodySmall,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
