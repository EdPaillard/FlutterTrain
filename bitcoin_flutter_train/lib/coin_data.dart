import 'package:bitcoin_flutter_train/network.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'OTIyMzZhNmY4ZmE0NDE4NDgyYzFmOGE5YzFiODY2Njc';
const bitcoinURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future<Map<String, String>> getCryptoConvert(String currency) async {
    Map<String, String> results = {};

    for (var crypto in cryptoList) {
      Uri url = Uri.parse('$bitcoinURL$crypto$currency');
      NetworkHelper networkHelper =
          NetworkHelper(url: url, headers: {'x-ba-key': apiKey});

      var cryptoData = await networkHelper.getData();
      double lastCrypto = cryptoData['last'];
      results[crypto] = lastCrypto.toStringAsFixed(3);
    }

    print(results);
    return results;
  }
}
