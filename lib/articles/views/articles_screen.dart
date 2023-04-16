import 'package:etut_mobile/global/styles/styles.dart';
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
  List<ResearchCategory> newsCat = [ResearchCategory(id: -1, title: "All")];
  int selectedIndex = 0;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    DioService().getResearch().then((value) {
      DioService().getResearchCategories().then((value) {
        if (value != null) {
          setState(() {
            newsCat.addAll(value);
            isLoading = false;
          });
        }
      });
      if (value != null) {
        setState(() {
          news = value;
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
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: "Gözleg...",
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24))),
          ),
        ),
        SingleChildScrollView(
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
                  crossAxisCount: 3, mainAxisExtent: 180),
              itemBuilder: (context, index) => DocCard(research: news[index])),
        ),
      ],
    );
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
          style: styles.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          research.researcher,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: styles.bodyMedium,
        ),
        Text(
          research.researchCategory.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: styles.bodySmall,
        ),
      ],
    );
  }
}
