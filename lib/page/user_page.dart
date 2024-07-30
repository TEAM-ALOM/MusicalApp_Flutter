import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '마이 페이지',
          style: TextStyle(
              fontWeight: FontWeight.bold,
          fontSize: 30),
        ),
        backgroundColor: Colors.white,
      ),
      body:
      ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          Container(
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.withOpacity(0.2),
            ),
            child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle, size: 50),
                  onPressed: () {
                  },
                ),
                Text(
                  "탈뮤그거어떻게하는건데",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit_outlined, size: 30),
                  onPressed: () {
                  },
                )
              ],
            ),
          ),
          ListTile(
            title: Text('설정',style: TextStyle(
        fontWeight: FontWeight.bold,
            fontSize: 20)
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('내가 쓴 글'),
            trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('이메일 확인'),
            trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('비밀번호 확인'),
            trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
            },
          ),
          Divider(
            thickness: 5,
            color: Colors.grey.withOpacity(0.2),
            endIndent: 0,//디자인대로 사용하려면 padding 수정 필요
            indent: 0,
          ),
          ListTile(
            title: Text('문의하기'),
            trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('로그아웃'),
            trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
            },
          ),
          ListTile(
            title: Text('회원 탈퇴'),
            trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () {
            },
          ),
          Divider(
            thickness: 5,
            color: Colors.grey.withOpacity(0.2),
            endIndent: 0,
            indent: 0,
          ),
        ],
      ),
    );
  }
}
