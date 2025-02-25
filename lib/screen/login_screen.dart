import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    _signOut();  // 로그인 화면에 진입할 때마다 로그아웃 처리
  }

  // Google 로그인 처리 함수
  Future<void> _signInWithGoogle() async {
    try {
      // 구글 로그인
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // 사용자가 로그인 취소 시
        return;
      }

      // Google 인증을 통해 Firebase 인증
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase로 로그인
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      // 로그인 성공 후, 홈 화면으로 이동
      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),  // MainScreen으로 이동
        );
      }
    } catch (e) {
      // 예외 처리: 로그인 실패 시 에러 출력
      print('구글 로그인 실패: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('구글 로그인에 실패했습니다.')),
      );
    }
  }

  // 로그아웃 함수
  Future<void> _signOut() async {
    await _googleSignIn.signOut();  // 구글 로그아웃
    await _auth.signOut();  // Firebase 로그아웃
    print("구글과 Firebase 로그아웃 완료");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Google 로그인")),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,  // 구글 로그인 함수 호출
          child: Text("구글로 로그인"),
        ),
      ),
    );
  }
}
