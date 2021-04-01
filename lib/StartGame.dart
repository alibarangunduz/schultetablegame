import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class StartGame extends StatefulWidget {
  //arayüz tekrardan çizileceği için statefullWidget yaptın
  @override
  _StartGameState createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  int isClickedRightCard =
      0; //kartların sırayla tıklanması için bir önceki kart bilgisini tutan değişken
  Timer currentTime; //saniye bilgisi
  Timer currentTime2; //milisaniye bilgisi
  int millisecond = 0; //mili saniye hesaplamaasında kullanılan değişken
  int second = 0; //saniye hesaplamasında kullanılan değişken
  double bestScore = double.infinity; //ilk skor bilinen en büyük double sayısı
  double temp = 0; //bestscore hesaplamasında kullanılan geçici değişken
  bool _isVisible =
      false; //buttonun erkanda görülüp görülmemesini sağlayan boolean değişken

  List<GlobalKey<FlipCardState>> cardStateKeys =
      []; //kardların state bilgisini tutan dizi
  List<String> numbers =
      []; //erkanda 1 den 25 e kadar gösterilecek sayıları tutan dizi

  void _handleBestScore() {
    //best skore hesaplar
    if (temp < bestScore) {
      setState(() {
        bestScore = temp;
      });
    }
  }

  @override
  void initState() {
    //ekran ilk çizildiğinde çalışır
    super.initState();
    for (var i = 0; i < 25; i++) {
      //card ataması yapar
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }

    for (var i = 1; i < 26; i++) {
      numbers.add(i.toString()); //numbers dizisine 1 den 25 e kadar sayı atar
    }

    numbers.shuffle(); //number dizisindeki değerleri karıştırır.

    startSecond(); //saniyeyi başlatır.
    startMillisecond(); //mili saniyeyi başlatır.
  }

  void _handlePlayAgain() {
    // tekrar oyna butonuna tıklandığında bestscore haric diğer verileri sıfırlar ve arayüz değişen verilerle tekrar çizilir.
    cardStateKeys = [];
    numbers = [];
    isClickedRightCard = 0;
    millisecond = 0;
    second = 0;
    for (var i = 0; i < 25; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }

    for (var i = 1; i < 26; i++) {
      numbers.add(i.toString());
    }
    numbers.shuffle();
    startSecond();
    startMillisecond();
    _isVisible = false;
  }

  void showButton() {
    setState(() {
      _isVisible = true;
    });
  }

  startMillisecond() {
    currentTime2 = Timer.periodic(Duration(milliseconds: 1), (a) {
      setState(() {
        millisecond = millisecond + 1;
        if (millisecond == 60) {
          millisecond = 0;
        }
      });
    });
  }

  startSecond() {
    currentTime = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        second = second + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Time : $second . $millisecond",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Best Score: $bestScore"),
              Container(
                width: 400,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: GridView.count(
                    crossAxisCount: 5,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: List.generate(
                      25,
                      (i) {
                        return GestureDetector(
                          onTap: () {},
                          child: FlipCard(
                            key: cardStateKeys[i],
                            flipOnTouch: false,
                            front: RaisedButton(
                              color: Colors.grey[300],
                              onPressed: () {
                                if (numbers[i] == "1") {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "2" &&
                                    isClickedRightCard == 1) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "3" &&
                                    isClickedRightCard == 2) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "4" &&
                                    isClickedRightCard == 3) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "5" &&
                                    isClickedRightCard == 4) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "6" &&
                                    isClickedRightCard == 5) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "7" &&
                                    isClickedRightCard == 6) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "8" &&
                                    isClickedRightCard == 7) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "9" &&
                                    isClickedRightCard == 8) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "10" &&
                                    isClickedRightCard == 9) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "11" &&
                                    isClickedRightCard == 10) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "12" &&
                                    isClickedRightCard == 11) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "13" &&
                                    isClickedRightCard == 12) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "14" &&
                                    isClickedRightCard == 13) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "15" &&
                                    isClickedRightCard == 14) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "16" &&
                                    isClickedRightCard == 15) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "17" &&
                                    isClickedRightCard == 16) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "18" &&
                                    isClickedRightCard == 17) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "19" &&
                                    isClickedRightCard == 18) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "20" &&
                                    isClickedRightCard == 19) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "21" &&
                                    isClickedRightCard == 20) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "22" &&
                                    isClickedRightCard == 21) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "23" &&
                                    isClickedRightCard == 22) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "24" &&
                                    isClickedRightCard == 23) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (numbers[i] == "25" &&
                                    isClickedRightCard == 24) {
                                  cardStateKeys[i].currentState.toggleCard();
                                  isClickedRightCard++;
                                }
                                if (isClickedRightCard == 25) {
                                  currentTime.cancel();
                                  currentTime2.cancel();
                                  temp = second.toDouble() +
                                      (millisecond.toDouble() != 0
                                          ? millisecond.toDouble() / 100
                                          : 0);
                                  _handleBestScore();
                                  showButton();
                                }
                              },
                              child: Container(
                                color: Colors.grey[300],
                                child: Center(
                                  child: Text('${numbers[i]}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ),
                              ),
                            ),
                            back: Container(
                              color: Colors.green[300],
                              child: Center(
                                  child: Text('',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _isVisible,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        color: Colors.greenAccent,
                        child: Row(
                          children: [
                            Icon(Icons.restore),
                            SizedBox(width: 7.0),
                            Text("Play Again"),
                          ],
                        ),
                        onPressed: () {
                          _handlePlayAgain();
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
