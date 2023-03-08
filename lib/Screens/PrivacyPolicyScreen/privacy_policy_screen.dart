import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/text_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: const Color(0xffF0F0F0),
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          "images/eu-project.svg",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
          child: Column(
            children: [
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "images/back.svg",
                      height: size.height*0.05,
                    ),
                  ),
                  TextWidget(
                    text: "Privacy Policy",
                    fontsize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  Text(""),

                ],
              ),
              SizedBox(height: size.height*0.02,),
              Flexible(
                child: TextWidget(
                  text: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, "
                      "sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo",
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
