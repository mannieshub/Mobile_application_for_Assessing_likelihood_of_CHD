import 'package:flutter/material.dart';

//firebase authentication
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mobile_app/authentication/auth.dart';
import 'package:mobile_app/routes/before_assessment_page.dart';

//routes
import '/routes/assessment_demo.dart';
import '/routes/before_chatbot_page.dart';

//UI
import 'package:mobile_app/ui/authenpage/homepage_ui.dart';
import 'package:mobile_app/ui/homepage/user_info_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    //Navigator.pushReplacement(context, LoginPage());
  }

  Widget _title() {
    return const Text(
      'Mobile Assessing for likelihood of CHD',
      style: TextStyle(
        color: Colors.white, // กำหนดสีของ Text เป็นสีขาว
      ),
    );
  }

  Widget _userUid() {
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFCC4F4F), // กำหนดสีพื้นหลังเป็นสีแดง
      ),
      child: Text(
        'Sign Out',
        style: TextStyle(color: Colors.white), // กำหนดสีของ Text เป็นสีขาว
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Display AppName with green background
        appBar: AppBar(
          title: _title(),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF4FCCBD),
        ),

        //Display Content
        body: Container(
          color: Color(0xFFD5B79F),
          child: Container(
            color: Color(0xFFD5B79F),
            margin: EdgeInsetsDirectional.fromSTEB(10, 30, 10, 30),
            child: Column(
              children: <Widget>[
                UserInfoCard(),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "* กรุณาเลือกเมนูที่คุณต้องการตรวจเกี่ยวกับโรคหลอดเลือดหัวใจ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Kanit',
                        ),
                      )
                    ],
                  ),
                ),
                //Button
                NextPageButton(
                  imgPath: 'images/icon.png',
                  message1: 'CHD 10 years risk score',
                  message2:
                      'ประเมินความเสี่ยงการเป็นโรคหลอดเลือดหัวใจภายใน 10 ปี',
                  destination:
                      beforeAs(), // Replace with your desired destination widget.
                ),

                NextPageButton(
                  imgPath: 'images/icon1.png',
                  message1: 'Q&A',
                  message2: 'สอบถามเกี่ยวกับโรคหลอดเลือดหัวใจ',
                  destination:
                      beforeChat(), // Replace with your desired destination widget.
                ),

                _userUid(),
                _signOutButton(),
              ],
            ),
          ),
        ));
  }
}