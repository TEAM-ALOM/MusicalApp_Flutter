import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musical_app/page/SearchDetailsScreen.dart';

import 'WriteScreen.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 200),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '커뮤니티',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: communityTabBar(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.campaign_rounded),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '<어쩌면 해피엔딩> 아직도 안 본 사람이 있다고??',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen1(
                          name: '탈뮤그거어떻게하는건데',
                          title: '<어쩌면 해피엔딩> 아직도 안 본 사람이 있다고??',
                          contents: '거짓말.. 이걸 어떻게 안 봐.. 다 보고 또 보려고 거짓말 하는 거지 !!',
                        )),
                      );
                    },
                    child: CommentCard(
                      title: '<어쩌면 해피엔딩> 아직도 안 본 사람이 있다고??',
                      contents: '거짓말.. 이걸 어떻게 안 봐..',
                      likes: 21,
                      comments: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen2(
                          name: '뮤덕그렇게됐다',
                          title:'나랑 뮤지컬 보러 갈 사람',
                          contents:  '뭔가 새로운 느낌의 뮤지컬이 보고 싶어졌어 다들 추천해줘',
                        )),
                      );
                    },
                    child: CommentCard(
                      title: '나랑 뮤지컬 보러 갈 사람',
                      contents: '뭔가 새로운 느낌의 뮤지컬이 보고 싶어졌어',
                      likes: 0,
                      comments: 2,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){ Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WriteScreen()),
                );}, icon: Icon(Icons.border_color,size : 30)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  communityTabBar() {
    return TabBar(
        controller: tabController,
        labelColor: Colors.black,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        indicatorColor: Colors.transparent,
        indicator: BoxDecoration(color: Colors.transparent),
        tabs: [
          Tab(
            text: '전체',
          ),
          Tab(
            text: '후기',
          ),
          Tab(
            text: '같이 볼 사람',
          ),
          Tab(
            text: '거래',
          ),
        ]);
  }
}

class TabItem extends StatelessWidget {
  final String title;

  TabItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  final String title;
  final String contents;
  final bool isReply;
  final int likes;
  final int comments;

