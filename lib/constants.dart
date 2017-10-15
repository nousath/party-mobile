import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Constants {

  static final Color colorPrimary = const Color(0xFF242424);
  static final Color colorPrimaryDark = const Color(0xFF0A0A0A);
  static final Color colorAccent = const Color(0xFF00B957);
  static final Color colorAccentHighlight = const Color(0xFF00D764);
  static final Color colorAccentLight = const Color(0xFFFCFCFC);

  static final Color colorAccentControlHighlight = const Color(0xFF292929);

  static final Color colorAccentLightControl = const Color(0xFFA0A0A0);
  static final Color colorAccentLightControlHighlight = const Color(0xFF797979);

  static final Color statusBarColor = colorPrimary;

  static final Typography typography = new Typography(platform: TargetPlatform.android);

  static final loadingColorAnimation =
    const AlwaysStoppedAnimation<Color>(const Color(0xFF00B957));
  static final Widget loading = new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      new CircularProgressIndicator(
        valueColor: loadingColorAnimation,
      ),
    ],
  );

  static final Widget footer = new Padding(
      padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Padding(
              padding: new EdgeInsets.only(right: 10.0),
              child: new Text("Powered by"),
            ),
            new Image.asset(
              "images/spotify_logo_white.png",
              height: 37.0,
            ),
          ]
      )
  );

  // Interop
  static const String spotifyChannel = "com.chancesnow.party/spotify";
  static const String spotifyMessageChannel =
      "com.chancesnow.party/spotify/messages";
}
