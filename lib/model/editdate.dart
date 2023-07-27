class dateList {
  dateList({required this.date});

  final String date;
}

final datesList = <dateList>[
  dateList(date: '2023.7.26 토요일 낮 12시 30분'),

  dateList(date: '2023년 7월 26일 화요일\n낮 12시 30분'),

];

final addrList = <dateList>[dateList(date: '서울 용산구 이태원로 29 뮤지엄웨딩홀, \n3층 무궁화홀')];