import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:wedding_invitation_flutter/model/editdate.dart';

class Welcome extends StatelessWidget {
  Widget _buildTitleText() {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(color: Color(0xFFFFFFFF).withOpacity(0.75)),
          child: const AutoSizeText(
            '함께하는 첫 시작\n\n이충헌\n&\n이알레이나',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitleText(BuildContext context) {
    final dday = DateTime(2021, 6, 19);
    final today = DateTime.now();
    final difference = dday.difference(today).inDays;

    var ddayText = difference > 0 ? '그 날까지 D-$difference' : '';

    return Column(
      children: [
        Text(
          datesList[0].date,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        AutoSizeText(
          ddayText,
          style: TextStyle(fontSize: 15, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        
      ],
    );
  }

  Widget _buildBorder(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.all(20.0),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Image.asset(
                      'assets/images/water.jpg',
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 40),
                  _buildSubtitleText(context),
                ],
              ),
            ),
            _buildTitleText(),
            _buildBorder(context)
          ],
        ));
  }
}
