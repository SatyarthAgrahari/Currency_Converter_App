import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget{
  const CurrencyConverterCupertinoPage({super.key});
  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState extends
State<CurrencyConverterCupertinoPage>{
  double result=0;
  final TextEditingController textEditingController = TextEditingController();
  void convert(){
    setState(() {
      result = double.parse(textEditingController.text)*83;
    });
  }

  @override
  void dispose(){
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){


    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle:  Text("Currency Converter"),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("INR ${result !=0 ? result.toStringAsFixed(2): result.toStringAsFixed(0)}",
              style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                controller:textEditingController,
                style:const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  color:CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: "Please enter the amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                onPressed:convert,       //write like this convert ,not use like convert() because onPressed required void function.
                color: CupertinoColors.black,
                child: const Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}