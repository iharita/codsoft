import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/screens/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final List<Map<String, String>> imgList = [
    {
      "item": "assets/tab1.jpg",
      "text": "Plan your day with HABITA"
    },
    {
      "item": "assets/tab2.jpg",
      "text": "Mobile Note List"
    },
    {
      "item": "assets/tab3.jpg",
      "text": "Planning Schedule"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CarouselSlider(
              items: imgList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['item']!,
                            fit: BoxFit.cover,
                            height: 400.0,
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            item['text']!,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width - 80,
              height: 60.0,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
              },
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Get Started",
                style: TextStyle(color: whiteColor, fontSize: 22),
              ),
            ),
          ),
        ],
      ),

    );
  }
}