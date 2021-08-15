import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_adventure/model/RegisterData.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('登入頁面'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150.0,
              width: 200.0,
              padding: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: Center(
                child: Image.asset('assets/images/sb.jpg'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter valid mail id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                selectRegister(context);
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
              autofocus: false,
              clipBehavior: Clip.none,
            ),
            TextButton(
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
              autofocus: false,
              clipBehavior: Clip.none,
              onPressed: () {},
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  //todo Navigator to Page
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectRegister(context) async {
    final int tourist = 1;
    final int member = 2;
    int registerMode = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('請選擇註冊方式'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, tourist);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('遊客登入'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, member);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('會員註冊'),
                ),
              ),
            ],
          );
        });
    if (registerMode != null) {
      registerMode == tourist ? selectTourist(context) : selectMember(context);
    }
  }

  //uid 0開頭為遊客,1是會員
  Future<void> selectTourist(context) async {
    //todo api
    RegisterData registerData =
        RegisterData.onlyStatusAndNickName('Tourist', 'aaa');
    String registerDataToJson = registerData.json();
    Response response;
    var dio = Dio();
    response = await dio.post("http://13.112.99.27/api/register.php",
        data: registerDataToJson);
    print(registerDataToJson);
    print('response : $response');

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('成功'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('確定'))
            ],
          );
        });
  }

  Future<void> selectMember(context) async {
    //todo api
    RegisterData registerData = RegisterData('Member', 'ABCC', 'efg', 'ads');
    String registerDataToJson = registerData.json();
    Response response;
    var dio = Dio();
    response = await dio.post("http://13.112.99.27/api/register.php",
        data: registerDataToJson);
    print(registerDataToJson);
    print('response : $response');

    await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('成功'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('確定'))
            ],
          );
        });
  }
}
