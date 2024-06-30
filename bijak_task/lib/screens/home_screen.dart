// screens/home_screen.dart
import 'package:bijak_task/controllers/home_controller.dart';
import 'package:bijak_task/widgets/app_bar.dart';
import 'package:bijak_task/widgets/category_list.dart';
import 'package:bijak_task/widgets/horizontal_product_list.dart';
import 'package:bijak_task/widgets/search_bar.dart';
import 'package:bijak_task/widgets/vertical_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find();

  List winDate = [
    "2024 ICC Men's T20 World Cup:\nDate: June 29, 2024 (Final Match)",
    "2011 Cricket World Cup:\nDate: April 2, 2011 (Final Match)",
    "2007 ICC Men's T20 World Cup:\nDate: September 24, 2007 (Final Match)",
    "1983 Cricket World Cup:\nDate: June 25, 1983 (Final Match)",
  ];

  List imageList = [
    'https://images.news18.com/ibnlive/uploads/2024/06/india-t20-world-cup-trophy-celebration-ap-2024-06-c21b16ae21f3b16a92545d4c9cd1e6fe.jpg?impolicy=website&width=640&height=480',
    'https://candornps.com/wp-content/uploads/2023/05/2011-world-cup-final-jpg-1200x720.webp',
    'https://www.sportsadda.com/static-assets/waf-images/5f/6b/bc/16-9/hoBHa9gkf9.jpg?v=1.6&w=1000',
    "https://img.jagranjosh.com/images/2021/December/20122021/1983WorldCupIndianWinningTeam.webp"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [const SliverToBoxAdapter(child: CustomAppBar())];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSearchBar(
                      onSearch: (value) {},
                    ),
                    const SizedBox(height: 16),
                    CarouselSlider(
                      options: CarouselOptions(autoPlay: true, height: 200.0),
                      items: [0, 1, 2, 3].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 2 / 3,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            imageList[i],
                                          )),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      color: Colors.amber),
                                ),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.grey,
                                              Colors.transparent
                                            ], // Grey fading to transparent
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20, left: 10),
                                          child: Text(
                                            winDate[i],
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        )))
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    CategoryList(),
                    const SizedBox(height: 16),
                    HorizontalProductList(products: controller.products),
                    VerticalProductList(products: controller.products),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
