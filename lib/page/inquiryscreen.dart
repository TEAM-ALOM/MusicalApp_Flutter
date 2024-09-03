import 'package:flutter/material.dart';
import 'inquiryDetailsScreen.dart';

class inquiryScreen extends StatefulWidget {
  const inquiryScreen({super.key});

  @override
  State<inquiryScreen> createState() => _inquiryScreenState();
}

class _inquiryScreenState extends State<inquiryScreen> {
  bool isAutoLogin = false;
  bool isVisibilityPassword1 = true;
  bool isVisibilityPassword2 = true;
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
          '문의하기',
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
                    '앱 관련 문의사항을 남겨주시면 빠른 시일 내로 답변드리도록 하겠습니다.감사합니다.',
                    softWrap: true,
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
                    obscureText: isVisibilityPassword1,
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
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(fontSize: 18.0),
                    obscureText: isVisibilityPassword2,
                    decoration: InputDecoration(
                      hintText: '문의사항을 입력하세요.',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(vertical: 100.0, horizontal: 10.0),
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
                            builder: (context) => inquiryDetailScreen(),
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