//class UI
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_tac_toc_game/controller.dart';

class UI extends StatefulWidget {
  final Controller gameController;
  const UI({super.key, required this.gameController});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ThemeMode selectedThemeMode = ThemeMode.system;
  double scale = 1.0;
  bool isArabic = false;
  late final controller = widget.gameController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //لأخفاء الشريط
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 192, 171, 248),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF9C27B0),
          secondary: Color(0xFF00FFA3),
          surface: Color.fromARGB(255, 192, 171, 248),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF1A0B2E),
        colorScheme: ColorScheme.dark(
          secondary: Color(0xFF00FFA3), //X
          primary: Color(0xFF9C27B0),
          surface: Color(0xFF2D1B4E),
        ),
      ),
      themeMode: selectedThemeMode,

      home: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text(isArabic ? "اكس أو" : "Tic Tac Toe"),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    controller.resetGame();
                  });
                },
                icon: Icon(Icons.refresh_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.eraser),
              ), //FontAwesomeIcons.eraser,
              IconButton(
                onPressed: () {
                  setState(() {
                    isArabic = !isArabic;
                  });
                },
                icon: Icon(Icons.translate),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    selectedThemeMode = selectedThemeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
                  });
                },
                icon: Icon(
                  selectedThemeMode == ThemeMode.dark
                      ? (Icons.nightlight_outlined)
                      : Icons.wb_sunny_outlined,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double size = constraints.maxWidth < 600
                      ? constraints.maxWidth * 0.9
                      : 500; // حد أقصى للشاشات الكبيرة

                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: size,
                            height: size / 6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.scoreX}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.secondary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      isArabic ? " X اللاعب" : "player X",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      selectionColor: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.draws}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      isArabic ? "تعادل" : "Draws",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${controller.scoreO}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      isArabic ? " O اللاعب" : "player O",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      selectionColor: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "X",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    isArabic ? " X اللاعب" : "player X",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.winningSquares.isNotEmpty &&
                                            controller.currentWinner == 'X'
                                        ? 'Winner!'
                                        : '',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "O",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    isArabic ? " O اللاعب" : "player O",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    controller.winningSquares.isNotEmpty &&
                                            controller.currentWinner == 'O'
                                        ? 'Winner!'
                                        : '',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Card(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                              itemCount: controller.listOfGame.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (controller.gameOver) return;
                                    setState(() {
                                      controller.switchBetweenXO(index);
                                      controller.playerXOrO =
                                          !controller.playerXOrO;
                                    });
                                  },

                                  onTapDown: (_) {
                                    setState(() {
                                      scale = 0.85; // pop effect عند الضغط
                                    });
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      scale = 1.0; // ترجع للحجم الطبيعي
                                    });
                                  },
                                  onTapCancel: () {
                                    setState(() {
                                      scale = 1.0; // إذا تم إلغاء الضغط
                                    });
                                  },
                                  child: TweenAnimationBuilder(
                                    tween: Tween<double>(
                                      begin: 1.0,
                                      end: scale,
                                    ),
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeOutBack,
                                    builder: (context, double scale, child) {
                                      return Transform.scale(
                                        scale: scale,
                                        child: AnimatedContainer(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.surface,
                                            border: Border.all(
                                              color:
                                                  controller.winningSquares
                                                      .contains(index)
                                                  ? Colors.greenAccent
                                                  : Color.fromARGB(
                                                      95,
                                                      239,
                                                      234,
                                                      234,
                                                    ),
                                              width: 3,
                                            ),
                                            boxShadow:
                                                controller.winningSquares
                                                    .contains(index)
                                                ? [
                                                    BoxShadow(
                                                      color: Colors.greenAccent,
                                                      blurRadius: 20,
                                                      spreadRadius: 3,
                                                    ),
                                                  ]
                                                : [],
                                          ),
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(8),
                                          alignment: Alignment.center,

                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeInOut,
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  controller.listOfGame[index],
                                                  style: TextStyle(
                                                    fontSize: 60,
                                                    color:
                                                        controller
                                                                .listOfGame[index] ==
                                                            'X'
                                                        ? Theme.of(context)
                                                              .colorScheme
                                                              .secondary
                                                        : Theme.of(
                                                            context,
                                                          ).colorScheme.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //ConfettiWidget(confettiController: controller.gameController, blastDirectionality: BlastDirectionality.explosive, ),
                                              ],
                                            ),
                                        ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

