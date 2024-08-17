import 'package:flutter/material.dart';
import 'package:musical_app/page/ChooseScreen.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  bool isAgree1 = false;
  bool isAgree2 = false;
  bool isAgree3 = false;
  bool isAgree4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          iconSize: 50,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '글쓰기',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 1),
                        value: isAgree1,
                        onChanged: (value) {
                          setState(() {
                            isAgree1 = value!;
                          });
                        },
                      ),
                      const Text(
                        '전체',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 1),
                        value: isAgree2,
                        onChanged: (value) {
                          setState(() {
                            isAgree2 = value!;
                          });
                        },
                      ),
                      const Text(
                        '추가',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 1),
                        value: isAgree3,
                        onChanged: (value) {
                          setState(() {
                            isAgree3 = value!;
                          });
                        },
                      ),
                      const Text(
                        '친구',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        side: BorderSide(color: Colors.black, width: 1),
                        value: isAgree4,
                        onChanged: (value) {
                          setState(() {
                            isAgree4 = value!;
                          });
                        },
                      ),
                      const Text(
                        '거래',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '<어쩌면 해피엔딩> 아직도 안 본 사람이 있다고??',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 5,
                    color: Colors.grey.withOpacity(0.2),
                    endIndent: 0,
                    indent: 0,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '거짓말..이걸 어떻게 안 봐.. 다보고 또 보려고 거짓말 하는 거지 !!',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 389,
              height: 150,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    Container(
      width: 75,
    height: 120,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(20.0),
    ),),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        '어쩌면 해피엔딩',
                        style: TextStyle(fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '캐스팅 : 정욱진, 윤은오, 홍지희, 박진주',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        '기간 : 2024.06.18~2024.09.08',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  IconButton(onPressed: (){},
                      icon : Icon(Icons.close,size: 20,weight: 10,)),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(90, 0, 90, 30),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade200,
                ),
                onPressed: () {
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChooseScreen()),
                        );
                      },
                      child: const Row(
                        children: <Widget>[
                          Icon(Icons.airplane_ticket_outlined,color: Colors.black,),
                          SizedBox(width: 8),
                          Text('뮤지컬 언급',style: TextStyle(color: Colors.black,)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
