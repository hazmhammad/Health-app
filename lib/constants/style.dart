import 'package:flutter/material.dart';

//Theme Colors = background colors, buttons etc.
const kDarkGrey = Color(0xFF4A4A4A);
const kBlackGrey = Color(0xFF2E2C38);
const kMidGray = Color(0xFF514D60);
const kLightGray = Color(0xFF52505A);
const kGrayDisBtnB = Color(0xFFbdbdbd);
const kGrayDisBtnT = Color(0xFF828282);
const kDarkBlue = Color(0xFF01579B);
const kGrayishWhite = Color(0xFF9B9B9B);
const KMidBlue = Color(0xFF176A90);
const KFadedBlue = Color(0xFF4469AC);
const KAccentGreen = Color(0xFF1FE0CC);
const KWhiteSplash = Color(0x50FFFFFF);

//Colors that were used in BMI scale

const kBlue = Color(0xFF64B5F6);
const kGreen = Color(0xFF81C784);
const kYellow = Color(0xFFE7DA6A);
const kOrange = Color(0xFFFFB74D);
const kRed = Color(0xFFE57373);
const kGrey = Color(0xFF9A9B9B);

//Colors that were used in error messages and labels.

const kDangerRed = Color(0xFFFF0438);
const kWarningOrange = Color(0xFFF5A623);
const kFairBlue = Color(0xFF2A6EBB);
const kSafeGreen = Color(0xFF008200);

//Images paths

const iBgImage = 'assets/images/bg-image.png';
const iHeart = 'assets/images/heart.png';
const iLogo = 'assets/images/logo.png';
const iPhoneCharts = 'assets/images/heart.png';
const iPhoneMessage = 'assets/images/phone-message.png';
const iShoes = 'assets/images/shoes.png';
const iThumpUp = 'assets/images/thump-up.png';
const iUserStats = 'assets/images/user-stats.png';
const iWaterPhone = 'assets/images/water-phone.png';
const iWholeLogo = 'assets/images/whole-logo.png';
const iWhole = 'assets/images/whole.png';
const ifullLogo = 'assets/images/full-logo.png';
const iSamsungHealth = 'assets/images/samsunghealth.png';
const iFitBit = 'assets/images/fitbit.png';
const iAppleHealth = 'assets/images/applehealth.png';

//font styles and sizes (note: uses sizes are 25, 20, 16, 14 both bold and regular)

TextStyle boldTextStyle(double size, [Color color = Colors.white]) => TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: color,
    fontSize: size);

TextStyle regularTextStyle(double size, [Color color = Colors.white]) =>
    TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: size);

TextStyle underlineRegularTextStyle(double size,
        [Color color = Colors.white]) =>
    TextStyle(
        decoration: TextDecoration.underline,
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size);

TextStyle lineThroughRegularTextStyle(double size,
        [Color color = Colors.white]) =>
    TextStyle(
        decoration: TextDecoration.lineThrough,
        fontFamily: 'Roboto',
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size);
