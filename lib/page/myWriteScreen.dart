import 'package:flutter/material.dart';

class myWriteScreen extends StatefulWidget {
  const myWriteScreen({super.key});

  @override
  State<myWriteScreen> createState() => _myWriteScreenState();
}

class _myWriteScreenState extends State<myWriteScreen> {

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
          '내가 쓴 글',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            iconSize: 35,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
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
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    height: 121,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // 추가된 부분
                      children: [
                        Text(
                          "<어쩌면 해피엔딩> 아직도 안 본 사람이 있다고??",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left, // 추가된 부분
                        ),
                        SizedBox(height: 10),
                        Text(
                          "거짓말..이걸 어떻게 안 봐..",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.left, // 추가된 부분
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up_alt_outlined, size: 13),
                              onPressed: () {},
                            ),
                            Text(
                              "21",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.comment_outlined, size: 13),
                              onPressed: () {},
                            ),
                            Text(
                              "14",
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
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
