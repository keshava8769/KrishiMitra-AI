import 'dart:ui';
import 'package:flutter/material.dart';
import '../calculators/fertilizer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3),

      body: Stack(
        children: [

          /// MAIN CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// HEADER
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hello,Welcome👋 to",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16,
                                  color: Colors.black54),
                              SizedBox(width: 4),
                              Text(
                                "KrishiMitra",
                                style: TextStyle(
                                    color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                            Icons.notifications_none),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// WEATHER
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "32°",
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "assets/images/wheat.png",
                        height: 90,
                      ),
                    ],
                  ),

                  const Text(
                    "Sonoma County",
                    style:
                    TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 20),

                  /// FEATURE CARDS
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [

                      _featureCard(
                        context,
                        Icons.science,
                        "Fertilizer",
                            () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const FertilizerScreen(),
                            ),
                          );
                        },
                      ),

                      _featureCard(
                        context,
                        Icons.attach_money,
                        "Profit Calc",
                            () {},
                      ),

                      _featureCard(
                        context,
                        Icons.camera_alt,
                        "Disease Detect",
                            () {},
                      ),

                      _featureCard(
                        context,
                        Icons.account_balance,
                        "Gov Schemes",
                            () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  /// COMMODITIES
                  const Text(
                    "Commodities & Food",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),

                  SizedBox(
                    height: 90,
                    child: ListView(
                      scrollDirection:
                      Axis.horizontal,
                      children: [
                        _commodityItem(
                            context,
                            "Rice",
                            "assets/images/rice.jpg"),
                        _commodityItem(
                            context,
                            "Corn",
                            "assets/images/corn.jpeg"),
                        _commodityItem(
                            context,
                            "Grapes",
                            "assets/images/grapes.jpg"),
                        _commodityItem(
                            context,
                            "Potato",
                            "assets/images/potato.jpg"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// FIELD IMAGE
                  ClipRRect(
                    borderRadius:
                    BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/field.jpeg",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),

          /// FLOATING BLUR NAVIGATION
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.7),
                      borderRadius:
                      BorderRadius.circular(
                          40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize:
                      MainAxisSize.min,
                      children: [

                        const CircleAvatar(
                          radius: 22,
                          backgroundColor:
                          Colors.black,
                          child: Icon(
                            Icons.home,
                            color:
                            Colors.white,
                          ),
                        ),

                        const SizedBox(width: 30),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                const FertilizerScreen(),
                              ),
                            );
                          },
                          child:
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor:
                            Color(0xFFFFC978),
                            child: Icon(
                              Icons.eco,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        const SizedBox(width: 30),

                        const CircleAvatar(
                          radius: 22,
                          backgroundColor:
                          Color(0xFFFFC978),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// FIXED FEATURE CARD
  static Widget _featureCard(
      BuildContext context,
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28),
            const SizedBox(width: 10),

            /// FIX
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _commodityItem(
      BuildContext context,
      String name,
      String imagePath) {
    return Padding(
      padding:
      const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          if (name == "Rice") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                const FertilizerScreen(),
              ),
            );
          }
        },
        child: Column(
          children: [
            Container(
              padding:
              const EdgeInsets.all(
                  15),
              decoration:
              const BoxDecoration(
                shape:
                BoxShape.circle,
                color:
                Colors.white,
              ),
              child: Image.asset(
                  imagePath,
                  height: 30),
            ),
            const SizedBox(height: 6),
            Text(name),
          ],
        ),
      ),
    );
  }
}