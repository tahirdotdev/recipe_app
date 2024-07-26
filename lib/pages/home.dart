
import 'package:flutter/material.dart';
import 'package:recipe_master/widget/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Looking for your\nfavorite meal?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "images/boy.jpg",
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xffcbc4c4),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search_outlined),
                    hintText: "Search Recipe..."),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                        child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "images/soup.jpg",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Soup Recipes",
                          style: AppWidget.lightfieldtextstyle(),
                        )
                      ],
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "images/miancourse.jpg",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Main Course",
                              style: AppWidget.lightfieldtextstyle(),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "images/indian.jpg",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Indian Recipes",
                              style: AppWidget.lightfieldtextstyle(),
                            )
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "images/chinese.jpg",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Chinese Recipes",
                              style: AppWidget.lightfieldtextstyle(),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10)
                            ,child: Image.asset("images/pasta.jpg",height: 300,width: 250,fit: BoxFit.cover,))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
