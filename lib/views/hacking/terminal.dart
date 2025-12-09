import 'package:ctoshackcity/utils/replay_sound.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:ctoshackcity/theme/colors.dart';

class Terminal extends StatelessWidget{

  void openLink(String link)async{
    replay_sound();
    final projectUrl = link;
    final ghWebUri = Uri.parse(projectUrl);
    await launchUrl(ghWebUri,
        mode: LaunchMode.externalApplication);
  }

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/backgrounds/terminal.png', scale: 0.4),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton.extended(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: ColorsPalette[4],
                            onPressed: () => openLink('https://termux.dev/en/'),
                            label: Text('TERMUX',
                                style: TextStyle(
                                    fontFamily: 'OCR',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 25,
                                    color: Colors.white)),
                            icon: Icon(Icons.terminal, color: Colors.white)),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                      width: double.infinity,
                      child: FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: ColorsPalette[4],
                        onPressed: () => openLink('https://www.kali.org/'),
                        label: Text('KALI LINUX',
                            style: TextStyle(
                                fontFamily: 'OCR',
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                                color: Colors.white)),
                        icon: FaIcon(FontAwesomeIcons.linux,
                            color: Colors.white, size: 35),),
                    ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton.extended(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: ColorsPalette[4],
                          onPressed: () => openLink('https://tryhackme.com/'),
                          label: Text('TRYHACKME',
                              style: TextStyle(
                                  fontFamily: 'OCR',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: Colors.white)),
                          icon: FaIcon(FontAwesomeIcons.brain,
                              color: Colors.white, size: 35),),
                      ),
                      SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton.extended(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: ColorsPalette[4],
                          onPressed: () => openLink('https://owasp.org/'),
                          label: Text('OWASP',
                              style: TextStyle(
                                  fontFamily: 'OCR',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  color: Colors.white)),
                          icon: FaIcon(FontAwesomeIcons.shieldHalved,
                              color: Colors.white, size: 35),),
                      )
                      ],
                  )
                ])
        )
    );
  }
}