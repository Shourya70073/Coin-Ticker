import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'networking.dart';
import 'dart:io';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var sc = 'USD';
  var bpri;
  var epri;
  var apri;

  void getdata(var s) async {
    networking n1 = networking();
    await n1.getbtcprice(s);
    await n1.getethprice(s);
    await n1.getaudprice(s);
    setState(() {
      bpri = n1.btcpricee;
      bpri = bpri.toInt();
      epri = n1.ethpricee;
      epri = epri.toInt();
      apri = n1.audpricee;
      apri = apri.toString();
      apri = apri.substring(0, 5);
    });
  }

  List<DropdownMenuItem<String>> getdropdownitem() {
    List<DropdownMenuItem<String>> l1 = [];
    for (int i = 0; i < currenciesList.length; i++) {
      String name = currenciesList[i];
      var ele = DropdownMenuItem(
        child: Text(name),
        value: name,
      );
      l1.add(ele);
    }
    return l1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata(sc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(' Coin Ticker'),backgroundColor: Colors.pink,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.pink,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bpri ' + "$sc",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.pink,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $epri ' + "$sc",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.pink,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 AUD = $apri ' + "$sc",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.pink,
            child: DropdownButton<String>(
                iconEnabledColor: Colors.white,
                value: sc,
                items: getdropdownitem(),
                onChanged: (value) {
                  setState(() {
                    sc = value!;
                  });
                  getdata(sc);
                }),
          ),
        ],
      ),
    );
  }
}
