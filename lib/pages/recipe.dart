import 'package:flutter/material.dart';
import 'package:recipe_master/widget/support_widget.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "images/pasta.jpg",
              width: MediaQuery.of(context).size.width,
              height: 400,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 30, right: 20),
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 1.1),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "• Mint Pasta",
                    style: AppWidget.recipeHead(),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "About Recipe",
                    style: AppWidget.boldfieldtextstyle(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      " To make mint pasta, start by cooking your pasta of choice in salted boiling water according to the package instructions until al dente. Meanwhile, in a large pan, heat a bit of olive oil over medium heat and sauté finely chopped garlic until fragrant but not browned. Add a generous handful of fresh mint leaves, finely chopped, and cook briefly to release their aroma. For a creamy twist, stir in some heavy cream or a splash of pasta cooking water, letting it simmer to blend the flavors. Toss the cooked pasta into the pan, mixing well to coat it in the minty sauce. Finish with a sprinkle of grated Parmesan cheese, a squeeze of lemon juice for brightness, and a touch of salt and pepper to taste. Garnish with extra mint leaves if desired, and serve immediately for a refreshing and flavorful dish.")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
