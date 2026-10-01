import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<String> _clockStram() {
    return Stream.periodic(Duration(seconds: 1), (_) {
      return DateFormat("hh:mm:ss a").format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (kDebugMode) {
      print("height is $height");
      print("width is $width");
    }
    return Scaffold(
      body: StreamBuilder(
        stream: _clockStram(),
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 500) {
                return Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                style: TextStyle(fontSize: 278),
                                (snapshot.data![0] == '0'
                                    ? snapshot.data!.substring(1, 2)
                                    : snapshot.data!.substring(0, 2)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.pink,
                            child: Center(
                              child: Text(
                                snapshot.data!.substring(3, 5),
                                style: TextStyle(fontSize: 278),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                
              } else {
                return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                  snapshot.data == null ? "00" :
                                (snapshot.data![0] == '0'
                                    ? snapshot.data!.substring(1, 2)
                                    : snapshot.data!.substring(0, 2)),
                                style: TextStyle(fontSize: 278),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.pink,
                            child: Center(
                              child: Text(snapshot.data == null ? "00" :
                                snapshot.data!.substring(3, 5),
                                style: TextStyle(fontSize: 278),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                
    
            }
          },
        );
      },
    ));
  }
}

/*
 return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraints) {
            return StreamBuilder(stream: _clockStram(), builder: (context, snapshot) {
                if(constraints.maxWidth > 500) {
                    return Center(child: Text("Hi this is Horizontal"));
                } else {
                    return Scaffold(
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Expanded(child: Container(color:Colors.red, child: Text("data"))),
                            Expanded(child: Container(color: Colors.amber, child: Text("data")))
                        ],
                      ),
                    );
                }
            });}
        
      ),
    );
    snapshot.data![0] == '0' ? snapshot.data!.subString(0,1) : snapshot.data!.subString(0,2)

    return StreamBuilder(
      stream: _clockStram(),
      builder: (context, snapshot) {
        return LayoutBuilder(builder: (context, constraints) {
            if(constraints.maxWidth > 500) {
                    return Center(child: Text("Hi this is Horizontal"));
                } else {
                    return  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Expanded(child: Container(color:Colors.red, child: Text("data"))),
                            Expanded(child: Container(color: Colors.amber, child: Text("data")))
                        ],
                      
                    );
                }
        });
      },
    );

    Scaffold(
      body: Expanded(
        child: Column(
          children: [Expanded(child: Container(color: Colors.amber)),Expanded(child: Container(color: Colors.red))],
        ),
      ),
    );

    treamBuilder(
      stream: _clockStram(),
      builder: (context, snapshot) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 500) {
              return Scaffold(
                body: Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                                style: TextStyle(fontSize: 278),
                              (snapshot.data![0] == '0'
                                  ? snapshot.data!.substring(1, 2)
                                  : snapshot.data!.substring(0, 2)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.pink,
                          child: Center(child: Text(snapshot.data!.substring(3, 5),style: TextStyle(fontSize: 278),)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                                style: TextStyle(fontSize: 278),
                              (snapshot.data![0] == '0'
                                  ? snapshot.data!.substring(1, 2)
                                  : snapshot.data!.substring(0, 2)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.pink,
                          child: Center(child: Text(snapshot.data!.substring(3, 5),style: TextStyle(fontSize: 278),)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  
  
  
*/
