import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {

  static Future<SourceResponse?>getSources()async{
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      EndPoints.sourceApi,
      {'apiKey': ApiConstant.apiKey},
    );


    try{
      var response = await http.get(url);
      var responseBody = response.body ; // String need to convert to json then to object
      var json = jsonDecode(responseBody) ; //here convert to json
      return SourceResponse.fromJson(json); // here convert to object

      // return SourceResponse.fromJson(jsonDecode(response.body)); //all in one
    }catch(e){
      rethrow ;
    }

  }

  static Future<NewsResponse?>getNewBySourceId(String sourceId)async{
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      EndPoints.newsApi,
      {'apiKey': ApiConstant.apiKey,
       'sources' : sourceId
      },
    );

    try{
       var response = await http.get(url);

      // var responseBody = response.body ; // String need to convert to json then to object
      // var json = jsonDecode(responseBody) ; //here convert to json
      // return NewsResponse.fromJson(json); // here convert to object

       return NewsResponse.fromJson(jsonDecode(response.body)); //all in one

    }catch(e){
      rethrow ;
    }

  }


}
