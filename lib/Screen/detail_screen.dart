import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tying_knots/Model/step_model.dart';

import '../main.dart';
import 'home_Screen.dart';

class DetailScreen extends StatefulWidget {
  String? name;
  int? id;
  bool? islike;

  DetailScreen({
    this.name,
    this.id,
    this.islike,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isload = false;
  bool isloadmore = false;
  StepData? step;
  List<StepDatum> stepdata = [];
  int steps = 0;

  // List<NetworkImage> imgList = [];

  DetailScreenData() async {
    final http.Response response = await http.get(
      Uri.parse(
          "$BASE_URL/webservice/get_step.php?code=en&tattoo_id=${widget.id}"),
    );

    if (response.statusCode == 200) {
      setState(() {
        // isloadmore = false;
        isload = true;
        step = StepData.fromJson(jsonDecode(response.body));
        stepdata = step!.data!;
        print(
            "--------- Catagory : ${step!.toJson().toString()}   ------------");
        print(
            "--------- url : ${"$BASE_URL/webservice/get_step.php?code=en&tattoo_id=${widget.id}"} -------------");
        print("--------- data : ${stepdata.length} -------------");
      });
    } else {
      throw Exception('Failed to update data.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DetailScreenData();

    // var list = [1,2,8];
    // var stringList = list.join(",");
    // print(stringList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8376D0),
        title: Text(
          "${widget.name}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        leadingWidth: 35,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen(like: widget.islike);
                },
              ));
            },
            icon: Icon(Icons.arrow_back,size: 25,)),
        centerTitle: false,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () async {
              setState(() {
                widget.islike == false
                    ? favlist.add(widget.id.toString())
                    : null;
                for (var i = 0; i < favlist.length; i++) {
                  if (favlist[i] == widget.id.toString()) {
                    int item = i;
                    widget.islike == true ? favlist.removeAt(item) : null;
                  }
                }
                widget.islike = widget.islike == false ? true : false;

                print(favlist);
              });
              final prefs = await SharedPreferences.getInstance();
              await prefs.setStringList('favid', favlist);
            },
            child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                width: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.white),
                child: Center(
                    child: Icon(
                  widget.islike == true ? Icons.favorite : Icons.favorite_border,
                  color: Color(0xffFF2D54),
                  size: 26,
                ))),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: isload == false
          ? Center(
              child: CircularProgressIndicator(color: const Color(0xff8376D0),  ),
            )
          : Container(
              child: Stack(
                children: [
                  Center(
                    child: CachedNetworkImage(
                      imageUrl:  "${BASE_URL}/images/steps/${stepdata[steps].image}",fit: BoxFit.fill,
                      placeholder: (context, url) =>  CircularProgressIndicator(color: const Color(0xff8376D0),),
                      errorWidget: (context, url, error) =>  Icon(Icons.error),
                    ),
                  ),
                  // Center(
                  //     child: Image.network(
                  //         "${BASE_URL}/images/steps/${stepdata[steps].image}",fit: BoxFit.fill,)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 35),
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffECECEC)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (steps>=1) {
                                  steps = 0 < steps ? steps - 1 : steps;
                                }
                                else
                                {
                                  print("NULL");
                                }
                              });
                            },
                            child: (steps>=1) ? Container(
                              height: 45,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: const Color(0xff25223E),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ) : Container(
                              height: 45,
                              width: 80,
                              decoration: BoxDecoration(
                                  color:Colors.transparent,
                                  borderRadius: BorderRadius.circular(8)),
                            )
                          ),
                          Container(
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xff25223E),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              "Steps\n${steps + 1}/${stepdata.length}",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (steps == stepdata.length-1) {
                                  print("NULL");
                                }
                                else
                                {
                                  steps = stepdata.length - 1 > steps
                                      ? steps + 1
                                      : steps;
                                }
                              });
                            },
                            child:  (steps == stepdata.length-1) ? Container( height: 45,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8)),) :
                            Container(
                              height: 45,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: const Color(0xff25223E),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
