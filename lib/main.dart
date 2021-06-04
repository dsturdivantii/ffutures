import 'package:flutter/material.dart';

void main() {
  runApp(News());
}
// Douglas Sturdivant
//Future Flutter API

class News extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
      title: Text('Future Flutters API'),
          home: FirstPage(),

        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class -FirstPageState extends State<FirstPage> {
  final news = ApiCallClass().getNews();

  @override
   void initState() {
print('Start building Widget');
super.initState();
}

@override
Widget build(BuildContext context){
    return Scaffold(
    body: FutureBuilder<List<Article>>(builder: (context, snapshot{
      if(snapshot.hasError){
        return Text(snapshot.data.toString());
}
}), future: news ,)
    );
}
}