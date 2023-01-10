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

  List<double> _prices = [];
  List<String> _names = [];

  List<double> get prices {
    return _prices;
  }

  List<String> get names {
    return _names;
  }

  List<Cryptocurrency> get cryptocurrencyList {
    return _cryptocurrencyList;
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getCryptocurrencyList(String symbols, BuildContext context,{VoidCallback?  onApiResponse}) async {
    await isConnected().then((value) async {
      startLoader(context);
      _apiResponse = ApiResponse.loading('Data Loading');
      notifyListeners();
      try {
        _cryptocurrencyList = await _cryptoCurrencyRepository.fetchCryptoList('$cryptocurrencyQuotesUrl$symbols');
        _apiResponse = ApiResponse.completed('Data Received');
        if(onApiResponse!=null){
           closeLoader();
          onApiResponse();
        }
        notifyListeners();
      } catch (e) {
        _apiResponse = ApiResponse.error(e.toString());
        customPrinter(e.toString());
        showSnackBar(e.toString());
        closeLoader();
        notifyListeners();
      }

    }).onError((error, stackTrace) {
      _apiResponse = ApiResponse.notInternet('No internet connection!');
      closeLoader();
      notifyListeners();
    });
  }

  void loadChartData(){
    _prices.clear();
    _names.clear();
    for (var element in _cryptocurrencyList) {
      _prices.add(element.quote?.usd?.price ?? 0);
      _names.add(element.symbol);
    }
    notifyListeners();
  }
}
