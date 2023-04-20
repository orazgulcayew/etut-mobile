import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../repository/models/faculty.dart';

class MajorsScreen extends StatefulWidget {
  final List<Major> faculties;
  const MajorsScreen({super.key, required this.faculties});

  @override
  State<MajorsScreen> createState() => _MajorsScreenState();
}

class _MajorsScreenState extends State<MajorsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Majors"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(widget.faculties.length, (index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.faculties[index].image ??
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/bio.png");
                        },
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      widget.faculties[index].title ?? "",
                      style: styles.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(4),
                    Text(
                      widget.faculties[index].body ?? "",
                      style: styles.bodyMedium,
                    ),
                    const Gap(4),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
