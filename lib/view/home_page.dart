import 'package:calculator/constants/constants.dart';
import 'package:calculator/controller/controller.dart';
import 'package:calculator/model/neu_button_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final myprovider = Provider.of<CalcProvider>(context);
    return Scaffold(
      backgroundColor: MyConstants.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                myprovider.question,
                style: const TextStyle(
                  fontSize: 60,
                ),
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                myprovider.answer,
                style: const TextStyle(fontSize: 60),
              ),
            ],
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: MyConstants.buttons.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeuButton(
                    onTap: () {
                      if (index == 0) {
                        return myprovider.clearFunction();
                      } else if (index == 1) {
                        return myprovider.deleteFunction();
                      } else if (index == MyConstants.buttons.length - 1) {
                        return myprovider.equalPressed();
                      } else {
                        return myprovider.displayText(index);
                      }
                    },
                    position: Alignment.center,
                    bgColor: MyConstants.bgcolor,
                    child: Text(MyConstants.buttons[index],
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
