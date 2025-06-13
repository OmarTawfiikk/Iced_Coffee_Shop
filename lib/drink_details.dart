import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'componants/toggle_widget.dart';
import 'model.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 0.5);
  double _currentPage = 0;
  int selectedIndex = 0;
  int? selectedSize;
  bool isSelectedSize = false;
  double drinkSize = 1.1;

  final drinks = DrinkModel.drinks;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top info (name and price)
            Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drinks[_currentPage.round()].name,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(drinks[_currentPage.round()].title),
                    ],
                  ),
                  Text(
                    "£${drinks[_currentPage.round()].price}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Drink images
            Positioned.fill(
              top: 100,
              bottom: 200,
              child: PageView.builder(
                controller: _controller,
                itemCount: drinks.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final scale = drinkSize - (_currentPage - index).abs();
                  final translateY = (_currentPage - index).abs() * 400;

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Transform.translate(
                        offset: Offset(translateY, 0),
                        child: Transform.scale(
                          scale: scale.clamp(0.5, 1.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                      bottom: 20,
                                      child: Image.asset(
                                        "assets/drinks/Ellipse 2.png",
                                        width: 120,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom: 60),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 25,
                                              offset: const Offset(0, 15),
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          drinks[index].image,
                                          fit: BoxFit.contain,
                                          height: MediaQuery.of(context).size.height * 0.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            // Bottom controls (sizes, toggles)
            Positioned(
              left: 20,
              right: 20,
              bottom: 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Size options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(11),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedSize == index ? Colors.orange : Colors.white,
                            border: Border.all(
                              color: selectedSize == index ? Colors.orange : Colors.black,
                            ),
                          ),
                          child: SvgPicture.asset(
                            "assets/Vector.svg",
                            color: selectedSize == index ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 30),
                  // Toggle and quantity selector
                  Row(
                    children:  [
                      Expanded(child: DrinkToggle()),
                      SizedBox(width: 40),
                      Expanded(child: QuantitySelector()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