  CommentCard({
    required this.title,
    required this.contents,
    this.isReply = false,
    this.likes = 0,
    this.comments = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              contents,
              style: TextStyle(fontSize: 12),
            ),
            if (!isReply)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(likes.toString()),
                    SizedBox(width: 16.0),
                    Icon(Icons.comment_outlined, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(comments.toString()),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen1 extends StatefulWidget {
  final String title;
  final String contents;
  final String name;

  DetailScreen1({
    required this.title,
    required this.contents,
    required this.name,
  });

  @override
  State<DetailScreen1> createState() => _DetailScreen1State();
}

class _DetailScreen1State extends State<DetailScreen1> {
  int _likeCount = 21; // 초기 좋아요 수

  void _incrementLike() {
    setState(() {
      _likeCount++; // 좋아요 수 증가
    });
  }
  bool showReportButton = false;
  bool showReportButton1 = false;
  bool showReportButton2 = false;
  bool showReportButton3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '게시물',
          style: TextStyle(
            fontWeight: FontWeight.bold, // 제목의 글씨체 굵기 변경
            fontSize: 24, // 제목의 글씨 크기 변경
            color: Colors.black, // 제목의 글씨 색상 변경
          ),
        ),
        actions: [
          if (showReportButton)
            PopupMenuButton<String>(
              icon: Container(
                padding: EdgeInsets.all(8.0), // 테두리와 텍스트 간의 여백
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // 테두리 색상
                    width: 1.2,          // 테두리 두께
                  ),
                  borderRadius: BorderRadius.circular(5.0), // 테두리 둥글게 처리
                ),
                child: Row(
                  children: [
                    Text(
                      '신고하기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.chevron_right,size: 16,),
                  ],
                ),
              ),
              onSelected: (String result) {
                setState(() {
                  // 선택된 항목에 대한 동작 정의
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)), // 모서리 둥글기
                side: BorderSide(
                  color: Colors.black, // 테두리 색상
                  width: 2.0, // 테두리 두께
                ),
              ),
              color: Colors.white, // 배경색 흰색
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: '상업적 광고 및 판매',
                  child: Text('상업적 광고 및 판매',
                      style: TextStyle(color: Colors.black,
                        fontSize: 16,)),
                ),
                PopupMenuItem<String>(
                  value: '유출/사칭/사기',
                  child: Text('유출/사칭/사기',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                ),
                PopupMenuItem<String>(
                  value: '음란물',
                  child: Text('음란물',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                ),
                PopupMenuItem<String>(
                  value: '욕설/비하',
                  child: Text('욕설/비하', style: TextStyle(color: Colors.black,
                    fontSize: 16,)),
                ),
              ],
            ),

          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              setState(() {
                showReportButton = !showReportButton;  // 버튼을 토글
              });
            },
          ),
        ],
      ),
      body: Form(
        child:SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, size: 33),
                SizedBox(width: 8),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold, // 제목의 글씨체 굵기 변경
                fontSize: 23, // 제목의 글씨 크기 변경
                color: Colors.black, // 제목의 글씨 색상 변경
              ),
            ),
            SizedBox(height: 16), // 제목과 내용 사이의 간격
            Text(
              widget.contents,
              style: TextStyle(
                fontWeight: FontWeight.normal, // 내용의 글씨체 굵기 설정
                fontSize: 15, // 내용의 글씨 크기 설정
                color: Colors.grey[800], // 내용의 글씨 색상 설정
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "어쩌면 해피엔딩",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "캐스팅 : 정욱진, 윤은오, 홍지희, 박진주",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "기간:2024.06.18-2024.09.08",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.chevron_right),
                        onPressed:(){Navigator.of(context).push(MaterialPageRoute
                          (builder: (context) => const SearchDetailsScreen()));},
                      ),
                    ],
                  ),
              ),
            SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.thumb_up_alt_outlined),
                  onPressed: _incrementLike,
                ),
                Text('$_likeCount', style: TextStyle(fontSize: 18)), // 좋아요 수 표시
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {
                  },
                ),
                Text('14', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 5,
              color: Colors.grey.withOpacity(0.2),
              endIndent: 0,
              indent: 0,
            ),SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.account_circle, size: 33),
                SizedBox(width: 8),
                Text('인생최고의취미',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (showReportButton1)
                  PopupMenuButton<String>(
                    icon: Container(
                      padding: EdgeInsets.all(8.0), // 테두리와 텍스트 간의 여백
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // 테두리 색상
                          width: 1.2,          // 테두리 두께
                        ),
                        borderRadius: BorderRadius.circular(5.0), // 테두리 둥글게 처리
                      ),
                      child: Row(
                        children: [
                          Text(
                            '신고하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.chevron_right,size: 16,),
                        ],
                      ),
                    ),
                    onSelected: (String result) {
                      setState(() {
                        // 선택된 항목에 대한 동작 정의
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // 모서리 둥글기
                      side: BorderSide(
                        color: Colors.black, // 테두리 색상
                        width: 2.0, // 테두리 두께
                      ),
                    ),
                    color: Colors.white, // 배경색 흰색
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: '상업적 광고 및 판매',
                        child: Text('상업적 광고 및 판매',
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,)),
                      ),
                      PopupMenuItem<String>(
                        value: '유출/사칭/사기',
                        child: Text('유출/사칭/사기',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                      ),
                      PopupMenuItem<String>(
                        value: '음란물',
                        child: Text('음란물',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                      ),
                      PopupMenuItem<String>(
                        value: '욕설/비하',
                        child: Text('욕설/비하', style: TextStyle(color: Colors.black,
                          fontSize: 16,)),
                      ),
                    ],
                  ),

                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    setState(() {
                      showReportButton1 = !showReportButton1;  // 버튼을 토글
                    });
                  },
                ),
              ],
            ),
            Text('24년 07월 07일 20 :32',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text('들켰다 모르는척 좀 해줘~',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.thumb_up_alt_outlined),
                  onPressed:(){}, // 좋아요 버튼 클릭 시 호출
                ),
                Text('2', style: TextStyle(fontSize: 15)), // 좋아요 수 표시
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {
                  },
                ),
                Text('1', style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // 왼쪽에만 20.0 패딩 적용
              child:  Row(
                children: [
                  Icon(Icons.account_circle, size: 33),
                  SizedBox(width: 8),
                  Text('탈뮤그거어떻게하는건데',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (showReportButton2)
                    PopupMenuButton<String>(
                      icon: Container(
                        padding: EdgeInsets.all(8.0), // 테두리와 텍스트 간의 여백
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // 테두리 색상
                            width: 1.2,          // 테두리 두께
                          ),
                          borderRadius: BorderRadius.circular(5.0), // 테두리 둥글게 처리
                        ),
                        child: Row(
                          children: [
                            Text(
                              '신고하기',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Icon(Icons.chevron_right,size: 16,),
                          ],
                        ),
                      ),
                      onSelected: (String result) {
                        setState(() {
                          // 선택된 항목에 대한 동작 정의
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)), // 모서리 둥글기
                        side: BorderSide(
                          color: Colors.black, // 테두리 색상
                          width: 2.0, // 테두리 두께
                        ),
                      ),
                      color: Colors.white, // 배경색 흰색
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: '상업적 광고 및 판매',
                          child: Text('상업적 광고 및 판매',
                              style: TextStyle(color: Colors.black,
                                fontSize: 16,)),
                        ),
                        PopupMenuItem<String>(
                          value: '유출/사칭/사기',
                          child: Text('유출/사칭/사기',
                              style: TextStyle(color: Colors.black,fontSize: 16,)),
                        ),
                        PopupMenuItem<String>(
                          value: '음란물',
                          child: Text('음란물',
                              style: TextStyle(color: Colors.black,fontSize: 16,)),
                        ),
                        PopupMenuItem<String>(
                          value: '욕설/비하',
                          child: Text('욕설/비하', style: TextStyle(color: Colors.black,
                            fontSize: 16,)),
                        ),
                      ],
                    ),

                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        showReportButton2 = !showReportButton2;  // 버튼을 토글
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // 왼쪽에만 20.0 패딩 적용
              child: Text(
                '24년 07월 07일 20 : 35',
                style: TextStyle(
                  fontSize: 10,
                    color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // 왼쪽에만 20.0 패딩 적용
              child: Text(
                '아ㅠㅋㅋㅋ 노력 해볼게~~',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.thumb_up_alt_outlined),
                  onPressed:(){}, // 좋아요 버튼 클릭 시 호출
                ),
                Text('0', style: TextStyle(fontSize: 15)), // 좋아요 수 표시
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {
                  },
                ),
                Text('0', style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 16),
            Divider(
              thickness: 3,
              color: Colors.grey.withOpacity(0.2),
              endIndent: 0,
              indent: 0,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.account_circle, size: 33),
                SizedBox(width: 8),
                Text('꿈은없고요그냥뮤덕하고싶습니다',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (showReportButton3)
                  PopupMenuButton<String>(
                    icon: Container(
                      padding: EdgeInsets.all(8.0), // 테두리와 텍스트 간의 여백
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // 테두리 색상
                          width: 1.2,          // 테두리 두께
                        ),
                        borderRadius: BorderRadius.circular(5.0), // 테두리 둥글게 처리
                      ),
                      child: Row(
                        children: [
                          Text(
                            '신고하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          Icon(Icons.chevron_right,size: 16,),
                        ],
                      ),
                    ),
                    onSelected: (String result) {
                      setState(() {
                        // 선택된 항목에 대한 동작 정의
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)), // 모서리 둥글기
                      side: BorderSide(
                        color: Colors.black, // 테두리 색상
                        width: 2.0, // 테두리 두께
                      ),
                    ),
                    color: Colors.white, // 배경색 흰색
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: '상업적 광고 및 판매',
                        child: Text('상업적 광고 및 판매',
                            style: TextStyle(color: Colors.black,
                              fontSize: 16,)),
                      ),
                      PopupMenuItem<String>(
                        value: '유출/사칭/사기',
                        child: Text('유출/사칭/사기',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                      ),
                      PopupMenuItem<String>(
                        value: '음란물',
                        child: Text('음란물',
                            style: TextStyle(color: Colors.black,fontSize: 16,)),
                      ),
                      PopupMenuItem<String>(
                        value: '욕설/비하',
                        child: Text('욕설/비하', style: TextStyle(color: Colors.black,
                          fontSize: 16,)),
                      ),
                    ],
                  ),

                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    setState(() {
                      showReportButton3 = !showReportButton3;  // 버튼을 토글
                    });
                  },
                ),
              ],
            ),
            Text('24년 07월 07일 20 :43',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Text('들켰다 모르는척 좀 해줘~',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.thumb_up_alt_outlined),
                  onPressed:(){}, // 좋아요 버튼 클릭 시 호출
                ),
                Text('2', style: TextStyle(fontSize: 15)), // 좋아요 수 표시
                IconButton(
                  iconSize: 20,
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {
                  },
                ),
                Text('0', style: TextStyle(fontSize: 15)),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게 설정
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게 설정
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 1.0), // 비활성화 상태의 테두리
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게 설정
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0), // 활성화 상태의 테두리
                  ),
                  filled: true,
                  // 배경색 설정
                  fillColor: Colors.grey[200],
                  // 레이블 텍스트
                  labelText: '댓글을 입력하세요.',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}


