import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

//ChiHieu
class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  State<ListPage> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  bool _allMailboxes = false;
  bool _iCloud = false;
  bool _Gmail = false;
  bool _HotMail = false;
  bool _VIP = false;
  bool isChecked = false;
  bool _Secure = false;
  bool _Notification = false;
  String _getCheck = '';

  bool _deleteAll = false;
  bool _delIcloud = false;
  bool _delGmail = false;
  bool _delHotMail = false;
  bool _delVIP = false;
  bool _delSecure = false;
  bool _delNotification = false;

  final List<String> itemsMailBoxes = [
    'All inboxes',
    'iCloud',
    'Gmail',
    'Hotmail',
    'VIP',
  ];

  String _get(String index) {
    if (_allMailboxes) {
      return '_allMailboxes';
    } else if (_iCloud) {
      return '_iCloud';
    } else if (_Gmail) {
      return '_Gmail';
    } else if (_HotMail) {
      return '_HotMail';
    } else if (_VIP) {
      return '_VIP';
    }
    return '';
  }

  final List<String> itemsSpecialFolder = ['Secure', 'Notifications'];

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: new Center(
              child: new Text('Mailboxes',
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center)),
          backgroundColor: Colors.blueGrey[100],
          actions: [
            TextButton(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: const Text(
                  "Done",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Row(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 200, 0),
                  height: 50,
                  child: Text('Mailboxes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left),
                ),
              ]),
              Container(
                child: SizedBox(
                    child: Container(
                  color: Colors.white,
                  height: 245,
                  child: ListView.builder(
                    itemCount: itemsMailBoxes.length,
                    itemBuilder: (context, index) {
                      return Offstage(
                          offstage: (index == 0
                              ? _deleteAll
                              : index == 1
                                  ? _delIcloud
                                  : index == 2
                                      ? _delGmail
                                      : index == 3
                                          ? _delHotMail
                                          : _delIcloud),
                          child: Container(
                              decoration: new BoxDecoration(
                                  border: new Border(bottom: new BorderSide())),
                              child: ListTile(
                                  trailing: Text((index == 0
                                      ? (itemsMailBoxes.length - 1).toString()
                                      : '2')),
                                  leading: Container(
                                      child: Checkbox(
                                    value: (index == 0
                                        ? _allMailboxes
                                        : index == 1
                                            ? _iCloud
                                            : index == 2
                                                ? _Gmail
                                                : index == 3
                                                    ? _HotMail
                                                    : _VIP),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (index == 0) {
                                          _allMailboxes = !_allMailboxes;
                                          if (_allMailboxes) {
                                            _iCloud = true;
                                            _Gmail = true;
                                            _HotMail = true;
                                            _VIP = true;
                                          }
                                          if (!_allMailboxes) {
                                            _iCloud = false;
                                            _Gmail = false;
                                            _HotMail = false;
                                            _VIP = false;
                                          }
                                        } else if (index == 1) {
                                          _iCloud = !_iCloud;
                                        } else if (index == 2) {
                                          _Gmail = !_Gmail;
                                        } else if (index == 3) {
                                          _HotMail = !_HotMail;
                                        } else if (index == 4) {
                                          _VIP = !_VIP;
                                        }
                                      });
                                    },
                                  )),
                                  title: Row(
                                    children: [
                                      Icon((index == 0
                                          ? Icons.broken_image
                                          : index == 1
                                              ? Icons.cloud_circle
                                              : index == 2
                                                  ? Icons.email
                                                  : index == 3
                                                      ? Icons.mail
                                                      : Icons.account_box)),
                                      Text(itemsMailBoxes[index])
                                    ],
                                  ))));
                    },
                  ),
                )),
              ),
              Row(children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 200, 0),
                  height: 50,
                  child: Text('Specialfolder',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left),
                ),
              ]),
              Container(
                child: SizedBox(
                    child: Container(
                  color: Colors.white,
                  height: 400,
                  child: ListView.builder(
                    itemCount: itemsSpecialFolder.length,
                    itemBuilder: (context, index) {
                      return Offstage(
                          offstage:
                              (index == 0 ? _delSecure : _delNotification),
                          child: Container(
                              decoration: new BoxDecoration(
                                  border: new Border(bottom: new BorderSide())),
                              child: ListTile(
                                trailing: Text('1'),
                                leading: Container(
                                    child: Checkbox(
                                  value: (index == 0 ? _Secure : _Notification),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      if (index == 0) {
                                        _Secure = !_Secure;
                                      } else if (index == 1) {
                                        _Notification = !_Notification;
                                      }
                                    });
                                  },
                                )),
                                shape:
                                    Border.all(width: 2, color: Colors.black),
                                title: Row(
                                  children: [
                                    Icon((index == 0
                                        ? Icons.security
                                        : Icons.notification_add_sharp)),
                                    Text(itemsSpecialFolder[index])
                                  ],
                                ),
                              )));
                    },
                  ),
                )),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 2,
                          color: Colors.blue,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 220),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      if (_iCloud) {
                                        _delIcloud = true;
                                      }
                                      if (_Gmail) {
                                        _delGmail = true;
                                      }
                                      if (_HotMail) {
                                        _delHotMail = true;
                                      }
                                      if (_VIP) {
                                        _delVIP = true;
                                      }
                                      if (_Secure) {
                                        _delSecure = true;
                                      }
                                      if (_Notification) {
                                        _delNotification = true;
                                      }
                                      if (_allMailboxes) {
                                        _delIcloud = true;
                                        _delGmail = true;
                                        _delHotMail = true;
                                        _delVIP = true;
                                      }
                                    });
                                  },
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.delete_forever,
                                color: Colors.green[120],
                                size: 25.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//Gia Bao
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => ListPage())));
  }

  @override
  Widget build(BuildContext context) {
    Widget Imagesection = Image.asset(
      'img/1.jpg',
      fit: BoxFit.cover,
    );
    Widget TextSignln = Container(
      alignment: Alignment.center,
      child: Text(
        'Signln',
        style: TextStyle(fontSize: 60, color: Colors.white),
      ),
    );
    Widget Textabc = Container(
      alignment: Alignment.center,
      child: Text(
        'Speak, friend, and enter',
        style: TextStyle(fontSize: 20),
      ),
    );
    Widget Load = Container(
      width: 300,
      height: 300,
      child: SpinKitFadingCircle(color: Colors.white),
    );
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Imagesection,
          TextSignln,
          Textabc,
          Load,
        ],
      )),
    );
  }
}
