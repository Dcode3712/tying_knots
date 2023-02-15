
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tying_knots/Screen/detail_screen.dart';
import 'package:http/http.dart' as http;


import '../Model/basic_model.dart';
import '../main.dart';


class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key, bool? islike}) : super(key: key);
  bool? like;
  HomeScreen({this.like});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int id = 0;
  bool isload = false;
  bool isloadmore = false;
  Basic? basic;
  Basic? boating;
  Basic? climbing;
  Basic? fishing;
  Basic? fav;

  // String selectedid = "0";

  // int tabid = 11;

  List colorlist = [
    const Color(0xff9E896F),
    const Color(0xff5D747B),
    const Color(0xff67618E),
    const Color(0xff8E618A),
    const Color(0xff7D8E61),
  ];

  BasicScreenData() async {
    // if(basicdata.isNotEmpty)
    // {
    //   final prefs = await SharedPreferences.getInstance();
    //   favlist = prefs.getStringList('favid')!;
    //   favourite = favlist.join(",");
    //   print(favlist[0]);
    // }
    final http.Response response = await http.get(Uri.parse(BASIC_URL),);

    if (response.statusCode == 200) {
      setState(() {
        isload = true;
        basic = Basic.fromJson(jsonDecode(response.body));
        basicdata = [];
        for(int i =0; i < basic!.data!.length; i++){
          bool isadd = false;
          for(int i1 = 0 ; i1< favlist.length; i1++) {
            if( favlist[i1] == basic!.data![i].tId){
              isadd = true;
              break;
            } else {
              isadd = false;
            }
          }
          basicdata.add(Datum(name: basic!.data![i].name,
              images: basic!.data![i].images,
              isfav: isadd,
              like: basic!.data![i].like,
              status: basic!.data![i].status,
              step: basic!.data![i].step,
              tId: basic!.data![i].tId,
              view: basic!.data![i].view));
          basicdata.sort((a, b) => a.name!.compareTo(b.name!));
        }
        print("--------- Catagory : ${basic!.toJson().toString()}   ------------");
        print("--------- url : ${"$BASIC_URL"} -------------");
        print("--------- data : ${basicdata.length} -------------");
      });
    } else {
      throw Exception('Failed to update data.');
    }
  }

  BoatingScreenData() async {
    if(boatingdata.isNotEmpty)
    {
      final prefs = await SharedPreferences.getInstance();
      favlist = prefs.getStringList('favid')!;
      favourite = favlist.join(",");
      print(favlist);
    }
    // final prefs = await SharedPreferences.getInstance();
    // favlist = prefs.getStringList('favid')!;
    // favourite = favlist.join(",");
    // print(favlist);
    final http.Response response = await http.get(Uri.parse(BOATING_URL),);

    if (response.statusCode == 200) {
      setState(() {
        isload = true;
        boating = Basic.fromJson(jsonDecode(response.body));
        boatingdata = [];
        for(int i =0; i < boating!.data!.length; i++){
          bool isadd = false;
          for(int i1 = 0 ; i1< favlist.length; i1++) {
            if( favlist[i1] == boating!.data![i].tId){
              isadd = true;
              break;
            } else {
              isadd = false;
            }
          }
          boatingdata.add(Datum(name: boating!.data![i].name,
              images: boating!.data![i].images,
              isfav: isadd,
              like: boating!.data![i].like,
              status: boating!.data![i].status,
              step: boating!.data![i].step,
              tId: boating!.data![i].tId,
              view: boating!.data![i].view));
          boatingdata.sort((a, b) => a.name!.compareTo(b.name!));
        }
        print("--------- Catagory : ${boating!.toJson().toString()}   ------------");
        print("--------- url : ${"$BOATING_URL"} -------------");
        print("--------- data : ${boatingdata.length} -------------");
      });
    } else {
      throw Exception('Failed to update data.');
    }
  }

  ClimbingScreenData() async {
    if(climbingdata.isNotEmpty)
    {
      final prefs = await SharedPreferences.getInstance();
      favlist = prefs.getStringList('favid')!;
      favourite = favlist.join(",");
      print(favlist);
    }
    // final prefs = await SharedPreferences.getInstance();
    // favlist = prefs.getStringList('favid')!;
    // favourite = favlist.join(",");
    // print(favlist);
    final http.Response response = await http.get(Uri.parse(CLIMBING_URL),);

    if (response.statusCode == 200) {
      setState(() {
        isload = true;
        climbing = Basic.fromJson(jsonDecode(response.body));
        climbingdata = [];
        for(int i =0; i < climbing!.data!.length; i++){
          bool isadd = false;
          for(int i1 = 0 ; i1< favlist.length; i1++) {
            if( favlist[i1] == climbing!.data![i].tId){
              isadd = true;
              break;
            } else {
              isadd = false;
            }
          }
          climbingdata.add(Datum(name: climbing!.data![i].name,
              images: climbing!.data![i].images,
              isfav: isadd,
              like: climbing!.data![i].like,
              status: climbing!.data![i].status,
              step: climbing!.data![i].step,
              tId: climbing!.data![i].tId,
              view: climbing!.data![i].view));
          climbingdata.sort((a, b) => a.name!.compareTo(b.name!));
        }
        print("--------- Catagory : ${climbing!.toJson().toString()}   ------------");
        print("--------- url : ${"$CLIMBING_URL"} -------------");
        print("--------- data : ${climbingdata.length} -------------");
      });
    } else {
      throw Exception('Failed to update data.');
    }
  }

  FishingScreenData() async {
    if(fishingdata.isNotEmpty)
    {
      final prefs = await SharedPreferences.getInstance();
      favlist = prefs.getStringList('favid')!;
      favourite = favlist.join(",");
      print(favlist);
    }
    // final prefs = await SharedPreferences.getInstance();
    // favlist = prefs.getStringList('favid')!;
    // favourite = favlist.join(",");
    // print(favlist);
    final http.Response response = await http.get(Uri.parse(FISHING_URL),);

    if (response.statusCode == 200) {
      setState(() {
        isload = true;
        fishing = Basic.fromJson(jsonDecode(response.body));
        fishingdata = [];
        for(int i =0; i < fishing!.data!.length; i++){
          bool isadd = false;
          for(int i1 = 0 ; i1< favlist.length; i1++) {
            if( favlist[i1] == fishing!.data![i].tId){
              isadd = true;
              break;
            } else {
              isadd = false;
            }
          }
          fishingdata.add(Datum(name: fishing!.data![i].name,
              images: fishing!.data![i].images,
              isfav: isadd,
              like: fishing!.data![i].like,
              status: fishing!.data![i].status,
              step: fishing!.data![i].step,
              tId: fishing!.data![i].tId,
              view: fishing!.data![i].view));
          fishingdata.sort((a, b) => a.name!.compareTo(b.name!));
        }
        print("--------- Catagory : ${fishing!.toJson().toString()}   ------------");
        print("--------- url : ${"$FISHING_URL"} -------------");
        print("--------- data : ${fishingdata.length} -------------");
      });
    } else {
      throw Exception('Failed to update data.');
    }
  }

  FavouriteScreenData() async {
    if(favlist.isNotEmpty)
    {
      final prefs = await SharedPreferences.getInstance();
      favlist = prefs.getStringList('favid')!;
      favourite = favlist.join(",");
    }
      // final prefs = await SharedPreferences.getInstance();
      // favlist = prefs.getStringList('favid')!;
      // favourite = favlist.join(",");
    final http.Response response = await http.get(
      favlist.isEmpty
          ? Uri.parse(
          "https://expresstemplate.in/mix_drawing/webservice/bookmark.php?code=en")
          : Uri.parse(
          "$FAVOURITE_URL$favourite"),
    );

    if (response.statusCode == 200) {

      final dcode = jsonDecode(response.body);

      if(dcode["code"] == 400)
      {
        setState(() {
          favlist = [];
          isload = true;
        });
        print(isload);
      }
      else
      {
        setState(() {
          isloadmore = false;
          isload = true;
          fav = Basic.fromJson(jsonDecode(response.body));
          favdata = fav!.data!;
        });
      }
    }
    else {
      throw Exception('Failed to update data.');
    }
  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpref();
    BasicScreenData();
    getpref();
    BoatingScreenData();
    getpref();
    ClimbingScreenData();
    getpref();
    FishingScreenData();
    getpref();
    // FavouriteScreenData();
    favourite == "" || favlist.isEmpty ? null :FavouriteScreenData();
  }

