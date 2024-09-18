import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/screen/home_screen.dart';
import 'package:musical_app/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAutoLogin = false;
  bool isVisibilityPassword = true;

  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  var dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              //Image.asset('main_logo.png'),
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                style: const TextStyle(fontSize: 18.0),
                keyboardType: TextInputType.name,
                controller: idController,
                decoration: InputDecoration(
                  hintText: '이메일 또는 아이디',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(fontSize: 18.0),
                obscureText: isVisibilityPassword,
                controller: pwdController,
                decoration: InputDecoration(
                    hintText: '비밀번호',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          isVisibilityPassword = !isVisibilityPassword;
                        });
                      },
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                    side: MaterialStateBorderSide.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.selected)) {
                          return BorderSide(color: Colors.black, width: 1);
                        }
                        return BorderSide(color: Colors.black, width: 1);
                      },
                    ),
                    value: isAutoLogin,
                    onChanged: (value) {
                      setState(() {
                        isAutoLogin = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '로그인 상태 유지하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    Response response = await dio.post(
                      'http://ec2-52-78-180-65.ap-northeast-2.compute.amazonaws.com:3000/api/auth/login', // 로그인 경로로 수정
                      data: {
                        "username": "user@example.com", // 또는 이메일
                        "password": "qwer1234!!"
                      },
                      options: Options(
                        headers: {"Content-Type": "application/json"},
                      ),
                    );

                    if (response.statusCode == 200) {
                      // 로그인 성공 처리
                      var token = response.data['token']; // 서버가 반환한 토큰
                      print('로그인 성공: $token');
                      // 받은 토큰을 저장하거나 이후 요청에 사용할 수 있습니다.
                    } else {
                      print('로그인 실패: ${response.statusCode}');
                    }
                  } on DioException catch (e) {
                    if (e.response != null) {
                      print('서버 응답 에러: ${e.response?.data}');
                    } else {
                      print('요청 에러: ${e.message}');
                    }
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Text(
                  '로그인',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(70.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ));
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '로그인에 문제가 있나요?',
                  style: TextStyle(color: Colors.grey),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(130, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.grey, width: 0.5),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
