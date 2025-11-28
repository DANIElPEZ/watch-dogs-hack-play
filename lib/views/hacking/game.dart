import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ctoshackcity/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ctoshackcity/utils/ad_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ctoshackcity/blocs/products/products_state.dart';
import 'package:ctoshackcity/blocs/products/products_event.dart';
import 'package:ctoshackcity/blocs/products/products_bloc.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => stateHackphone();
}

class stateHackphone extends State<Game> {
  final ad_helper = adUtils();

  @override
  void initState() {
    super.initState();
    ad_helper.loadRewardedAd(onReady: () {
      if (ad_helper.isAdLoaded && !ad_helper.initialAdShown) {
        ad_helper.showRewardedAd(context);
      }
    });
    context.read<PurchaseBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/game/aiden/aiden.png', scale: 0.4),
                    Text('DEMO GAME COMMING SOON',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OCR',
                            fontWeight: FontWeight.w900,
                            fontSize: 35)),
                    FloatingActionButton.extended(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: ColorsPalette[4],
                        onPressed: () async {
                          const projectUrl =
                              'https://github.com/DANIElPEZ/watch-dogs-hack-play';
                          final ghWebUri = Uri.parse(projectUrl);
                          await launchUrl(ghWebUri,
                              mode: LaunchMode.externalApplication);
                        },
                        label: Text('FULL PROJECT ON',
                            style: TextStyle(
                                fontFamily: 'OCR',
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                                color: Colors.white)),
                        icon: FaIcon(FontAwesomeIcons.github,
                            color: Colors.white, size: 35)),
                    BlocBuilder<PurchaseBloc, PurchaseState>(
                        builder: (context, purchaseState) {
                      final products = purchaseState.products.productDetails;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 13),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorsPalette[4]),
                              child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Donation to our project',
                                        style: TextStyle(
                                            fontFamily: 'OCR',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: Colors.white)),
                                    Text(
                                      product.price,
                                      style: TextStyle(
                                          fontFamily: 'OCR',
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<PurchaseBloc>().add(
                                          MakeAndVerifyPurchase(
                                              product),
                                        );
                                      },
                                      child: Text(
                                        'Donate',
                                        style: TextStyle(
                                            fontFamily: 'OCR',
                                            fontWeight: FontWeight.w900,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                          backgroundColor: ColorsPalette[0]),
                                    )
                                  ]
                              )
                            );
                          });
                    })
                  ]))),
    );
  }
}
