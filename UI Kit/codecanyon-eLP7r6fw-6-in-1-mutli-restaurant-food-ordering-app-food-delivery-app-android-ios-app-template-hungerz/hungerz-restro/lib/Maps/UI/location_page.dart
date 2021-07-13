import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hungerz_store/Components/bottom_bar.dart';
import 'package:hungerz_store/Components/custom_appbar.dart';
import 'package:hungerz_store/Locale/locales.dart';
import 'package:hungerz_store/Routes/routes.dart';
import 'package:hungerz_store/Themes/colors.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SetLocation();
  }
}

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126.0),
        child: CustomAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          titleWidget: Text(
            AppLocalizations.of(context)!.setLocation!,
            style: TextStyle(fontSize: 16.7, fontWeight: FontWeight.bold),
          ),
          onTap: null,
          hint: AppLocalizations.of(context)!.enterLocation,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/mapl.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  top: 400,
                  right: 25,
                  child: Image.asset(
                    'images/lo.png',
                    scale: 3.0,
                  ),
                )
              ],
            ),
          ),
          Container(
            color: kCardBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/map_pin.png',
                  scale: 2.5,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Text(
                    "1124, Veggy Garden, City Food Park, United States",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
          BottomBar(
            text: AppLocalizations.of(context)!.continueText,
            onTap: () =>
                Navigator.popAndPushNamed(context, PageRoutes.storeProfile),
          ),
        ],
      ),
    );
  }
}
