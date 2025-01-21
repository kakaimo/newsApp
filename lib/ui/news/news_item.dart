import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/utils/app_colors.dart';
import 'package:news/ui/utils/app_styles.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.005),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.005, vertical: height * 0.003),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).indicatorColor,
          width: 2,
        ), // Border.all
      ), // BoxDecoration
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.blue,
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'By: ',
                    style: AppStyles.medium12Gray,
                    children: [
                      TextSpan(
                        text: news.author != null && news.author!.length > 20
                            ? '${news.author!.substring(0, 20)}\n${news.author!.substring(20)}'
                            : news.author ?? '',
                        style: AppStyles.medium12Gray,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left, // Ensures multiline alignment
                ),
                Text(
                  news.publishedAt ?? '',
                  style: AppStyles.medium12Gray,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
