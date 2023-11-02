import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          elevation: 1,
          title: Text("Tab Bar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        ),
        body:DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.white,
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.red, width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Breads"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.pinkAccent, width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Status"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.pinkAccent, width: 1)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Call"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: TabBarView(
              //     children: [
              //       ListView.separated(
              //         padding: EdgeInsets.all(15),
              //         itemCount: 20,
              //         separatorBuilder: (BuildContext context, int index) => const Divider(),
              //         itemBuilder: (context, index){
              //           return ListTile(
              //             onTap: () {},
              //             title: Text("Chat List $index"),
              //             subtitle: Text("Tab bar ui"),
              //             trailing: Icon(Icons.arrow_circle_right_sharp),
              //           );
              //         },
              //       ),
              //       ListView.separated(
              //         padding: EdgeInsets.all(15),
              //         itemCount: 20,
              //         separatorBuilder: (BuildContext context, int index) => const Divider(),
              //         itemBuilder: (context, index){
              //           return ListTile(
              //             onTap: () {},
              //             title: Text("Status List $index"),
              //             subtitle: Text("Tab bar ui"),
              //             trailing: Icon(Icons.arrow_circle_right_sharp),
              //           );
              //         },
              //       ),
              //       ListView.separated(
              //         padding: EdgeInsets.all(15),
              //         itemCount: 20,
              //         separatorBuilder: (BuildContext context, int index) => const Divider(),
              //         itemBuilder: (context, index){
              //           return ListTile(
              //             onTap: () {},
              //             title: Text("Call List $index"),
              //             subtitle: Text("Tab bar ui"),
              //             trailing: Icon(Icons.arrow_circle_right_sharp),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        )
    );
  }
}
