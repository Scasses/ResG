import 'package:http/http.dart' as http;
import 'dart:convert';


class APICalls {
  Future<dynamic> fetchData(String url, String opInput) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (opInput == 'success') {
        var decodedData = jsonDecode(response.body);
        print(decodedData);
        return decodedData;
      }
    } catch (error) {
      if (error is http.Response) {
        if (error.statusCode == 400) {
          print(error.toString());
        }
      } else {
        print(error.toString());
      }
    }

    return null; // Add this return statement
  }
}


// class APICalls {
//   Future<dynamic> fetchData(String url, String opInput) async {
//     try {
//       http.Response response = await http.get(Uri.parse(url));
//       if (opInput == 'success') {
//         var decodedData = jsonDecode(response.body);
//         print(decodedData);
//         return decodedData;
//       }
//     } catch (error) {
//       if (error is http.Response) {
//         if (error.statusCode == 400) {
//           print(error.toString());
//         }
//       } else {
//         print(error.toString());
//       }
//     }
//   }
// }




// class APICalls {
//
//   Future<dynamic> fetchData(String url, String opInput) async {
//     try{
//     http.Response response = await http.get(Uri.parse(url));
//     if (opInput == 'success'){
//       var decodedData = jsonDecode(response.body);
//       print(decodedData);
//       return decodedData;
//     }
//
//     } catch (error) {
//       if (error == 400){
//         print(error.toString());
//       }
//       // print(error.toString());
//     }
//
//   }
//
// }


// return http.put(Uri.parse(url), headers: <String, String>{
// 'Content-Type': 'application/json; charset=UTF-8',
// },
// body: jsonEncode(<String, String>{
// 'Reservoir Level': opInput,
// })
// );
