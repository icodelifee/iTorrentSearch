// import 'dart:convert' as JSON;

// import 'package:http/http.dart';

// class SuggestionsAPI {
//   Future<List> getSuggestions(query) async {
//     var url = "http://suggestqueries.google.com/complete/search?client=firefox&q=" + query;
//     var client = new Client();
//     List? suggestionJson;
//     var json = await client.get(url);
//     if (json.statusCode == 200)
//       suggestionJson = JSON.jsonDecode(json.body)[1];
//     else
//       suggestionJson = null;
//     return suggestionJson!;
//   }
// }
