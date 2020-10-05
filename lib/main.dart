import 'package:flutter/material.dart';

void main() => runApp(DnsApp());

class DnsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DnsApp',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            textTheme: TextTheme(headline6: TextStyle(color: Colors.red))),
        home: HomePage(),
        routes: {
        '/transfering2': (context) => Transfering2(),
        },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text('Ввод данных'), leading: Icon(Icons.account_circle)),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Имя',
                ),
                autofocus: false,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Фамилия',
                ),
                autofocus: false,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Телефон',
                ),
                autofocus: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/transfering2');
                },
                child: Text('Получить ключ',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                color: Color.fromRGBO(205, 65, 85, 1),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Transfering2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Отправка данных')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ссылка на github',
                ),
                autofocus: false,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ссылка на резюме',
                ),
                autofocus: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/transfering2');
                },
                child: Text('Зарегистрироваться',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                color: Color.fromRGBO(205, 65, 85, 1),
              ),
            ),
          ]),
      ),
    );
  }
}