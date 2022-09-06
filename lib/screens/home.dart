import 'package:bmi_calculator/constraints/app_constraints.dart';
import 'package:bmi_calculator/widgets/widgets_leftbar.dart';
import 'package:bmi_calculator/widgets/widgets_rightbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator",
        style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w800)
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Text("Meter - kg",
          style: TextStyle(color: Colors.white),),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.7)
                        )
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.7)
                        )
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 30,),

            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                _heightController.clear();
                _weightController.clear();

                setState(() {
                  _bmiResult = _w / (_h * _h);

                  if(_bmiResult >= 30) {
                    _textResult = "Obesity";
                  } else if (_bmiResult >= 25 && _bmiResult <= 29.99) {
                    _textResult = "Overweight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 24.99){
                    _textResult = "Normal Weight";
                  } else {
                    _textResult = "Underweight";
                  }
                });
              },
              child: Text("Calculate",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accentHexColor)),
            ),
            SizedBox(height: 50,),
            
            Container(
              child: Text(_bmiResult.toStringAsFixed(2), style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold, color: accentHexColor)),
            ),
            SizedBox(height: 30,),


            Visibility(visible: _textResult.isNotEmpty,
                child: Container(
              child: Text(_textResult , style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: accentHexColor)),
            )),

            SizedBox(height: 40,),
            LeftBar(barWidth: 40),
            SizedBox(height: 30,),
            LeftBar(barWidth: 70),
            SizedBox(height: 30,),
            LeftBar(barWidth: 40),
            SizedBox(height: 20,),
            RightBar(barWidth: 70),
            SizedBox(height: 50,),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
