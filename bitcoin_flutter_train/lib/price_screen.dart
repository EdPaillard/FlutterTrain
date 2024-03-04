import 'package:flutter/material.dart';
import 'package:bitcoin_flutter_train/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  CoinData coinData = CoinData();
  Map<String, String> cryptoValue = {};
  bool isWaiting = true;

  void getCryptoValue() async {
    isWaiting = true;
    var data = await coinData.getCryptoConvert(selectedCurrency);
    isWaiting = false;

    setState(() {
      cryptoValue = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getCryptoValue();
  }

  DropdownButton<String> androidDropdownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem<String>(
        value: currency,
        child: Text(currency),
      );

      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) async {
        setState(
          () {
            selectedCurrency = value!;
            getCryptoValue();
          },
        );
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: ((selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          getCryptoValue();
        });
      }),
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                CryptoCard(
                  value: cryptoValue['BTC'] == null ? '?' : cryptoValue['BTC']!,
                  cryptoCurrency: 'BTC',
                  selectedCurrency: selectedCurrency,
                ),
                const SizedBox(
                  height: 10,
                ),
                CryptoCard(
                  value: cryptoValue['ETH'] == null ? '?' : cryptoValue['ETH']!,
                  cryptoCurrency: 'ETH',
                  selectedCurrency: selectedCurrency,
                ),
                const SizedBox(
                  height: 10,
                ),
                CryptoCard(
                  value: cryptoValue['LTC'] == null ? '?' : cryptoValue['LTC']!,
                  cryptoCurrency: 'LTC',
                  selectedCurrency: selectedCurrency,
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    Key? key,
    required this.value,
    required this.cryptoCurrency,
    required this.selectedCurrency,
  }) : super(key: key);

  final String value;
  final String cryptoCurrency;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurrency = $value $selectedCurrency',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
