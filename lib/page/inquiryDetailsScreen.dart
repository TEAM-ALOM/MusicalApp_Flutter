import 'package:flutter/material.dart';

class inquiryDetailScreen extends StatefulWidget {
  const inquiryDetailScreen({super.key});

  @override
  State<inquiryDetailScreen> createState() => _inquiryDetailScreenState();
}

class _inquiryDetailScreenState extends State<inquiryDetailScreen> {
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
                    '전송되었습니다.',
                    style: TextStyle(
                      fontSize: 17,
                    ),
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