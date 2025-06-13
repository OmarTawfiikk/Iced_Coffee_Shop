import 'package:flutter/material.dart';
import 'package:icecoffe/componants/drink.dart';
import 'package:icecoffe/model.dart';

import 'drink_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox (height: 100),

            ///Drink List
            ///
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: DrinkModel.drinks.length,
                  itemBuilder: (context, index) {
                  final drinks = DrinkModel.drinks[index];
                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        double offset = 0;
                        if(controller.hasClients) {
                          offset = controller.offset / 100 - index;
                        }
                        offset = offset.clamp(0, 1);
                        return Transform.scale(
                          scale: 1 - (offset * 0.2),
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => DrinkDetails())),
                            child: Drink(
                              name: drinks.name,
                              image: drinks.image,
                              title: drinks.title,
                              price: drinks.price.toString(),
                            ),
                          ),
                        );
                      },
                    );
                  }

              ),
            ),


          ],
        ),
      ),
    );
  }
}
