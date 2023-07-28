import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:auto_size_text/auto_size_text.dart';

class CongratulationGift extends StatelessWidget {
  
  void SetClipboard(BuildContext context, String accountNumber) {
    Clipboard.setData(ClipboardData(text: accountNumber)).then((value) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("계좌번호가 복사되었습니다"))));
  }

  Widget _buildButton(BuildContext context, String receiver, accountNumber) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            receiver,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(width: 20),
          TextButton(
              onPressed: () => SetClipboard(context, accountNumber),
              child: AutoSizeText(
                accountNumber,
                maxLines: 2,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.all(20.0),
        child: Column(
          children: [
            AutoSizeText('신랑 신부에게 마음 전하기',
                style: TextStyle(
                    color: const Color.fromRGBO(41, 82, 56, 100),
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(height: 50),
            _buildButton(context, '신랑 이충헌', '카카오뱅크 3333-24-8680799'),
            SizedBox(height: 20),
            _buildButton(context, '신부 이알레이나', '하나은행 702-910962-53707'),
          ],
        ));
  }
}
