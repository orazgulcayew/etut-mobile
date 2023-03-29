import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    final colors = AppStyles.colorScheme(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const BannerSlider(bannersUrls: ['1', '2', '3']),
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
              children: [
                NewsCard(styles: styles),
                NewsCard(styles: styles),
                NewsCard(styles: styles),
                NewsCard(styles: styles),
                NewsCard(styles: styles),
                NewsCard(styles: styles),
                NewsCard(styles: styles),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.styles,
  });

  final TextTheme styles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 216,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://tmcars.info/tmcars/images/thumbnail/2022/08/08/20/26/93029d73-11fc-4892-ba5b-6221641e2e79.webp',
                  height: 160,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(16),
              Text(
                "Apple Unveils New iPhone 14 with Advanced Camera Features",
                style: styles.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(4),
              Text(
                "The Latest iPhone Comes with Enhanced Camera Hardware and Software, Including Cinematic Mode and ProRes Video Recording",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: styles.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
