import 'package:flutter/material.dart';
import 'package:musical_app/page/passwordDetailsScreen.dart';

class passwordScreen extends StatefulWidget {
  const passwordScreen({super.key});

  @override
  State<passwordScreen> createState() => _passwordScreenState();
}

class _passwordScreenState extends State<passwordScreen> {
  bool isAutoLogin = false;
  bool isVisibilityPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '비밀번호 확인',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 추가된 부분
                children: [
                  const Text(
                    '비밀번호를 확인하려면 이메일을 입력하세요.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(fontSize: 18.0),
                    obscureText: isVisibilityPassword,
                    decoration: InputDecoration(
                      hintText: '이메일',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => passwordDetailScreen(),
                          ));
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size.fromHeight(70.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}