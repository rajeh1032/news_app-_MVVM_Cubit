import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsBottomSheet extends StatelessWidget {
  News news;
  NewsBottomSheet({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).indicatorColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).indicatorColor)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: height * 0.25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            child: Text(
              "${news.description != null ? (news.description!.length > 120 ? "${news.description?.substring(0, 150)}+[${news.description?.length}]" : news.title) : ""}",
              style: AppStyles.medium14Black
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () async {
                  if (news.url != null) {
                    final Uri url = Uri.parse(news.url!);
                    if (await (canLaunchUrl(url))) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    }
                  }
                  news.url;
                  // Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: height * 0.1,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text("View Full Article ",
                      style: Theme.of(context).textTheme.labelLarge),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
