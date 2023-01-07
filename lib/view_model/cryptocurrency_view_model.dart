import 'package:cashrich_assignment/model/cryptocurrency.dart';
import 'package:cashrich_assignment/repositories/cryptocurrency_repository.dart';
import 'package:cashrich_assignment/services/urls.dart';
import 'package:flutter/cupertino.dart';

import '../apis/api_response.dart';
import '../utils/utils.dart';

class CryptocurrencyViewModel extends ChangeNotifier {
  final CryptoCurrencyRepository _cryptoCurrencyRepository = CryptoCurrencyRepository();

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  List<Cryptocurrency> _cryptocurrencyList = [];


  List<Cryptocurrency> get cryptocurrencyList {
    return _cryptocurrencyList;
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getCryptocurrencyList() async {
    await isConnected().then((value) async {
      _apiResponse = ApiResponse.loading('Data Loading');
      notifyListeners();
      try {
        _cryptocurrencyList = await _cryptoCurrencyRepository.fetchCryptoList('${cryptocurrencyQuotesUrl}BTC,ETHLTC,BCH,BAT');
        _apiResponse = ApiResponse.completed('Data Received');
        notifyListeners();
      } catch (e) {
        _apiResponse = ApiResponse.error(e.toString());
        customPrinter(e.toString());
        showSnackBar(e.toString(), title: 'Error');
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      _apiResponse = ApiResponse.notInternet('No internet connection!');
      notifyListeners();
    });
  }
}
