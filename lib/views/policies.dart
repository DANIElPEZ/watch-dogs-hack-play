import 'package:flutter/material.dart';
import 'package:ctoshackcity/theme/colors.dart';

class Policies extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Container(
            color: ColorsPalette[2],
          )),
        body: Container(
          color: ColorsPalette[1],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Last updated: July 2025",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "CTOS Hack City is an independent fan-made application created solely for entertainment purposes. "
                      "It is not affiliated, associated, authorized, endorsed, or sponsored by Ubisoft or any entity "
                      "connected to the Watch Dogs franchise.",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "1. Information We Collect",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "CTOS Hack City does not collect, store, or share any personal information from users.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "- No personal identity information\n"
                      "- No device technical data\n"
                      "- No cookies or trackers\n"
                      "- No account registration required",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  "All content runs locally on the user’s device. No data is transmitted to remote servers.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "2. Device Permissions",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "This application does not request permissions to access the camera, microphone, contacts, "
                      "storage, location, or any other sensitive device resource.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "3. Content and Intellectual Property",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "CTOS Hack City contains visual and audio elements inspired by futuristic and "
                      "science-fiction themes strictly for recreational use.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "- No commercial exploitation of external brands\n"
                      "- Not intended to represent official existing products\n"
                      "- Content may be removed upon proper copyright request",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "4. Use of the Application",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "This application is for entertainment only. It must not be used as real hacking software "
                      "or for any illegal, malicious, or harmful purpose in the real world.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "5. Changes to This Policy",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "We may update this privacy policy occasionally. Any changes will be reflected "
                      "on this page with a new update date.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 25),
                Text(
                  "6. Contact",
                  style: TextStyle(
                    fontFamily: 'OCR',
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: ColorsPalette[0],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "For questions, concerns, or copyright-related requests, you may contact the developer "
                      "using the email provided on Google Play.",
                  style: TextStyle(fontFamily: 'OCR', fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 40)
              ],
            ),
          ),
        )
    );
  }
}