import 'package:flutter/material.dart';
//import 'dart:convert' show utf8;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String s='Hello World';

  codec15(){
    print(s.length);
    print(s.codeUnits);
    print(s.codeUnits.first);
    print(s.codeUnitAt(0));
    print(String.fromCharCode(72));
    print(String.fromCharCodes([72,101,108]));
  }

  codec52(){

    var encoded = utf8.encode('Lorem ipsum dolor sit amet, consetetur...');
    //var encoded = utf8.encode('A');
    var decoded = utf8.decode(encoded);
    //var decoded = utf8.decode(s.codeUnits);
    print(encoded);
    print(decoded);
    //print(encoded.runtimeType); // Uint8List
  }

  codec35(){
    //var encoded = utf8.encode(s);
   // var name=Utf8Codec().name; //  utf-8
    var name=Utf8Codec().encode('Lorem ipsum dolor sit amet, consetetur...'); // [72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]
    var encoded = Utf8Encoder().convert('Lorem ipsum dolor sit amet, consetetur...');
    //var decoded = utf8.decode(s.codeUnits);
    var decoded =Utf8Decoder().convert([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);
    //var encoded = utf8.encode('A');
   // print(encoded.runtimeType);
    //print(encoded.buffer.lengthInBytes);  // 41
    print(encoded);
    print(decoded);
    print(name);
  }

  codec45(){

    var base64Encoded=Base64Encoder().convert([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);
    //var base64Decoded=Base64Decoder().convert('aaaaaaaaaaa',[6]);
    var encoded = Utf8Encoder().convert('Lorem ipsum dolor sit amet consetetur...');
    var decoded =Utf8Decoder().convert([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]);
   // print(base64Encoded);
   // print(base64Decoded);
  }

  codec55(){
    String credentials = "username:password";
    //Codec<String, String> stringToBase64 = utf8.fuse(base64);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);      // dXNlcm5hbWU6cGFzc3dvcmQ=
    print(encoded);
    String decoded = stringToBase64.decode(encoded);          // username:password
    print(decoded);
  }

  codec65(){
    String credentials = "username:password";
    var utf8_encode=utf8.encode(credentials);
    //String encoded = base64.encode(utf8.encode(credentials)); // dXNlcm5hbWU6cGFzc3dvcmQ=
    var encoded = base64.encode(utf8_encode);
    var decoded = base64.decode(encoded);     // username:password
    var utf8_decode=utf8.decode(decoded);
    print(utf8_encode);
    print(encoded);
    print(decoded);
    print(utf8_decode);
  }

  codec5() async{
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
   Utf8Codec utf8xx=Utf8Codec();
   var encoded = utf8xx.encode("hello");
   var decoded = utf8xx.decode(encoded);
   print(encoded);
   print(decoded);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    codec5();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ascii',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ascii'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Ascii'),
            ],
          ),
        ),
      ),
    );
  }
}
