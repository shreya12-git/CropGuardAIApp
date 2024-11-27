import 'package:flutter/material.dart';
import 'package:cropguardai/croprecommenderpage.dart';
import 'package:cropguardai/diseasedetector.dart';
import 'package:cropguardai/weatherpage.dart';
import 'package:cropguardai/chatbot.dart'; // Create this file for chatbot functionality.
import 'package:weather/weather.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key, required this.title});
  final String title;

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final String _apiKey = '79e506522da81525d14cf96406bfc944';
  WeatherFactory? _weatherFactory;
  Weather? _currentWeather;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MainHomePage(title: "HomePage"),
    CropRecommenderPage(title: 'CropRecommender Page'),
    DiseaseDetectorPage(title: 'DiseaseDetector Page'),
    WeatherPage(title: 'Weather Page'),
  ];

  @override
  void initState() {
    super.initState();
    _weatherFactory = WeatherFactory(_apiKey);
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      Weather weather = await _weatherFactory!.currentWeatherByCityName('Bhopal');
      setState(() {
        _currentWeather = weather;
      });
    } catch (e) {
      setState(() {
        _currentWeather = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF88C431),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: const AssetImage('assets/logo.png'),
          ),
        ),
        title: const Text(
          'CropGuardAI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Weather Info Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9F5D9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bhopal, Madhya Pradesh',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _currentWeather != null &&
                                      _currentWeather!.temperature != null
                                  ? '${_currentWeather!.temperature!.celsius!.toStringAsFixed(1)}°C'
                                  : 'Loading...',
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              _currentWeather != null &&
                                      _currentWeather!.weatherDescription != null
                                  ? _currentWeather!.weatherDescription!
                                  : 'Unable to fetch weather',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/weather_icon.png',
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Recent News Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'Recent News',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 200,
                  child: PageView(
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9F5D9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'News Item ${index + 1}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // About Us Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    'About Us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: const Text(
                          'CropGuardAI uses cutting-edge AI technology to detect crop diseases, pests, and deficiencies. We provide real-time solutions to help farmers reduce losses, improve crop health, and boost agricultural productivity. Empowering farmers with knowledge, we aim to revolutionize modern farming practices.',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        'assets/slide10.png',
                        width: 150,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating ChatBot Icon
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatBotPage(title: "ChatBot Page"),
                  ),
                );
              },
              backgroundColor: const Color(0xFF88C431),
              child: const Icon(Icons.chat_bubble, color: Colors.white),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(178, 215, 159, 74),
        selectedItemColor: const Color(0xFF375709),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _pages[index],
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
