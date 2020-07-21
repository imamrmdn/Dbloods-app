import 'package:dbloods_app/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                    'Imam R',
                    'admin@dbloods.com',
                    'B +',
                    'Surabaya',
                    '20-09-1998',
                    'Laki-Laki',
                    'Mahasiswa',
                    '123456',
                  );

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
                child: Text('SignUp'),
              ),
              RaisedButton(
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signIn(
                    'admin@dbloods.com',
                    '12345678',
                  );

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
                child: Text('SignIn'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
