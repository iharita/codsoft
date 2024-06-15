import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/screens/login.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, String>> imgList = [
    {
      "url": "https://img.freepik.com/free-vector/mobile-note-list-concept-illustration_114360-2347.jpg?t=st=1718272687~exp=1718276287~hmac=476f087ceb855b4cfa9b5f09bf709589751380ad8c308d4f57d78b4b2b82f6a9&w=740",
      "text": "Mobile Note List"
    },
    {
      "url": "https://img.freepik.com/free-vector/appointment-booking-with-smartphone_23-2148554232.jpg?t=st=1718272532~exp=1718276132~hmac=9d099dc53a79efa0316faa3071fd73b5ff33e560942cae01f201dc96ae7530d4&w=740",
      "text": "Appointment Booking"
    },
    {
      "url": "https://img.freepik.com/free-vector/lovely-hand-drawn-planning-schedule-concept_23-2147956312.jpg?t=st=1718272534~exp=1718276134~hmac=c9cd731d95189e3f4724eed4ee7bb70228fdf60d1c2adc67ee5deee306b34d21&w=740",
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
                          Image.network(
                            item['url']!,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              color: secondprimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Login",
                style: TextStyle(color: secondprimaryLightColor, fontSize: 22),
              ),
            ),
          ),
        ],
      ),

    );
  }
}