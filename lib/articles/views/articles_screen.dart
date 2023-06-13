import 'package:etut_mobile/articles/views/articles_reader_screen.dart';
import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/utils/app_navigator.dart';
import 'package:etut_mobile/repository/models/research.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../repository/dio_service.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<Research> news = [];
  final controller = ScrollController();
  List<ResearchCategory> newsCat = [ResearchCategory(id: -1, title: "All")];
  int selectedIndex = 0;
  int? categoryId;
  final searchController = TextEditingController();
  bool isLoading = true;
  bool isLoadingMore = false;
  int page = 1;
  @override
  void initState() {
    super.initState();
    DioService().getResearchCategories().then((value) {
      if (value != null) {
        setState(() {
          newsCat.addAll(value);
        });
      }
    });

    getNews();
  }

  void getNews() {
    DioService().getResearch(categoryId: categoryId, page: page).then((value) {
      if (value != null) {
        setState(() {
          page++;
          news.addAll(value);
          isLoadingMore = false;
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: TextField(
            controller: searchController,
            onSubmitted: (value) {
              setState(() {
                news = [];
                page = 1;
                isLoading = true;
              });

              getNews();
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: "Gözleg...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24))),
          ),
        ),
        SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                  newsCat.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ChoiceChip(
                          label: Text(newsCat[index].title),
                          selected: index == selectedIndex,
                          onSelected: (value) {
                            if (value) {
                              setState(() {
                                selectedIndex = index;
                                if (value) {
                                  setState(() {
                                    news = [];
                                    page = 1;
                                    isLoading = true;
                                    selectedIndex = index;
                                    categoryId = newsCat[selectedIndex].id;

                                    if (selectedIndex == 0) {
                                      categoryId = null;
                                    }
                                    getNews();
                                  });
                                }
                              });
                            }
                          },
                        ),
                      ))
            ],
          ),
        ),
        const Gap(12),
        Expanded(
          child: GridView.builder(
              itemCount: news.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 200),
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => AppNavigation.pushScreen(
                      context, ArticlesReaderScreen(news: news[index])),
                  child: DocCard(research: news[index]))),
        ),
        if (isLoadingMore) const Gap(16),
        if (isLoadingMore) const LinearProgressIndicator(),
        const Gap(16),
      ],
    );
  }

  void scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      setState(() {
        isLoadingMore = true;
      });
      getNews();
    }
  }
}

class DocCard extends StatelessWidget {
  final Research research;
  const DocCard({super.key, required this.research});

  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    return Column(
      children: [
        Image.asset("assets/images/doc.png"),
        Text(
          research.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: styles.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          research.researcher,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: styles.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          research.researchCategory.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: styles.bodySmall
              ?.copyWith(color: AppStyles.colorScheme(context).primary),
        ),
      ],
    );
  }
}
