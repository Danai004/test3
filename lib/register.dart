import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:csit2023/login_screen.dart';

class RegisterUserForm extends StatefulWidget {
  @override
  _RegisterUserFormState createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registerUser() async {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String dob = dobController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;

    // URL ของ API ที่ คุณ ต้องการเรียกใช้ (saveregister.php)
    String apiUrl = 'http://chiangraismartfarm.com/idoo/saveregister.php';
    //print(apiUrl);
    // สร้าง body ของ request เพื่อ ส่งข้อมูล
    Map<String, dynamic> requestBody = {
      'firstname': firstName,
      'lastname': lastName,
      'dob': dob,
      'email': email,
      'phone': phone,
      'password': password,
    };
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
      );
      print(response.statusCode);

      if (response.statusCode == 200) {
        // ดำเนินการเมื่อ request สำเร็จ
        //print('สมัครสมาชิกสำเร็จ');
        //print(response.body);
        showSuccessDialog(context);
      } else {
        // ดำเนินการเมื่อ request ไม่สำเร็จ
        print('ไม่สามารถสมัครสมาชิกได้');
      }
    } catch (error) {
      // ดำเนินการเมื่อเกิดข้อผิดพลาดในการเชื่อมต่อ
      print('เกิดข้อผิดพลาดในการเชื่อมต่อ: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'Firstname'),
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Lastname'),
            ),
            TextFormField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Telephone'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            ElevatedButton(
              onPressed: registerUser,
              child: Text('บันทึก'),
            ),
          ],
        ),
      ),
    );
  }
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Successfully'),
        content: Text('Your information has been successfully saved.'),
        actions: [
          TextButton(
            onPressed: () {
              //Navigator.of(context).pop(); // ปิด popup
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //builder: (context) => MainMenu(),
                  builder: (context) => LoginScreen()));
            },
            child: Text('Go to Login Page'),
          ),
        ],
      );
    },
  );
}