getpref()
async {
  final prefs = await SharedPreferences.getInstance();
  favlist = prefs.getStringList('favid')!;
  favourite = favlist.join(",");
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: WillPopScope(onWillPop: showExitPopup, child: Scaffold(
        endDrawer: Drawer(
          child: Container(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20,top: 30),
                    color: const Color(0xff8376D0),
                    height: 210,
                    child: Row(
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("assets/logo.png",height: 130,width: 115)),
                        const SizedBox(width: 15,),
                        Text("$APPNAME",style: const TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Home",style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                              const Icon(Icons.home,size: 28,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          Share.share("");
                        },
                        child: Container(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Rate us",style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                              const Icon(Icons.star_rate,size: 28,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          Share.share(SHARE_APP);
                        },
                        child: Container(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Share app",style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                              const Icon(Icons.share,size: 28,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const SizedBox(width: 15,),
                      InkWell(
                        onTap: (){
                          Share.share(MORE_APP);
                        },
                        child: Container(
                          width: 270,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("More app",style: const TextStyle(fontSize: 21,fontWeight: FontWeight.w500),),
                              Image.asset("assets/app-store.png",height: 28,width: 28,color: Colors.grey,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                ],
              )
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color(0xff8376D0),
          title: Text(
            "$APPNAME",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            Builder(
                builder: (context) {
                  return InkWell(
                    onTap: (){
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Image.asset(
                      "assets/setting.png",
                      height: 27,
                      width: 27,
                    ),
                  );
                }
            ),
            const SizedBox(
              width: 15,
            )
          ],
          bottom: TabBar(
            labelStyle: const TextStyle(fontSize: 18),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            labelPadding: const EdgeInsets.symmetric(vertical: 9),
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (int index)async {
              setState(()  {
                id = index;
                isload = false;
              });
              getpref();
              index == 0 ?  BasicScreenData() :
              index == 1 ? BoatingScreenData() :
              index == 2 ?ClimbingScreenData() :
              index == 3 ? FishingScreenData() :
              // FavouriteScreenData();
              favourite == "" || favlist.isEmpty ? null :FavouriteScreenData();
            },
            tabs: [
              Container(
                  margin: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: id == 0 ? Colors.red : Colors.transparent),
                  height: 38,
                  width: 100,
                  child: const Tab(
                    text: "Basic",
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: id == 1 ? Colors.red : Colors.transparent),
                  height: 38,
                  width: 100,
                  child: const Tab(
                    text: "Boating",
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: id == 2 ? Colors.red : Colors.transparent),
                  height: 38,
                  width: 100,
                  child: const Tab(
                    text: "Climbing",
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: id == 3 ? Colors.red : Colors.transparent),
                  height: 38,
                  width: 100,
                  child: const Tab(
                    text: "Fishing",
                  )),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: id == 4 ? Colors.red : Colors.transparent),
                  height: 38,
                  width: 100,
                  child: const Tab(
                    text: "Favourite",
                  )),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            //  ---------- Basic ----------

            isload ? Container(
              padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 18),
              child: ListView.builder(
                  itemCount: basicdata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(name: basicdata[index].name!,id: int.parse(basicdata[index].tId!),islike: basicdata[index].isfav,)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: colorlist[index % colorlist.length],
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 200,
                                    child: Text(
                                      basicdata[index].name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          color: const Color(0xffD9D9D9)),
                                      child: Center(
                                          child: Text(
                                            "${basicdata[index].step} steps",
                                            style: TextStyle(
                                                color: colorlist[index % colorlist.length],
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                        setState(()  {

                                          // selectedid = basicdata[index].tId!;

                                          basicdata[index].isfav == false ? favlist.add(basicdata[index].tId!) : null;
                                          for (var i = 0; i < favlist.length; i++){
                                            if(favlist[i] == basicdata[index].tId) {
                                              int item = i;
                                              basicdata[index].isfav == true ?favlist.removeAt(item) : null;
                                            }
                                          }
                                          basicdata[index].isfav = basicdata[index].isfav == false ? true : false;

                                          print(favourite);

                                        });
                                        final prefs = await SharedPreferences.getInstance();
                                        await prefs.setStringList('favid', favlist);
                                        //
                                        // favlist = prefs.getStringList('favid')!;
                                        // FavouriteScreenData();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.44)),
                                        child: Center(
                                          child: Icon(
                                            basicdata[index].isfav == true ? Icons.favorite :Icons.favorite_border,
                                            color: const Color(0xffFF2D54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                height: 105,
                                width: 105,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  CachedNetworkImage(
                                  imageUrl: "${BASE_URL}/images/tattoo/thumb/${basicdata[index].images}",
                                  placeholder: (context, url) =>  const CircularProgressIndicator(color: Color(0xff8376D0),),
                                  errorWidget: (context, url, error) =>  const Icon(Icons.error),
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ) :
            Center(child: CircularProgressIndicator(color: Color(0xff8376D0),)),

            //  ---------- Boating ----------

            isload ? Container(
              padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 18),
              child: ListView.builder(
                  itemCount: boatingdata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(name: boatingdata[index].name!,id: int.parse(boatingdata[index].tId!),islike: boatingdata[index].isfav,)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: colorlist[index % colorlist.length],
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 200,
                                    child: Text(
                                      boatingdata[index].name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          color: const Color(0xffD9D9D9)),
                                      child: Center(
                                          child: Text(
                                            "${boatingdata[index].step} steps",
                                            style: TextStyle(
                                                color: colorlist[index % colorlist.length],
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          boatingdata[index].isfav == false
                                              ? favlist.add(boatingdata[index].tId!)
                                              : null;
                                          for (var i = 0; i < favlist.length; i++) {
                                            if (favlist[i] == boatingdata[index].tId) {
                                              int item = i;
                                              boatingdata[index].isfav == true
                                                  ? favlist.removeAt(item)
                                                  : null;
                                            }
                                          }
                                          boatingdata[index].isfav = boatingdata[index].isfav == false
                                              ? true
                                              : false;
                                        });
                                        final prefs = await SharedPreferences.getInstance();
                                        await prefs.setStringList('favid', favlist);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.44)),
                                        child: Center(
                                          child: Icon(
                                            boatingdata[index].isfav == true ? Icons.favorite :Icons.favorite_border,
                                            color: const Color(0xffFF2D54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                height: 105,
                                width: 105,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  CachedNetworkImage(
                                  imageUrl: "${BASE_URL}/images/tattoo/thumb/${boatingdata[index].images}",
                                  placeholder: (context, url) =>  const CircularProgressIndicator(color: Color(0xff8376D0),),
                                  errorWidget: (context, url, error) =>  const Icon(Icons.error),
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ) :
            Center(child: CircularProgressIndicator(color: Color(0xff8376D0),)),


            //  ---------- Climbing ----------

            isload ? Container(
              padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 18),
              child: ListView.builder(
                  itemCount: climbingdata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(name: climbingdata[index].name!,id: int.parse(climbingdata[index].tId!),islike: climbingdata[index].isfav,)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: colorlist[index % colorlist.length],
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 200,
                                    child: Text(
                                      climbingdata[index].name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          color: const Color(0xffD9D9D9)),
                                      child: Center(
                                          child: Text(
                                            "${climbingdata[index].step} steps",
                                            style: TextStyle(
                                                color: colorlist[index % colorlist.length],
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          climbingdata[index].isfav == false
                                              ? favlist.add(climbingdata[index].tId!)
                                              : null;
                                          for (var i = 0; i < favlist.length; i++) {
                                            if (favlist[i] == climbingdata[index].tId) {
                                              int item = i;
                                              climbingdata[index].isfav == true
                                                  ? favlist.removeAt(item)
                                                  : null;
                                            }
                                          }
                                          climbingdata[index].isfav = climbingdata[index].isfav == false
                                              ? true
                                              : false;
                                        });
                                        final prefs = await SharedPreferences.getInstance();
                                        await prefs.setStringList('favid', favlist);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.44)),
                                        child: Center(
                                          child: Icon(
                                            climbingdata[index].isfav == true ? Icons.favorite :Icons.favorite_border,
                                            color: const Color(0xffFF2D54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                height: 105,
                                width: 105,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child:  CachedNetworkImage(
                                  imageUrl: "${BASE_URL}/images/tattoo/thumb/${climbingdata[index].images}",
                                  placeholder: (context, url) =>  const CircularProgressIndicator(color: Color(0xff8376D0),),
                                  errorWidget: (context, url, error) =>  const Icon(Icons.error),
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ) :
            Center(child: CircularProgressIndicator(color: Color(0xff8376D0),)),

            //  ---------- Fishing ----------


            isload ? Container(
              padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 18),
              child: ListView.builder(
                  itemCount: fishingdata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(name: fishingdata[index].name!,id: int.parse(fishingdata[index].tId!),islike: fishingdata[index].isfav,)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: colorlist[index % colorlist.length],
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 200,
                                    child: Text(
                                      fishingdata[index].name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                          color: const Color(0xffD9D9D9)),
                                      child: Center(
                                          child: Text(
                                            "${fishingdata[index].step} steps",
                                            style: TextStyle(
                                                color: colorlist[index % colorlist.length],
                                                fontWeight: FontWeight.w700),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          fishingdata[index].isfav == false
                                              ? favlist.add(fishingdata[index].tId!)
                                              : null;
                                          for (var i = 0; i < favlist.length; i++) {
                                            if (favlist[i] == fishingdata[index].tId) {
                                              int item = i;
                                              fishingdata[index].isfav == true
                                                  ? favlist.removeAt(item)
                                                  : null;
                                            }
                                          }
                                          fishingdata[index].isfav = fishingdata[index].isfav == false
                                              ? true
                                              : false;
                                        });
                                        final prefs = await SharedPreferences.getInstance();
                                        await prefs.setStringList('favid', favlist);
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: const Color(0xffFFFFFF)
                                                .withOpacity(0.44)),
                                        child: Center(
                                          child: Icon(
                                            fishingdata[index].isfav == true ? Icons.favorite :Icons.favorite_border,
                                            color: const Color(0xffFF2D54),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                height: 105,
                                width: 105,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl: "${BASE_URL}/images/tattoo/thumb/${fishingdata[index].images}",
                                  placeholder: (context, url) =>  const CircularProgressIndicator(color: Color(0xff8376D0),),
                                  errorWidget: (context, url, error) =>  const Icon(Icons.error),
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ) :
            Center(child: CircularProgressIndicator(color: Color(0xff8376D0),)),



            //  ---------- Favourite ----------
            isload
                ? favlist.isEmpty
                ? const Center(
              child: Text(
                "No Data Found",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ) :
            Container(
                padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 18),
                child: ListView.builder(
                    itemCount: favdata.length,
                    itemBuilder: (context, index) {
                      int revindex =  favdata.length -1 - index;
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(name: favdata[revindex].name!,id: int.parse(favdata[revindex].tId!),islike: true,)));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: colorlist[index % colorlist.length],
                              borderRadius: BorderRadius.circular(10)),
                          height: 160,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 200,
                                      child: Text(
                                        favdata[revindex].name!,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(50),
                                            color: const Color(0xffD9D9D9)),
                                        child: Center(
                                            child: Text(
                                              "${favdata[revindex].step} steps",
                                              style: TextStyle(
                                                  color: colorlist[index % colorlist.length],
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          setState(() {
                                            for (var i = 0; i < favlist.length; i++){
                                              if(favlist[i] == favdata[revindex].tId) {
                                                int item = i;
                                                favlist.removeAt(item);
                                              }
                                            }

                                          });
                                          final prefs = await SharedPreferences.getInstance();
                                          await prefs.setStringList('favid', favlist);
                                          favourite == "" || favlist.isEmpty ? null : FavouriteScreenData();
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              color: const Color(0xffFFFFFF)
                                                  .withOpacity(0.44)),
                                          child: const Center(
                                            child: Icon(
                                              Icons.favorite,
                                              color: const Color(0xffFF2D54),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                  height: 105,
                                  width: 105,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl: "${BASE_URL}/images/tattoo/thumb/${favdata[revindex].images}",
                                    placeholder: (context, url) =>  const CircularProgressIndicator(color: Color(0xFF192033),),
                                    errorWidget: (context, url, error) =>  const Icon(Icons.error),
                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    })
            ) :
            const Center(
              child: const CircularProgressIndicator(color: Color(0xff8376D0)),
            )
          ],
        ),
      )),
    );
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.all(Radius.circular(16))),
        backgroundColor:  Colors.white,
        title: const Text(
          'Exit app',
          style: TextStyle(
              fontSize: 22,
              letterSpacing: 0.7,
              fontFamily: "ProductBold",
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        content: const Text(
          'Do you want to exit an app?',
          style: TextStyle(
              fontSize: 18.5,
              letterSpacing: 0.7,
              fontFamily: "ProductRegular",
              color: Colors.black),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black12,
                  // onPrimary: Colors.white10,
                  // elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  'No',
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "RecoletaRegular",
                    letterSpacing: 0.7,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFF2D54),
                  // onPrimary: Colors.white,
                  shadowColor: const Color(0xca8376d0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: const Size(100, 40), //////// HERE
                ),
                onPressed: () => exit(0),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "RecoletaRegular",
                    letterSpacing: 0.7,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20)
        ],
      ),
    ) ?? false;
  }
}
