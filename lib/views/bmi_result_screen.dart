import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  determineBmiCategory(double bmiValue){
    String category = "";

    if (bmiValue < 16.0){
      category = underweightSevere;
    }else if (bmiValue < 17){
      category = underweightModerate;
    }else if (bmiValue < 18.5){
      category = underweightMild;
    }else if (bmiValue < 25){
      category = normal;
    }else if (bmiValue < 30){
      category = overweight;
    }else if (bmiValue < 35){
      category = obeseI;
    }else if (bmiValue < 40){
      category = obeseII;
    }else if (bmiValue >= 40){
      category = obeseIII;
    }

    return category;
  }

  String getHealthRiskDescription(String categoryName){
    String desc = "";
    switch (categoryName){
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;

      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;

      case obeseI:
      case obeseII:
      case obeseIII:
        desc = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;

      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Hitung BMI"),
      ),
      body: Column(children: [
        const Expanded(
          child: Center(
            child: Text("Hasil Perhitungan",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),
          )
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text(determineBmiCategory(bmi),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                Text(bmi.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                Text(
                  getHealthRiskDescription(determineBmiCategory(bmi)),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
              ]),
            ),
          )
        ),
        GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 80,
              color: const Color(0xffEC3C66),
              child: const Center(
                child: Text("Hitung Ulang",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
                ),
            ),
          )
      ],),
    );
  }
}