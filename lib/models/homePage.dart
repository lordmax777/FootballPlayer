import 'dart:convert';
import 'package:aliaxr/malumot/dbmal.dart';
import 'package:aliaxr/models/page1.dart';
import 'package:aliaxr/models/page2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:http/http.dart' as http;

List<String> imgList = [
  "https://www.fcbarcelona.com/fcbarcelona/photo/2021/02/25/800a4af4-a92a-4116-b9be-0f3c44ad5c84/mini_2021-02-25-OTRO-BARCELONA-ELCHE-14.JPG",
  "https://www.vbetnews.com/wp-content/uploads/2020/08/neymar-5.jpg",
  "https://islom.uz/img/section/2019/10/1571123604.png",
  "https://images.indianexpress.com/2019/12/mesut-ozil-759.jpg",
  "https://images2.minutemediacdn.com/image/fetch/w_736,h_485,c_fill,g_auto,f_auto/https%3A%2F%2Ftherealchamps.com%2Fwp-content%2Fuploads%2Fgetty-images%2F2020%2F07%2F1204216976-850x560.jpeg",
  "https://images.firstpost.com/wp-content/uploads/2021/05/Paul-Pogba-640.jpg?impolicy=website&width=1200&height=800",
  "https://api.internationalchampionscup.com/v1/storage/df79b33b-db4d-42c7-a5c7-d3ae6b36c5f3?w=1600",
  "https://e0.365dm.com/21/07/768x432/skysports-cristiano-ronaldo_5433673.jpg?20210701141924",
  "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/05/22/15585438479360.jpg",
  "https://conteudo.imguol.com.br/c/esporte/a7/2017/08/27/gareth-bale-lamenta-durante-jogo-do-real-madrid-contra-o-valencia-1503870584800_1920x1509.jpg",
];

class FutbolPalyer extends StatefulWidget {
  const FutbolPalyer({Key? key}) : super(key: key);

  @override
  _FutbolPalyerState createState() => _FutbolPalyerState();
}

class _FutbolPalyerState extends State<FutbolPalyer> {
  late var posts;
  var _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  malumotOlibKel() async {
    await Future.delayed(Duration(seconds: 5));
    var jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/malumot.json");
    List<Player> playerList =
        (jsonDecode(jsonData) as List).map((e) => Player.fromJson(e)).toList();
    return playerList;
  }

  @override
  void initState() {
    super.initState();
    posts = malumotOlibKel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 200.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Page1(imgList)));
            },
          ),
          Expanded(
            child: FutureBuilder(
              future: malumotOlibKel(),
              builder: (context, snapshot) {
                posts = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  height: 120.0,
                                  width: 110.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${posts[index].image.toString()}"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  width: 170.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${posts[index].name.toString()}",
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          "${posts[index].club.toString()}",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 28.0,
                                    backgroundImage: NetworkImage(
                                        "${posts[index].logo.toString()}"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Page2(
                                posts[index].image.toString(),
                                posts[index].club.toString(),
                                posts[index].name.toString(),
                                posts[index].nomer,
                                posts[index].years.toString(),
                                posts[index].counrty.toString(),
                                posts[index].position.toString(),
                                posts[index].height.toString(),
                                posts[index].fit.toString(),
                                posts[index].logo.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: posts.length,
                  );
                } else {
                  return Center(
                    child: Container(
                      child: CupertinoActivityIndicator(
                        radius: 30.0,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          child: Container(
            margin:
                EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      )
      .toList();
}
