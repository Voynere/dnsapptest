import 'package:flutter/material.dart';

void main() => runApp(DnsApp());

class DnsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnsApp',
      theme: ThemeData(
          primaryColor: Colors.orange,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.white,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.orange,
            textTheme: ButtonTextTheme.accent,
          )),
      home: HomePage(),
      routes: {
        '/summary': (context) => SummaryPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _values = {'firstName': '', 'lastName': '', 'phone': '', 'email': ''};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ввод данных'),
        //leading: Icon(Icons.account_circle)
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Имя',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Фамилия',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'e-mail',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Телефон',
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {
                      _formKey.currentState.validate();
                      Navigator.pushNamed(context, '/transfering2');
                    },
                    child: Text('Получить ключ'.toUpperCase()),
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Отправка данных')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ссылка на github',
              ),
              autofocus: false,
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ссылка на резюме',
              ),
              autofocus: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/summary');
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
