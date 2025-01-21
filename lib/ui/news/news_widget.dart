import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/news/news_item.dart';


class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Something Went Wrong',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        }
        if (snapshot.data!.status == 'error') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snapshot.data!.message!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news:newsList[index]);
                // Text(newsList[index].title ?? '');
            },
          itemCount: newsList.length,);
      },
    );
  }
}
