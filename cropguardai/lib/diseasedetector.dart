import 'package:flutter/material.dart';
import 'package:cropguardai/weatherpage.dart';
import 'package:cropguardai/croprecommenderpage.dart';
import 'package:cropguardai/diseasedetector.dart';
import 'package:cropguardai/homepage.dart';
class DiseaseDetectorPage extends StatefulWidget{
  const DiseaseDetectorPage({super.key,required this.title});
  final String title;
  @override
  State<DiseaseDetectorPage>createState()=>_DiseaseDetectorPageState();
}

class _DiseaseDetectorPageState extends State<DiseaseDetectorPage>{
    int _selectedIndex=2;
  final List<Widget> _pages = [
    MainHomePage(title: "HomePage"), // Example Home Page
    CropRecommenderPage(
        title: 'CropRecommender Page'), // Example Crop Recommender Page
    DiseaseDetectorPage(
        title: 'DiseaseDetector Page'), // Example Disease Detector Page
    WeatherPage(title: 'Weather Page'), // Example Weather Page
  ];
    void _navigateToPage(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _pages[index],
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar: AppBar(
        backgroundColor: const Color(0xFF88C431),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if(_selectedIndex<3){
              _navigateToPage(_selectedIndex-1);
            }
            else{
              _navigateToPage(0);
            }
             // Navigate back to the previous page
          },
        ),
        title: const Text('CropGuardAI',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/logo.png'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            const Color.fromARGB(178, 215, 159, 74), // Light beige color
        selectedItemColor: const Color(0xFF375709),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // Set the selected index
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  _pages[index], // Navigate to the page at the selected index
            ),
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco),
            label: 'Crop Recommender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bug_report),
            label: 'Disease Detector',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Weather',
          ),
        ],
      ),
    );
  }
}