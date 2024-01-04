import 'package:flutter/material.dart';
import 'package:csit2023/register.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เข้าสู่ระบบ'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(
                    'images/12345.png'), // Replace with the actual image path
                width: 250.0,
                height: 250.0,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ชื่อผู้ใช้'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'รหัสผ่าน'),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add your authentication logic here
                  // Example: authenticateUser(username, password);
                },
                child: Text('เข้าสู่ระบบ'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 50),
                  side: BorderSide(
                    color: Color.fromARGB(255, 164, 128, 225),
                    width: 2.0,
                  ),
                  backgroundColor: Color.fromARGB(255, 164, 128, 225),
                ),
              ),
              SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => RegisterUserForm(),
                    ),
                  );
                },
                child: Text('ลงทะเบียนผู้ใช้ใหม่'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}