import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/widgets/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../repository/models/news.dart';

class NewsReaderScreen extends StatefulWidget {
  final News news;
  const NewsReaderScreen({super.key, required this.news});

  @override
  State<NewsReaderScreen> createState() => _NewsReaderScreenState();
}

class _NewsReaderScreenState extends State<NewsReaderScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    final colors = AppStyles.colorScheme(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          NewsImageSlider(images: widget.news.images),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(widget.news.title,
                  style: styles.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold))),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.remove_red_eye, size: 20),
                const Gap(6),
                Text(widget.news.views.toString(), style: styles.bodySmall),
                const Spacer(),
                Text("#${widget.news.newsCategory.title}",
                    style: styles.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: colors.primary))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.news.body,
              style: styles.bodyLarge?.copyWith(color: colors.onSurface),
              textAlign: TextAlign.justify,
            ),
          ),
          const Gap(48)
        ]),
      ),
    );
  }
}
