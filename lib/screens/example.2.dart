import 'package:flutter/material.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SimpleCalculate()),
    );
  }
}

class SimpleCalculate extends StatefulWidget {
  const SimpleCalculate({super.key});

  @override
  State<SimpleCalculate> createState() => _SimpleCalculateState();
}

class _SimpleCalculateState extends State<SimpleCalculate> {
  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 30),
        child: SimpleCulcWidgetProvider (
          model: _model,
          child: Column(
              children: const [
                FirstNumberWidget(),
                SizedBox(height: 10,),
                SecondNumberWidget(),
                SizedBox(height: 10,),
                SumButtonWidget(),
                SizedBox(height: 10,),
                ResultWidget(),
              ],
          ),
        ),
        ),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: (value) => 
      SimpleCulcWidgetProvider.of(context)?.firsNumber = value,
      decoration: const  InputDecoration(
        border: OutlineInputBorder()
      ),
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => 
      SimpleCulcWidgetProvider.of(context)?.secondNumber = value ,
      decoration: const InputDecoration(
        border: OutlineInputBorder()
      ),
    );
  }
}

class SumButtonWidget extends StatelessWidget {
  const SumButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(child: const Text("press"),
     onPressed: ()=> SimpleCulcWidgetProvider.of(context)?.summ(),);
  }
}



// class ResultWidget extends StatefulWidget {
//   const ResultWidget({super.key});

//   @override
//   State<ResultWidget> createState() => _ResultWidgetState();
// }

// class _ResultWidgetState extends State<ResultWidget> {
// String _value = '-1';
//   @override
//   void didChangeDependencies() {
//    super.didChangeDependencies();
//    final model = SimpleCulcWidgetProvider.of(context)?.model;
//    model?.addListener(() {
//     _value = '${model.summResult}';
//     setState(() {
      
//     });
//     }); 
     
//   }
//   @override
//   Widget build(BuildContext context) {
     
//     return  Text('$_value ');
//   }
// }

//with stateless widget

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = SimpleCulcWidgetProvider.of(context)?.summResult?? '-1';
    return Text('${value}');
  }
}

class SimpleCalcWidgetModel extends ChangeNotifier{
  int? _firsNumber;
  int? _seconNumber;
  int? summResult;
  set firsNumber(String value) => _firsNumber = int.tryParse(value);
  set secondNumber(String value) => _seconNumber = int.tryParse(value); 

  void summ(){
    int? summResult;
    if(_firsNumber!=null && _seconNumber != null){
      summResult = _firsNumber! + _seconNumber!;
    } else {
      summResult = -1;
    }
  if(this.summResult != summResult){
    this.summResult = summResult;  
  }
  

    notifyListeners();
  }
   
}

class SimpleCulcWidgetProvider extends    InheritedNotifier{      //InheritedWidget {
  final SimpleCalcWidgetModel model;
  const SimpleCulcWidgetProvider({
    super.key, required Widget child, 
    required this.model  
    }) : super(child: child, notifier: model );


  static SimpleCalcWidgetModel? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SimpleCulcWidgetProvider>()?.model;
  }

  // @override
  // bool updateShouldNotify(SimpleCulcWidgetProvider oldWidget) {
  //   return model != oldWidget.model;
  //}
}