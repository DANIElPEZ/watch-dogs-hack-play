import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class adUtils{
  bool isAdLoaded=false;
  bool initialAdShown = false;
  RewardedAd? rewardedAd;

  Future<void> loadRewardedAd({required void Function() onReady}) async {
    await RewardedAd.load(
      adUnitId: 'ca-app-pub-6288821932043902/7893871266',
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, e) {
              ad.dispose();
            },
          );
          rewardedAd = ad;
          isAdLoaded = true;
          onReady();
        },
        onAdFailedToLoad: (e) {
          print('❌ Failed to load a rewarded ad: $e');
          isAdLoaded = false;
        },
      ),
    );
  }

  void showRewardedAd(BuildContext context) {
    if (isAdLoaded && rewardedAd != null) {
      rewardedAd?.show(onUserEarnedReward: (_, reward) {
        print(reward.amount);
      });
      isAdLoaded = false;
      initialAdShown = true;
    } else {
      print("⚠️");
    }
  }

  void dispose() {
    rewardedAd?.dispose();
  }
}