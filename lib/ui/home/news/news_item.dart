import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:news_app_cubit_mvvm/model/news_response.dart';
import 'package:news_app_cubit_mvvm/utils/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  NewsItem({required this.news});
  News news;

  @override
  Widget build(BuildContext context) {
    final publishedAt = DateTime.tryParse(news.publishedAt!);
    String timeAgoText = "";

    if (publishedAt != null) {
      timeAgoText = timeago.format(
        publishedAt,
        locale: "en",
      );
    }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.38,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).indicatorColor)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Text(
            "${news.title != null ? (news.title!.length > 60 ? "${news.title?.substring(0, 60)}...." : news.title) : ""}",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "BY: ${news.author != null ? (news.author!.length > 16 ? news.author!.substring(0, 10) : news.author ?? "") : ""}",
                style: AppStyles.medium12Grey,
              )),
              Text(
                timeAgoText.toUpperCase(),
                style: AppStyles.medium12Grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
/*
h:852
w:393 
*/