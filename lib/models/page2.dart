import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  String image;
  String club;
  String name;
  int nomer;
  String years;
  String counrty;
  String position;
  String height;
  String fit;
  String logo;

  Page2(this.image, this.club, this.name, this.nomer, this.years, this.counrty,
      this.position, this.height, this.fit, this.logo);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),fit: BoxFit.cover,
                  )
                ),
                child: Container(
                  alignment: Alignment.bottomRight,
                  height: 50.0,
                  width: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(widget.logo),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
                      SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("General Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
                                SizedBox(height: 5.0,),
                                Text("Full name:\t\t\t${widget.name}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                Text("Born:\t\t\t${widget.years}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                Text("Citizenship:\t\t\t${widget.counrty}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                Text("Height:\t\t\t${widget.height}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                Text("Weight:\t\t\t${widget.fit}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                Text("Position:\t\t\t${widget.position}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                SizedBox(height: 10.0,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 400.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Club Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
                                SizedBox(height: 5.0,),
                                Text("Football Club:\t\t\t${widget.club}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                                Text("Room:\t\t\t${widget.nomer}",style: TextStyle(fontSize: 16.0, color: Colors.deepOrange),),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
