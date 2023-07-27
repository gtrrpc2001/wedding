import 'dart:async';

import 'package:flutter/material.dart';

import 'package:wedding_invitation_flutter/model/image.dart';
import 'package:wedding_invitation_flutter/widgets/image_card.dart';
import 'package:wedding_invitation_flutter/widgets/page_transformer.dart';

class Gallery extends StatefulWidget {
  Gallery({Key? key}): super(key:key);

  @override
  _Gallery createState() => _Gallery();
}

class _Gallery extends State<Gallery>{

  int? moveIndex = -1;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        if (7 > moveIndex!) {
          int index = moveIndex!;
          moveIndex = index + 1  ;
        } else {
          moveIndex = -1;
        }
      });

    });
    super.initState();
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Image.asset(
        'assets/images/flower.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitleText() {
    return Container(
      child: Text(
        'Photo Gallery',
        style: TextStyle(
          color: const Color.fromRGBO(41, 82, 56, 100),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildImage(context),
        _buildTitleText(),
        SizedBox(height: 50.0),
        SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: imageItems.length,
                itemBuilder: (context, index) {
                  int idx;
                  if(moveIndex! < index){
                    idx = index;
                  }else{
                    idx = moveIndex!;
                  }
                  print(idx);
                  final item = imageItems[idx];
                  final pageVisibility =
                  visibilityResolver.resolvePageVisibility(idx);

                  return ImageCardItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

}