class DetailScreen2 extends StatefulWidget {
  final String title;
  final String contents;
  final String name;

  DetailScreen2({required this.title, required this.contents, required this.name});

  @override
  _DetailScreen2State createState() => _DetailScreen2State();
}

class _DetailScreen2State extends State<DetailScreen2> {
  int _likeCount = 0; // 초기 좋아요 수

  void _incrementLike() {
    setState(() {
      _likeCount++; // 좋아요 수 증가
    });
  }
  bool showReportButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '게시물',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          if (showReportButton)
            PopupMenuButton<String>(
              icon: Container(
                padding: EdgeInsets.all(8.0), // 테두리와 텍스트 간의 여백
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // 테두리 색상
                    width: 1.2,          // 테두리 두께
                  ),
                  borderRadius: BorderRadius.circular(5.0), // 테두리 둥글게 처리
                ),
                child: Row(
                  children: [
                    Text(
                      '신고하기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.chevron_right,size: 16,),
                  ],
                ),
              ),
              onSelected: (String result) {
                setState(() {
                  // 선택된 항목에 대한 동작 정의
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)), // 모서리 둥글기
                side: BorderSide(
                  color: Colors.black, // 테두리 색상
                  width: 2.0, // 테두리 두께
                ),
              ),
              color: Colors.white, // 배경색 흰색
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: '상업적 광고 및 판매',
                  child: Text('상업적 광고 및 판매',
                      style: TextStyle(color: Colors.black,
                        fontSize: 16,)),
                ),
                PopupMenuItem<String>(
                  value: '유출/사칭/사기',
                  child: Text('유출/사칭/사기',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                ),
                PopupMenuItem<String>(
                  value: '음란물',
                  child: Text('음란물',
                      style: TextStyle(color: Colors.black,fontSize: 16,)),
                ),
                PopupMenuItem<String>(
                  value: '욕설/비하',
                  child: Text('욕설/비하', style: TextStyle(color: Colors.black,
                    fontSize: 16,)),
                ),
              ],
            ),

          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              setState(() {
                showReportButton = !showReportButton;  // 버튼을 토글
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, size: 28),
                SizedBox(width: 8),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.contents,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.thumb_up_alt_outlined),
                  onPressed: _incrementLike, // 좋아요 버튼 클릭 시 호출
                ),
                Text('$_likeCount', style: TextStyle(fontSize: 18)), // 좋아요 수 표시
                IconButton(
                  iconSize: 25,
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {
                  },
                ),
                Text('0', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 5,
              color: Colors.grey.withOpacity(0.2),
              endIndent: 0,
              indent: 0,
            ),
            SizedBox(height: 16),
            Positioned(
              top : 0,
              bottom: 0, // Position the TextField at the bottom
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게 설정
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게 설정
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 1.0), // 비활성화 상태의 테두리
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // 모서리 둥글게 설정
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0), // 활성화 상태의 테두리
                    ),
                    filled: true,
                    // 배경색 설정
                    fillColor: Colors.grey[200],
                    // 레이블 텍스트
                    labelText: '댓글을 입력하세요.',
                  ),
                ),
              ),
            ),
      ],
        ),
      ),
    );
  }
}

