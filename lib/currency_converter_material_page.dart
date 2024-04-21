

import 'package:flutter/material.dart';


class CurrencyConverterMaterialPage extends StatefulWidget{
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends
  State<CurrencyConverterMaterialPage>{
  double result=0;
  final TextEditingController textEditingController = TextEditingController();
  void convert(){
    setState(() {
      result = double.parse(textEditingController.text)*83;
    });
  }
  //
  // @override
  // void dispose(){
  //   textEditingController.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context){

    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );
return Scaffold(
  backgroundColor: Colors.blueGrey,
  appBar: AppBar(
    backgroundColor: Colors.blueGrey,
    elevation: 0,
    title: const Text("Currency Converter",
      style: TextStyle(color: Colors.white,
      ),
    ),
    centerTitle: true,
  ),
  body: Center(
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
          child: TextField(
            controller:textEditingController,
            style:const TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "Please enter the amount in USD",
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
              prefixIcon:const Icon(Icons.monetization_on),
              prefixIconColor: Colors.black,
              filled: true,
              fillColor: Colors.white,
              focusedBorder:border,
              enabledBorder: border,
            ),
            keyboardType:const  TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed:convert,  //write like this convert ,not use like convert() because onPressed required void function.
            style:  TextButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5),
              ),
            ),
            child: const Text("Convert"),
          ),
        ),
      ],
    ),
  ),
);
    }
  }

