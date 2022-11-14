import 'package:flutter/material.dart';

class LAFSpaces {
  static const double space2 = 2.0;
  static const double space4 = 4.0;
  static const double space5 = 5.0;
  static const double space6 = 6.0;
  static const double space8 = 8.0;
  static const double space10 = 10.0;
  static const double space12 = 12.0;
  static const double space16 = 16.0;
  static const double space24 = 24.0;
  static const double space30 = 30.0;
  static const double space40 = 40.0;
  static const double space50 = 50.0;
  static const double space60 = 60.0;
  static const double space70 = 70.0;
  static const double space80 = 80.0;

  LAFSpaces._();
}

extension MarginExtensions on double {
  Widget toSpace({bool horizontally = true, bool vertically = true}) {
    assert(horizontally != false || vertically != false);
    return SizedBox(
      width: horizontally ? this : 0,
      height: vertically ? this : 0,
    );
  }
}

class LAFSizes {
  static const double size2 = 2.0;
  static const double size4 = 4.0;
  static const double size6 = 6.0;
  static const double size8 = 8.0;
  static const double size12 = 12.0;
  static const double size16 = 16.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size50 = 50.0;
  static const double size60 = 60.0;
  static const double size70 = 70.0;
  static const double size30 = 30.0;
  static const double size35 = 35.0;
  static const double size40 = 40.0;
  static const double size45 = 45.0;
  static const double size80 = 80.0;
  LAFSizes._();
}

class LAFMargins {
  static const double margins2 = 2.0;
  static const double margins4 = 4.0;
  static const double margins6 = 6.0;
  static const double margins8 = 8.0;
  static const double margins12 = 12.0;
  static const double margins16 = 16.0;
  static const double margins24 = 24.0;
  static const double margins70 = 70.0;
  static const double margins60 = 60.0;
  static const double margins30 = 30.0;
  LAFMargins._();
}

class LAFPaddings {
  static const double paddings2 = 2.0;
  static const double paddings4 = 4.0;
  static const double paddings6 = 6.0;
  static const double paddings8 = 8.0;
  static const double paddings10 = 10.0;
  static const double paddings12 = 12.0;
  static const double paddings16 = 16.0;
  static const double paddings20 = 20.0;
  static const double paddings24 = 24.0;
  static const double paddings28 = 28.0;
  static const double paddings30 = 30.0;
  LAFPaddings._();
}

class LAFTextSizes {
  static const double textSizes9 = 8.0;
  static const double textSizes10 = 10.0;
  static const double textSizes12 = 12.0;
  static const double textSizes14 = 14.0;
  static const double textSizes16 = 16.0;
  static const double textSizes18 = 18.0;
  static const double textSizes20 = 20.0;
  static const double textSizes24 = 24.0;
  LAFTextSizes._();
}
