import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlScreen extends StatefulWidget {
  const HtmlScreen({super.key});

  @override
  State<HtmlScreen> createState() => _HtmlScreenState();
}

class _HtmlScreenState extends State<HtmlScreen> {
  var data =
      "<p>Device Type:LED edgelight system</p><p>Energy Class:Class D</p><p>Power Consumption (On mode):12.2 W</p><p>Panel Type:IPS</p><p>Aspect Ratio:16:9</p><p>Native Resolution:1920 x 1080 at 75 Hz</p><p>Pixel Pitch:0.2745 x 0.2745 mm</p><p>Brightness:250 cd/m2 (typical)</p><p>Contrast Ratio:1000: 1 (Typical)</p><p>Response Time:4 ms gray to gray in Extreme mode</p><p>Color Support:16.7 Million colors</p><p>Color Gamut:72% NTSC (CIE 1931), 99% sRGB</p><p>Input Connectors:1 x Audio line-out port</p><p>Display Position Adjustments: Tilt (-5° to 21°)</p><p>Screen Coating : Antiglare with 3H hardness</p><p>Voltage:AC 100/240 V (50/60 Hz)</p><p>Dimensions (WxDxH) - with stand: 21.17 inches x 6.02 inches x 16.25 inches</p><p>Compliant Standards:ENERGY STAR certified monitor</p><p>Weight:7.28 lb</p><p><br>&nbsp;</p>,";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Html Screen'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Html(
              data: data,
              style: {
                "body": Style(
                    fontSize: const FontSize(15),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.justify,
                    color: Colors.black)
              },
            ),
          )
        ],
      ),
    );
  }
}
