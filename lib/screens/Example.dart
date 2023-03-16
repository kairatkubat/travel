import 'package:flutter/material.dart';
import 'package:travel/main.dart';

class Example extends StatelessWidget {
   const Example({super.key});

  @override
  Widget build(BuildContext context) {
     return  const Scaffold(
      body: SafeArea(child: DataOwnerWidget()),
    );
  }
}
//statefull widget
class DataOwnerWidget extends StatefulWidget {
   const DataOwnerWidget({super.key});  

  @override
  State<DataOwnerWidget> createState() => _DataOwnerWidgetState();
}

class _DataOwnerWidgetState extends State<DataOwnerWidget> {
  var _valueOne = 0;
  var _valueTwo = 0;

  void _incrementOne(){
    _valueOne++;
    setState(() {
      
    });
  }
    void _incrementTwo(){
    _valueTwo++;
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _incrementOne, child: Text("press")),
         ElevatedButton(onPressed: _incrementTwo, child: Text("press")),
        DataProviderInherited(child: const DataConsumerStateless(),
         valueOne: _valueOne ,
         valueTwo: _valueTwo ,),
        
      ]
    );
  }
}
// first class 

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({super.key}); 

  @override

  Widget build(BuildContext context) {
    // final value = context.findAncestorStateOfType<_DataOwnerWidgetState>()?._value?? 0;
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(
      aspect: 'one')?.valueOne?? 0; 
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$value'),
        const DataConsumerStatefull(),
      ]),
    );
  }
}

//second class

class DataConsumerStatefull extends StatefulWidget {
   const DataConsumerStatefull({super.key});

  @override
  State<DataConsumerStatefull> createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {

  @override
  Widget build(BuildContext context) {

    // final value = 
    // context.findAncestorStateOfType<_DataOwnerWidgetState>()?._value?? 0;
    //
    // final value = getIngerit<DataProviderInherited>(context)?.valueOne?? 0;
    final value  = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'two')?.valueTwo?? 0;
   
    return Text('$value ');
  }
}

T? getIngerit<T>(BuildContext context){
final element = 
    context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    final widget = element?.widget;
    if(widget is T)
    {
     return widget as T;

    } else {return null; }
     

}
//ingerited widget

class DataProviderInherited extends InheritedModel<String> {
  final int valueOne;
  final int valueTwo; 
  const DataProviderInherited({
    Key? key, 
    required this.valueOne,
    required this.valueTwo,
    required Widget child 
    }) : super(child: child);

   

  static DataProviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo; 
  }
  
  @override
  bool updateShouldNotifyDependent(covariant
   DataProviderInherited oldWidget, Set<String> dependencies) {
   final isValueOneUpdated = valueOne != oldWidget.valueOne && dependencies.contains('one');
   final isValueTwoUpdated = valueTwo != oldWidget.valueTwo && dependencies.contains('two');
   return isValueOneUpdated||isValueTwoUpdated;
  }
}