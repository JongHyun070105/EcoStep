import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인 화면'),
        centerTitle: true,  // 제목을 중앙에 배치
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  // 세로로 중앙 정렬
          crossAxisAlignment: CrossAxisAlignment.center,  // 가로로 중앙 정렬
          children: [
            Text(
              'Flutter로 만든 간단한 메인 화면',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),  // 텍스트와 버튼 사이의 간격
            ElevatedButton(
              onPressed: () {
                // 버튼 클릭 시 동작할 내용
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('버튼 1이 클릭되었습니다!')),
                );
              },
              child: Text('버튼 1'),
            ),
            SizedBox(height: 20),  // 버튼 간격
            ElevatedButton(
              onPressed: () {
                // 버튼 클릭 시 동작할 내용
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('버튼 2가 클릭되었습니다!')),
                );
              },
              child: Text('버튼 2'),
            ),
          ],
        ),
      ),
    );
  }
}
