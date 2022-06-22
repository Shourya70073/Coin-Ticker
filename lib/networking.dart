import 'dart:convert';

import 'package:http/http.dart';

class networking {
  double btcpricee = 0.0;
  double ethpricee = 0.0;
  double audpricee = 0.0;
  Future<void> getbtcprice(var s) async {
    Response json = await get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/BTC/$s/?apikey=1582B036-71BD-407B-9B47-52747CCE7927 "));
    var body = jsonDecode(json.body);
    var price = body["rate"];
    btcpricee = price;
  }
  Future<void> getethprice(var s) async {
    Response json = await get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/ETH/$s/?apikey=1582B036-71BD-407B-9B47-52747CCE7927 "));
    var body = jsonDecode(json.body);
    var price = body["rate"];
    ethpricee = price;
  }
  Future<void> getaudprice(var s) async {
    Response json = await get(Uri.parse(
        "https://rest.coinapi.io/v1/exchangerate/AUD/$s/?apikey=1582B036-71BD-407B-9B47-52747CCE7927 "));
    var body = jsonDecode(json.body);
    var price = body["rate"];
    audpricee = price;
  }

}
