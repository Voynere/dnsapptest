import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const kEndpoint = 'https://vacancy.dns-shop.ru';

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
  final _values = {'firstName': '', 'lastName': '', 'email': '', 'phone': ''};

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
                validator: (String value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введите имя';
                  }
                  _values['firstName'] = value.trim();
                  return null;
                 },
                ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Фамилия',
                ),
                validator: _validateText(
                  fieldName: 'lastName',
                  errorText: 'Введите фамилию',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'e-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: _validateText(
                  fieldName: 'email',
                  errorText: 'Введите e-mail',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Телефон',
                ),
                keyboardType: TextInputType.phone,
                validator: _validateText(
                  fieldName: 'phone',
                  errorText: 'Введите телефон',
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () async {
                      _formKey.currentState.validate();

                        final response = await http.post(
                        '$kEndpoint/api/candidate/token',
                        body: _values,
                        );
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');

                        print(await http.read('https://example.com/foobar.txt'));

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

  _validateText({String fieldName, String errorText}) {
    return (String value) {
      final testValue = value?.trim();
      if (testValue.isEmpty) {
        return errorText;
      }
      _values[fieldName] = testValue;
      return null;
    };
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
