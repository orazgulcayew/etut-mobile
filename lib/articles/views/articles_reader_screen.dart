import 'package:dio/dio.dart';
import 'package:etut_mobile/global/styles/styles.dart';
import 'package:etut_mobile/global/widgets/banner_slider.dart';
import 'package:etut_mobile/repository/dio_service.dart';
import 'package:etut_mobile/repository/models/research.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:path/path.dart' as path;
import 'package:gap/gap.dart';

class ArticlesReaderScreen extends StatefulWidget {
  final Research news;
  const ArticlesReaderScreen({super.key, required this.news});

  @override
  State<ArticlesReaderScreen> createState() => _ArticlesReaderScreenState();
}

class _ArticlesReaderScreenState extends State<ArticlesReaderScreen> {
  @override
  Widget build(BuildContext context) {
    final styles = AppStyles.textTheme(context);
    final colors = AppStyles.colorScheme(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Visibility(
              visible: widget.news.files.isNotEmpty,
              child: IconButton(
                  onPressed: () {
                    downloadAction();
                  },
                  icon: const Icon(Icons.download)))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (widget.news.images.isNotEmpty)
              NewsImageSlider(images: widget.news.images),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(widget.news.title,
                    style: styles.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold))),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Text(widget.news.researchCategory.title,
                      style: styles.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: colors.primary)),
                  const Spacer(),
                  Visibility(
                    visible: widget.news.files.isNotEmpty,
                    child: OutlinedButton.icon(
                        onPressed: () {
                          downloadAction();
                        },
                        icon: const Icon(Icons.download),
                        label: const Text("Download")),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Html(
                data: widget.news.body,
                defaultTextStyle:
                    styles.bodyLarge?.copyWith(color: colors.onSurface),
              ),
            ),
            const Gap(48)
          ]),
        ),
      ),
    );
  }

  void downloadAction() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Download research?"),
          content: const Text("Download research original written format"),
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  for (var element in widget.news.files) {
                    try {
                      final extension = path.extension(element.source);
                      await Dio().download(element.source,
                          "/storage/emulated/0/Download/${element.title}$extension");
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Downloaded successfully")));
                    } catch (e) {
                      print(e);
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Error")));
                    }
                  }
                },
                child: const Text("Yes")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"))
          ],
        );
      },
    );
  }
}
