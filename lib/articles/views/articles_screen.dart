import 'package:etut_mobile/global/styles/styles.dart';
import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: GridView.builder(
              itemCount: 40,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, mainAxisExtent: 160),
              itemBuilder: (context, index) => const DocCard()),
        ),
      ],
    );
  }
}

class DocCard extends StatelessWidget {
  const DocCard({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    return Column(
      children: [
        Image.asset("assets/images/doc.png"),
        Text(
          "Research name",
          style: styles.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "Name surname",
          style: styles.bodyMedium,
        )
      ],
    );
  }
}
