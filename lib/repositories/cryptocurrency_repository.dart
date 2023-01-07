

import 'package:cashrich_assignment/model/cryptocurrency.dart';
import 'package:cashrich_assignment/model/cryptocurrency_res_data.dart';
import 'package:cashrich_assignment/services/cryptocurrency_service.dart';

class CryptoCurrencyRepository {
  final CryptocurrencyService _cryptocurrencyService = CryptocurrencyService();

  Future<List<Cryptocurrency>> fetchCryptoList(String endpoint) async {
    dynamic response = await _cryptocurrencyService.getResponse(endpoint);
    final data  = CryptoResData.fromJson(response);
    if(data.status?.errorCode == 0){
      return data.cryptoList;
    }else{
      return [];
    }
  }
}