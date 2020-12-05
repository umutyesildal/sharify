import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class onBoarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<onBoarding> {
  // 1 Step: Create List of Slides
  List<Slide> slides = new List();

  // 2 Step: Create goToTab function
  Function goToTab;

  // 3 Step: Initialize Images
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Share & Get",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        pathImage: "/assets/1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Search & Find",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        pathImage: "/assets/2.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Contact & Meet",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        pathImage: "/assets/3.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Let's Share !",
        styleTitle: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        pathImage: "/assets/4.png",
      ),
    );
  }

  // 4 Step: Create Other functions
  void onDonePress() {
    // Back to the first tab
    this.goToTab(0);
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.black,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.black,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.black,
    );
  }

  // 5 Step: Custom Tabs

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IntroSlider(
          // List slides
          slides: this.slides,

          // Skip button
          renderSkipBtn: this.renderSkipBtn(),
          colorSkipBtn: Colors.green,
          highlightColorSkipBtn: Colors.black,

          // Next button
          renderNextBtn: this.renderNextBtn(),

          // Done button
          renderDoneBtn: this.renderDoneBtn(),
          onDonePress: this.onDonePress,
          colorDoneBtn: Colors.green,
          highlightColorDoneBtn: Colors.black,

          // Dot indicator
          colorDot: Colors.green,
          sizeDot: 13.0,

          // Tabs
          listCustomTabs: this.renderListCustomTabs(),
          backgroundColorAllSlides: Colors.white,
          refFuncGoToTab: (refFunc) {
            this.goToTab = refFunc;
          },

          // Show or hide status bar
          shouldHideStatusBar: true,

          // On tab change completed
          onTabChangeCompleted: this.onTabChangeCompleted,
        ),
      ),
    );
  }
}
