

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:umah_front/screens/landing%20screens/landing.dart';

import '../styles/colors.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    animationController?.addListener(() {
      setState(() {});
    });

    animationController?.repeat();
    Timer(
        Duration(seconds: 10),
            () {
          animationController?.stop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>Landing())
    );
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/background/png/loading_back.png",
                ),
                fit: BoxFit.fill)),
        child: Center(
          child: Container(
              alignment: Alignment.center,
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  SvgPicture.asset("assets/images/illustrations/sol_key_illustration.svg", height: 80, width: 80,),
                  LiquidCustomProgressIndicator(
                    direction: Axis.vertical,
                    shapePath: _getPath(Size(80, 80)),
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation( AppColors.UMAH_VIOLET),
                    value: animationController!.value,
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  Path _getPath(Size size){

    Path path_0 = Path();
    path_0.moveTo(size.width*0.9898018,size.height*0.3417229);
    path_0.cubicTo(size.width*0.9879163,size.height*0.2816727,size.width*0.9857753,size.height*0.2216445,size.width*0.9836520,size.height*0.1615943);
    path_0.cubicTo(size.width*0.9822775,size.height*0.1229357,size.width*0.9991101,size.height*0.03649048,size.width*0.9548062,size.height*0.01469123);
    path_0.cubicTo(size.width*0.9356167,size.height*0.005241322,size.width*0.9103612,size.height*0.004081573,size.width*0.8915903,size.height*0.004468150);
    path_0.cubicTo(size.width*0.8686300,size.height*0.004919163,size.width*0.8451233,size.height*0.004790308,size.width*0.8222863,size.height*0.007324626);
    path_0.cubicTo(size.width*0.8164141,size.height*0.007968943,size.width*0.8102247,size.height*0.01035286,size.width*0.8070441,size.height*0.01578656);
    path_0.cubicTo(size.width*0.8049031,size.height*0.01945916,size.width*0.8044317,size.height*0.02399084,size.width*0.8042159,size.height*0.02835066);
    path_0.cubicTo(size.width*0.8030793,size.height*0.05004273,size.width*0.8051806,size.height*0.07265771,size.width*0.8066520,size.height*0.09430661);
    path_0.cubicTo(size.width*0.8084978,size.height*0.1210242,size.width*0.8128194,size.height*0.1502115,size.width*0.8089515,size.height*0.1769507);
    path_0.cubicTo(size.width*0.8072599,size.height*0.1885269,size.width*0.7999383,size.height*0.2006612,size.width*0.7892335,size.height*0.2011551);
    path_0.cubicTo(size.width*0.7838722,size.height*0.2014128,size.width*0.7787269,size.height*0.1986423,size.width*0.7745639,size.height*0.1949485);
    path_0.cubicTo(size.width*0.7515286,size.height*0.1744806,size.width*0.7565947,size.height*0.1318916,size.width*0.7355022,size.height*0.1090617);
    path_0.cubicTo(size.width*0.7048678,size.height*0.07590088,size.width*0.6682996,size.height*0.1167502,size.width*0.6390969,size.height*0.1289278);
    path_0.cubicTo(size.width*0.6172775,size.height*0.1380339,size.width*0.5954802,size.height*0.1471617,size.width*0.5736432,size.height*0.1562035);
    path_0.cubicTo(size.width*0.5548106,size.height*0.1640216,size.width*0.5361718,size.height*0.1723115,size.width*0.5175727,size.height*0.1807736);
    path_0.cubicTo(size.width*0.5127841,size.height*0.1829643,size.width*0.5075198,size.height*0.1845322,size.width*0.5024141,size.height*0.1834797);
    path_0.cubicTo(size.width*0.4923568,size.height*0.1813965,size.width*0.4828546,size.height*0.1695194,size.width*0.4748018,size.height*0.1630335);
    path_0.cubicTo(size.width*0.4646476,size.height*0.1548938,size.width*0.4541806,size.height*0.1472048,size.width*0.4430441,size.height*0.1407617);
    path_0.cubicTo(size.width*0.4250965,size.height*0.1304313,size.width*0.4022374,size.height*0.1196714,size.width*0.3815383,size.height*0.1196714);
    path_0.cubicTo(size.width*0.3721317,size.height*0.1186189,size.width*0.3628427,size.height*0.1188551,size.width*0.3533965,size.height*0.1188551);
    path_0.cubicTo(size.width*0.3363308,size.height*0.1195639,size.width*0.3183026,size.height*0.1230648,size.width*0.3066176,size.height*0.1331374);
    path_0.cubicTo(size.width*0.2926352,size.height*0.1451643,size.width*0.2912211,size.height*0.1631194,size.width*0.2911031,size.height*0.1797639);
    path_0.cubicTo(size.width*0.2888841,size.height*0.2046344,size.width*0.3106828,size.height*0.3223502,size.width*0.3106436,size.height*0.3473066);
    path_0.cubicTo(size.width*0.3106044,size.height*0.3711247,size.width*0.3139035,size.height*0.3953079,size.width*0.3160639,size.height*0.4190401);
    path_0.cubicTo(size.width*0.3208555,size.height*0.4717225,size.width*0.3620573,size.height*0.8288238,size.width*0.2762370,size.height*0.8309912);
    path_0.cubicTo(size.width*0.2315396,size.height*0.8321322,size.width*0.1866264,size.height*0.8245903,size.width*0.1413207,size.height*0.8268678);
    path_0.cubicTo(size.width*0.1011797,size.height*0.8289075,size.width*0.01724471,size.height*0.8396256,size.width*0.005677665,size.height*0.8783921);
    path_0.cubicTo(size.width*-0.001824238,size.height*0.9035859,size.width*0.02533577,size.height*0.9455727,size.width*0.04811630,size.height*0.9617225);
    path_0.cubicTo(size.width*0.1251189,size.height*1.016273,size.width*0.2965432,size.height*0.9945595,size.width*0.3653564,size.height*0.9414493);
    path_0.cubicTo(size.width*0.3871943,size.height*0.9245903,size.width*0.3938515,size.height*0.9063568,size.width*0.3939696,size.height*0.8801982);
    path_0.cubicTo(size.width*0.3943035,size.height*0.8042335,size.width*0.3945000,size.height*0.7279648,size.width*0.3912004,size.height*0.6521322);
    path_0.cubicTo(size.width*0.3877441,size.height*0.5726432,size.width*0.3904150,size.height*0.4929648,size.width*0.3835612,size.height*0.4136282);
    path_0.cubicTo(size.width*0.3801247,size.height*0.3740026,size.width*0.3743313,size.height*0.3346352,size.width*0.3682432,size.height*0.2953106);
    path_0.cubicTo(size.width*0.3632352,size.height*0.2629661,size.width*0.3519238,size.height*0.2251454,size.width*0.3644727,size.height*0.1930154);
    path_0.cubicTo(size.width*0.3677128,size.height*0.1847251,size.width*0.3741938,size.height*0.1770581,size.width*0.3831489,size.height*0.1743304);
    path_0.cubicTo(size.width*0.3931643,size.height*0.1712806,size.width*0.4041815,size.height*0.1748674,size.width*0.4130388,size.height*0.1801938);
    path_0.cubicTo(size.width*0.4546740,size.height*0.2052361,size.width*0.4673965,size.height*0.2464718,size.width*0.5253304,size.height*0.2318890);
    path_0.cubicTo(size.width*0.5860352,size.height*0.2166189,size.width*0.6471674,size.height*0.1882692,size.width*0.7056300,size.height*0.1662119);
    path_0.cubicTo(size.width*0.7096564,size.height*0.1646872,size.width*0.7144097,size.height*0.1637850,size.width*0.7185154,size.height*0.1651811);
    path_0.cubicTo(size.width*0.7288062,size.height*0.1687035,size.width*0.7342863,size.height*0.1808595,size.width*0.7370925,size.height*0.1913833);
    path_0.cubicTo(size.width*0.7405903,size.height*0.2045273,size.width*0.7435330,size.height*0.2179502,size.width*0.7522555,size.height*0.2283665);
    path_0.cubicTo(size.width*0.7607974,size.height*0.2385899,size.width*0.7733833,size.height*0.2439374,size.width*0.7859736,size.height*0.2453123);
    path_0.cubicTo(size.width*0.8019383,size.height*0.2470520,size.width*0.8230132,size.height*0.2455053,size.width*0.8352643,size.height*0.2328982);
    path_0.cubicTo(size.width*0.8450441,size.height*0.2228471,size.width*0.8510352,size.height*0.2089084,size.width*0.8540617,size.height*0.1947767);
    path_0.cubicTo(size.width*0.8577533,size.height*0.1775088,size.width*0.8574361,size.height*0.1595758,size.width*0.8572599,size.height*0.1418573);
    path_0.cubicTo(size.width*0.8569471,size.height*0.1109084,size.width*0.8557885,size.height*0.05586300,size.width*0.8964009,size.height*0.05822511);
    path_0.cubicTo(size.width*0.9015639,size.height*0.05852599,size.width*0.9067709,size.height*0.06005066,size.width*0.9109912,size.height*0.06329383);
    path_0.cubicTo(size.width*0.9203612,size.height*0.07051013,size.width*0.9196740,size.height*0.08311718,size.width*0.9179031,size.height*0.09413480);
    path_0.cubicTo(size.width*0.9047269,size.height*0.1761344,size.width*0.9223612,size.height*0.2580696,size.width*0.9272731,size.height*0.3398974);
    path_0.cubicTo(size.width*0.9289207,size.height*0.3673449,size.width*0.9291762,size.height*0.3948141,size.width*0.9314537,size.height*0.4222189);
    path_0.cubicTo(size.width*0.9331630,size.height*0.4428811,size.width*0.9347930,size.height*0.4635419,size.width*0.9355991,size.height*0.4842643);
    path_0.cubicTo(size.width*0.9371718,size.height*0.5249427,size.width*0.9385463,size.height*0.5729648,size.width*0.9205374,size.height*0.6100132);
    path_0.cubicTo(size.width*0.9117401,size.height*0.6281189,size.width*0.8969515,size.height*0.6403172,size.width*0.8778018,size.height*0.6407930);
    path_0.cubicTo(size.width*0.8331057,size.height*0.6419295,size.width*0.7881718,size.height*0.6343700,size.width*0.7428678,size.height*0.6366696);
    path_0.cubicTo(size.width*0.7027269,size.height*0.6387093,size.width*0.6188106,size.height*0.6494053,size.width*0.6072423,size.height*0.6881894);
    path_0.cubicTo(size.width*0.5997225,size.height*0.7133612,size.width*0.6268811,size.height*0.7553700,size.width*0.6496608,size.height*0.7715022);
    path_0.cubicTo(size.width*0.7266652,size.height*0.8260749,size.width*0.8980881,size.height*0.8043612,size.width*0.9669031,size.height*0.7512467);
    path_0.cubicTo(size.width*0.9887401,size.height*0.7343877,size.width*0.9954185,size.height*0.7161542,size.width*0.9955374,size.height*0.6899736);
    path_0.cubicTo(size.width*0.9960264,size.height*0.5738678,size.width*0.9934141,size.height*0.4577841,size.width*0.9898018,size.height*0.3417229);
    path_0.close();

    Path path_1 = Path();
    path_1.moveTo(size.width*0.5972070,size.height*0.3014749);
    path_1.cubicTo(size.width*0.5971674,size.height*0.3098295,size.width*0.5888414,size.height*0.3306189,size.width*0.5783568,size.height*0.3304260);
    path_1.cubicTo(size.width*0.5754890,size.height*0.3303612,size.width*0.5728194,size.height*0.3290511,size.width*0.5702467,size.height*0.3277626);
    path_1.cubicTo(size.width*0.5557313,size.height*0.3205035,size.width*0.5502731,size.height*0.3112683,size.width*0.5545727,size.height*0.2953322);
    path_1.cubicTo(size.width*0.5561630,size.height*0.2894048,size.width*0.5634317,size.height*0.2712564,size.width*0.5720925,size.height*0.2736405);
    path_1.cubicTo(size.width*0.5734670,size.height*0.2740269,size.width*0.5746256,size.height*0.2749291,size.width*0.5757445,size.height*0.2758313);
    path_1.cubicTo(size.width*0.5845022,size.height*0.2828542,size.width*0.5972863,size.height*0.2887604,size.width*0.5972070,size.height*0.3014749);
    path_1.close();

    Path path_2 = Path();
    path_2.moveTo(size.width*0.5215815,size.height*0.3788996);
    path_2.cubicTo(size.width*0.5215198,size.height*0.3872758,size.width*0.5132159,size.height*0.4080656,size.width*0.5027269,size.height*0.4078507);
    path_2.cubicTo(size.width*0.4998414,size.height*0.4078079,size.width*0.4971718,size.height*0.4064978,size.width*0.4945991,size.height*0.4052088);
    path_2.cubicTo(size.width*0.4800837,size.height*0.3979498,size.width*0.4746256,size.height*0.3886930,size.width*0.4789251,size.height*0.3727573);
    path_2.cubicTo(size.width*0.4805154,size.height*0.3668295,size.width*0.4878018,size.height*0.3487026,size.width*0.4964449,size.height*0.3510868);
    path_2.cubicTo(size.width*0.4978194,size.height*0.3514520,size.width*0.4989780,size.height*0.3523753,size.width*0.5000969,size.height*0.3532775);
    path_2.cubicTo(size.width*0.5088546,size.height*0.3602789,size.width*0.5216608,size.height*0.3662066,size.width*0.5215815,size.height*0.3788996);
    path_2.close();


    Path path_3 = Path();
    path_3.moveTo(size.width*0.6013304,size.height*0.3788996);
    path_3.cubicTo(size.width*0.6012731,size.height*0.3872758,size.width*0.5929648,size.height*0.4080656,size.width*0.5824802,size.height*0.4078507);
    path_3.cubicTo(size.width*0.5796123,size.height*0.4078079,size.width*0.5769207,size.height*0.4064978,size.width*0.5743480,size.height*0.4052088);
    path_3.cubicTo(size.width*0.5598370,size.height*0.3979498,size.width*0.5543789,size.height*0.3886930,size.width*0.5586784,size.height*0.3727573);
    path_3.cubicTo(size.width*0.5602687,size.height*0.3668295,size.width*0.5675551,size.height*0.3487026,size.width*0.5761938,size.height*0.3510868);
    path_3.cubicTo(size.width*0.5775683,size.height*0.3514520,size.width*0.5787269,size.height*0.3523753,size.width*0.5798458,size.height*0.3532775);
    path_3.cubicTo(size.width*0.5886079,size.height*0.3602789,size.width*0.6014097,size.height*0.3662066,size.width*0.6013304,size.height*0.3788996);
    path_3.close();


    Path path_4 = Path();
    path_4.moveTo(size.width*0.5215815,size.height*0.3014749);
    path_4.cubicTo(size.width*0.5215198,size.height*0.3098295,size.width*0.5132159,size.height*0.3306189,size.width*0.5027269,size.height*0.3304260);
    path_4.cubicTo(size.width*0.4998414,size.height*0.3303612,size.width*0.4971718,size.height*0.3290511,size.width*0.4945991,size.height*0.3277626);
    path_4.cubicTo(size.width*0.4800837,size.height*0.3205035,size.width*0.4746256,size.height*0.3112683,size.width*0.4789251,size.height*0.2953322);
    path_4.cubicTo(size.width*0.4805154,size.height*0.2894048,size.width*0.4878018,size.height*0.2712564,size.width*0.4964449,size.height*0.2736405);
    path_4.cubicTo(size.width*0.4978194,size.height*0.2740269,size.width*0.4989780,size.height*0.2749291,size.width*0.5000969,size.height*0.2758313);
    path_4.cubicTo(size.width*0.5088546,size.height*0.2828542,size.width*0.5216608,size.height*0.2887604,size.width*0.5215815,size.height*0.3014749);
    path_4.close();

    List<Path> paths=[path_0,path_1,path_2,path_3,path_4];

    Path combinedPath= Path();

    paths.forEach((element) {
      combinedPath.addPath(element, Offset.zero);
    });

    return combinedPath;


  }
}

