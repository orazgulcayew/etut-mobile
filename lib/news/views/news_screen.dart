import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../../home/views/home_screen.dart';
import '../../repository/dio_service.dart';
import '../../repository/models/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<News> news = [];
  List<NewsCategory> newsCat = [NewsCategory(id: -1, title: "All")];
  int selectedIndex = 0;
  int? categoryId;
  int pageSize = 1;

  bool isLoading = true;

  final controller = ScrollController();

  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    DioService().getNewsCategories().then((value) {
      if (value != null) {
        setState(() {
          newsCat.addAll(value);
          isLoading = false;
        });
      }
    });
    getNews();
  }

  void getNews() {
    DioService()
        .getNews(toHome: null, category: categoryId, page: pageSize)
        .then((valueNews) {
      if (valueNews != null) {
        setState(() {
          pageSize++;
          isLoadingMore = false;
          news.addAll(valueNews);
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News")),
      body: SafeArea(
        child: Visibility(
          visible: !isLoading,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        hintText: "Gözleg...",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: ChoiceChip(
                                  label: Text(newsCat[index].title),
                                  selected: index == selectedIndex,
                                  onSelected: (value) {
                                    if (value) {
                                      setState(() {
                                        pageSize = 1;
                                        news = [];
                                        isLoading = true;
                                        selectedIndex = index;
                                        categoryId = newsCat[selectedIndex].id;

                                        if (selectedIndex == 0) {
                                          categoryId = null;
                                        }
                                        getNews();
                                      });
                                    }
                                  },
                                ),
                              ))
                    ],
                  ),
                ),
                const Gap(8),
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
                if (isLoadingMore) const Gap(16),
                if (isLoadingMore) const LinearProgressIndicator(),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
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
