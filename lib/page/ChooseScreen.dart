import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
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
          '뮤지컬 언급',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        actions: [
          FilledButton(
          onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
      ),
      child: Text('완료',style: TextStyle(fontSize: 17,),),
    ),
        ],
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
                  TextFormField(
                    style: const TextStyle(fontSize: 18.0),
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(),
                        suffixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 16),
                Row(
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
                            Text(
                              '장르 : 로맨스',
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 250,),
                            FilledButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
                              ),
                              child: Text('언급하기',style: TextStyle(fontSize: 17,),),
                            ),
                          ],
                        ),
                      ],
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