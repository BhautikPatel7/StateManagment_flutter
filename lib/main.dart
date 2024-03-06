import 'package:flutter/material.dart'; 
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:widget_pratice/Adaptivedesign.dart';
import 'package:widget_pratice/AnimateContainers.dart';
import 'package:widget_pratice/AnimationWscubeCon.dart';
import 'package:widget_pratice/BMIcal.dart';
import 'package:widget_pratice/CreatingCustomWidget.dart';
import 'package:widget_pratice/CustomWidget.dart';
import 'package:widget_pratice/Parallxeffect.dart';
import 'package:widget_pratice/SplashScreen.dart';
import 'package:widget_pratice/Textfield.dart';
import 'package:widget_pratice/grid.dart';
import 'package:widget_pratice/managestate.dart';
import 'package:widget_pratice/simplecalac.dart';
import 'package:widget_pratice/fifth.dart';
import 'package:widget_pratice/four.dart';
import 'package:widget_pratice/login.dart';
import 'package:widget_pratice/second.dart';
import 'package:widget_pratice/seven.dart';
import 'package:widget_pratice/Flutter_Cart_Assignment.dart';
import 'package:widget_pratice/src/People.dart';
import 'package:widget_pratice/styleandtheme.dart';
import 'package:widget_pratice/third.dart';
import 'package:widget_pratice/ui_login.dart';
import 'package:widget_pratice/validation.dart';
import 'package:widget_pratice/workwithtab.dart'; 

void main() { 
runApp(MyApp()); 
} 

class MyApp extends StatefulWidget { 
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
   late Animation<double> animation; 
   late AnimationController controller; 
      @override 
   void initState() {
      super.initState(); 
      controller = AnimationController(
         duration: const Duration(seconds: 5), vsync: this); 
      animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller); 
      controller.forward(); 
   } 
@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	// Define the app's theme 
	theme: ThemeData( 
		primarySwatch:  Colors.amber, // Set the app's primary theme color

    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 29,fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),
    ) 
	), 
	debugShowCheckedModeBanner: false, // Remove debug banner 
	// home: SimpleCalc()
  // home: SignUpScreen(),
  // home: TextfieldsGetting (),
  // home: CounterStatefulclass(),
  // home: GridExample(),
  //home: StyleandTheme(),
  // home: CustomWidget(),
  // home: WorkWithTabs(),
  // home: CustomWidgetUn(),
  //home: ExampleParallax(),
  // home: SpashScrren(),
  // home: BmiCalculator(),
  // home:AdaptiveDesign(),
    // home: MyHomePage(title: 'Product layout demo home page', animation: animation,)
   home: AnimationWscubeCon(),
  
  ); 
  // home: MyApphy(),
	// ); 
  
} 
 @override 
   void dispose() {
      controller.dispose();
      super.dispose(); 
   } 
} 

class CircularSliderWidget extends StatelessWidget {
  const CircularSliderWidget({super.key});
 
@override 
Widget build(BuildContext context) { 
	return Scaffold( 
	appBar: AppBar( 
		title: const Text('Sleek Circular Slider Example'), 
	), 
	body: Center( 
		child: SleekCircularSlider( 
		initialValue: 50, // Initial value 
		max: 100, // Maximum value 
		appearance: CircularSliderAppearance( 
			customColors: CustomSliderColors( 
			progressBarColors: [Colors.blue,Color.fromARGB(255, 119, 51, 51)], // Customize progress bar colors 
			trackColor: Colors.grey, // Customize track color 
			shadowColor: Colors.green, // Customize shadow color 
			shadowMaxOpacity: 0.2, // Set shadow maximum opacity 
			), 
			customWidths: CustomSliderWidths( 
			progressBarWidth: 12, // Set progress bar width 
			trackWidth: 12, // Set track width 
			shadowWidth: 20, // Set shadow width 
			), 
			size: 200, // Set the slider's size 
			startAngle: 150, // Set the starting angle 
			angleRange: 240, // Set the angle range 
			infoProperties: InfoProperties( 
			// Customize label style 
			mainLabelStyle: TextStyle(fontSize: 24, color: Colors.blue), 
			modifier: (double value) { 
				// Display value as a percentage 
				return '${value.toStringAsFixed(0)}%'; 
			}, 
			), 
			spinnerMode: false, // Disable spinner mode 
			animationEnabled: true, // Enable animation 
		), 
		onChange: (double value) { 
			// Handle value change here 
		}, 
		), 
	), 
	); 
} 
} 
