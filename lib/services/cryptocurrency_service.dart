import 'dart:convert';
import 'dart:io';
import 'package:cashrich_assignment/services/urls.dart';
import 'package:http/http.dart' as http;
import '../apis/app_exception.dart';
import 'base_service.dart';

class CryptocurrencyService extends BaseService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      var headers = {apiHeaderName:apiKey};
      final response = await http.get(Uri.parse(baseUrl + url),headers: headers);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

}
