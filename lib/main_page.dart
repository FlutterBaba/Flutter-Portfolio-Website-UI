import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:web_portfolio_ui/widgets/hover_text_widget.dart';

Widget buildSocialButton({required image}) {
  return Container(
    width: 30,
    height: 30,
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
      ),
      border: Border.all(
        color: Color(0xff50545d),
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Desktop();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return Desktop();
        } else {
          return Mobile();
        }
      },
    );
  }
}

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  buildTopPart() {
    return AppBar(
      backgroundColor: Color(0xff010101),
      title: DefaultTextStyle(
        style: const TextStyle(fontSize: 35, color: Colors.white, shadows: [
          BoxShadow(
            blurRadius: 7.0,
            color: Colors.white,
            offset: Offset(0, 0),
          )
        ]),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(
              "FLUTTER BABA",
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
          onTap: () {
            print("onTap");
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Row(
            children: [
              HoverText(
                onTap: () {},
                text: "ABOUT",
              ),
              SizedBox(
                width: 30,
              ),
              HoverText(
                onTap: () {},
                text: "PORTFOLIO",
              ),
              SizedBox(
                width: 30,
              ),
              HoverText(
                onTap: () {},
                text: "CONTACT",
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010101),
      appBar: buildTopPart(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSocialButton(
                        image: "images/facebook.gif",
                      ),
                      buildSocialButton(
                        image: "images/instagram.gif",
                      ),
                      buildSocialButton(
                        image: "images/linkedin.gif",
                      ),
                      buildSocialButton(
                        image: "images/whatapp.gif",
                      ),
                      buildSocialButton(
                        image: "images/youtube.gif",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("images/3.png"),
                    )),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText(
                                "Welcome",
                                textStyle: TextStyle(
                                  fontSize: 100,
                                  fontFamily: "myfont",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("onTap");
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "We shape and activate brands through",
                                textStyle: TextStyle(
                                  fontSize: 30,
                                  color: Color(0xff666d77),
                                ),
                              )
                            ],
                            onTap: () {
                              print("onTap");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Mobile extends StatefulWidget {
  const Mobile({Key? key}) : super(key: key);

  @override
  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  Widget buildDrawer() {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff1e1e1e),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blueAccent,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          "images/2.png",
                        ),
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Yaqoob Bugti",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "PROTFOLIO",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "CONTACT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "ABOUT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSocialButton(
                image: "images/facebook.gif",
              ),
              buildSocialButton(
                image: "images/instagram.gif",
              ),
              buildSocialButton(
                image: "images/linkedin.gif",
              ),
              buildSocialButton(
                image: "images/whatapp.gif",
              ),
              buildSocialButton(
                image: "images/youtube.gif",
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff010101),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "myfont",
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText("Welcome",
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "myfont",
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.1,
                                  )),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {},
                          ),
                        ),
                      ),
                      Flexible(
                        child: DefaultTextStyle(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xff666d77),
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                "We shape and activate brands through",
                                textStyle: TextStyle(
                                  color: Color(0xff666d77),
                                  //  fontSize: 30
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30,
                                ),
                              ),
                            ],
                            onTap: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/3.png"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
