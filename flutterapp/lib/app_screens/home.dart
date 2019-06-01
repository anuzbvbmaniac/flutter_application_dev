import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            padding: EdgeInsets.all(24.0),
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                FontImageAsset(),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Quicksand - Regular",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Quicksand',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400),
                    )),
                    Expanded(
                        child: Text(
                      "Quicksand is a display sans serif with rounded terminals. The project was initiated by Andrew Paglinawan in 2008 using geometric shapes as a core foundation.",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Quicksand',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Quicksand - Medium",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Quicksand',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w500),
                    )),
                    Expanded(
                        child: Text(
                      "Quicksand is a display sans serif with rounded terminals. The project was initiated by Andrew Paglinawan in 2008 using geometric shapes as a core foundation.",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Quicksand',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Quicksand - Bold",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Quicksand',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700),
                    )),
                    Expanded(
                        child: Text(
                      "Quicksand is a display sans serif with rounded terminals. The project was initiated by Andrew Paglinawan in 2008 using geometric shapes as a core foundation.",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontFamily: 'Quicksand',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400),
                    ))
                  ],
                ),
                DownloadFont()
              ],
            )));
  }
}

class FontImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = new AssetImage('images/quicksand.png');
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 24.0, bottom: 16.0),
    );
  }
}

class DownloadFont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
          color: Color.fromRGBO(230, 225, 249, 1),
          child: Text(
            "DOWNLOAD",
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                fontSize: 16.0),
          ),
          elevation: 6.0,
          onPressed: () => downloadFont(context)),
    );
  }

  void downloadFont(BuildContext context) {
    var alertDialouge = AlertDialog(
      title: Text("Font Downloading..."),
      content: Text("Please feel free to rate our app."),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alertDialouge);
  }
}
