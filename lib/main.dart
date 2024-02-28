import 'package:flutter/material.dart'; 
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:widget_pratice/four.dart';
import 'package:widget_pratice/second.dart';
import 'package:widget_pratice/third.dart'; 

void main() { 
runApp(MyApp()); 
} 

class MyApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
	return MaterialApp( 
	// Define the app's theme 
	theme: ThemeData( 
		primarySwatch: Colors.green, // Set the app's primary theme color 
	), 
	debugShowCheckedModeBanner: false, // Remove debug banner 
	home: const Tutorials4(), 
	); 
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
