import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vpn_app/Views/customWidget/dilog.dart';

class AdHelper {
  static Future<void> initAds() async {
    await MobileAds.instance.initialize();
  }

  static void showRewardedAd({required VoidCallback onComplete}) {
    MyDialogs.showProgress();
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          Get.back();
          ad.show(
              onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
            onComplete();
          });
        },
        onAdFailedToLoad: (error) {
          Get.back();
          log('Failed to load an interstitial ad: ${error.message}');
          onComplete();
        },
      ),
    );
  }

  /// Loads a native ad.
  // static NativeAd loadNativeAd({required NativeAdController adcontroller}) {
  //   return NativeAd(
  //       adUnitId: 'ca-app-pub-3940256099942544/2247696110',
  //       listener: NativeAdListener(
  //         onAdLoaded: (ad) {
  //           log('$NativeAd loaded.');
  //           adcontroller.adload.value =true;
  //         },
  //         onAdFailedToLoad: (ad, error) {
  //           // Dispose the ad here to free resources.
  //           log('$NativeAd failed to load: $error');
  //           ad.dispose();
  //         },
  //       ),
  //       request: const AdRequest(),
  //       // Styling
  //       nativeTemplateStyle: NativeTemplateStyle(
  //         // Required: Choose a template.
  //           templateType: TemplateType.small,
  //           // Optional: Customize the ad's style.
  //           // mainBackgroundColor: Colors.purple,
  //           // cornerRadius: 10.0,
  //           // callToActionTextStyle: NativeTemplateTextStyle(
  //           //     textColor: Colors.cyan,
  //           //     backgroundColor: Colors.red,
  //           //     style: NativeTemplateFontStyle.monospace,
  //           //     size: 16.0),
  //           // primaryTextStyle: NativeTemplateTextStyle(
  //           //     textColor: Colors.red,
  //           //     backgroundColor: Colors.cyan,
  //           //     style: NativeTemplateFontStyle.italic,
  //           //     size: 16.0),
  //           // secondaryTextStyle: NativeTemplateTextStyle(
  //           //     textColor: Colors.green,
  //           //     backgroundColor: Colors.black,
  //           //     style: NativeTemplateFontStyle.bold,
  //           //     size: 16.0),
  //           // tertiaryTextStyle: NativeTemplateTextStyle(
  //           //     textColor: Colors.brown,
  //           //     backgroundColor: Colors.amber,
  //           //     style: NativeTemplateFontStyle.normal,
  //           //     size: 16.0,
  //           // ),
  //       ),
  //   )
  //     ..load();
  // }
}
