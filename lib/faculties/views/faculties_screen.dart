import 'package:etut_mobile/global/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../repository/dio_service.dart';
import '../../repository/models/faculty.dart';

class FacultiesScreen extends StatefulWidget {
  const FacultiesScreen({super.key});

  @override
  State<FacultiesScreen> createState() => _FacultiesScreenState();
}

class _FacultiesScreenState extends State<FacultiesScreen> {
  List<Faculty> faculties = [];

  @override
  void initState() {
    super.initState();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faculties"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(faculties.length, (index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        faculties[index].image ??
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
                      faculties[index].title ?? "",
                      style: styles.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      faculties[index].body ?? "",
                      style: styles.bodyMedium,
                    )
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
