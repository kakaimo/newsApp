import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/category/source_tab_widget.dart';
import '../../api/api_manager.dart';

class CategoryDetails extends StatefulWidget {
  static const routeName = 'category-details';
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(),
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
                 Text('Something Went Wrong',
                  style: Theme.of(context).textTheme.headlineLarge,),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: const Text('Try Again'))
              ],
            ),
          );
        }
        if (snapshot.data!.status! == 'error') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data!.message!,
                style: Theme.of(context).textTheme.headlineLarge,),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () {
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: const Text('Try Again'))
              ],
            ),
          );
        }
        var sourceList = snapshot.data!.sources!;
        return SourceTabWidget(sourcesList: sourceList);
      },
    );
  }
}
