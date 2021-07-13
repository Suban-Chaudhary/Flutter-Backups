import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hungerz_delivery/Components/list_tile.dart';
import 'package:hungerz_delivery/Locale/locales.dart';
import 'package:hungerz_delivery/Routes/routes.dart';
import 'package:hungerz_delivery/Themes/colors.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String? number;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            child: UserDetails(),
            height: 220.0,
          ),
          Divider(
            color: Theme.of(context).cardColor,
            thickness: 8.0,
          ),
          BuildListTile(
              image: 'images/account/ic_menu_home.png',
              text: AppLocalizations.of(context)!.homeText,
              onTap: () =>
                  Navigator.popAndPushNamed(context, PageRoutes.accountPage)),
          BuildListTile(
              image: 'images/account/ic_menu_insight.png',
              text: AppLocalizations.of(context)!.insight,
              onTap: () =>
                  Navigator.popAndPushNamed(context, PageRoutes.insightPage)),
          BuildListTile(
            image: 'images/account/ic_menu_wallet.png',
            text: AppLocalizations.of(context)!.wallet,
            onTap: () =>
                Navigator.popAndPushNamed(context, PageRoutes.walletPage),
          ),
          BuildListTile(
              image: 'images/account/ic_menu_tncact.png',
              text: AppLocalizations.of(context)!.tnc,
              onTap: () =>
                  Navigator.popAndPushNamed(context, PageRoutes.tncPage)),
          BuildListTile(
              image: 'images/account/ic_menu_supportact.png',
              text: AppLocalizations.of(context)!.support,
              onTap: () => Navigator.popAndPushNamed(
                  context, PageRoutes.supportPage,
                  arguments: number)),
          BuildListTile(
            image: 'images/account/ic_menu_setting.png',
            text: AppLocalizations.of(context)!.settings,
            onTap: () => Navigator.popAndPushNamed(context, PageRoutes.setting),
          ),
          LogoutTile(),
        ],
      ),
    );
  }
}

class DrawerItem {
  String title;
  String image;

  DrawerItem(this.title, this.image);
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isoffline = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: AppBar(
            iconTheme: IconThemeData(color: kMainColor),
            title: Text(
                isoffline
                    ? AppLocalizations.of(context)!.offlineText!
                    : AppLocalizations.of(context)!.onlineText!,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w500)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: isoffline
                    ? TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kMainColor,
                        ),
                        onPressed: () {
                          setState(() {
                            isoffline = false;
                          });

                          //Navigator.popAndPushNamed(context, PageRoutes.accountPage);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.goOnline!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.7,
                              letterSpacing: 0.06),
                        ),
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Color(0xffff3939))),
                          backgroundColor: Color(0xffff3939),
                        ),
                        onPressed: () {
                          setState(() {
                            isoffline = true;
                          });

                          // Navigator.popAndPushNamed(context, PageRoutes.offlinePage);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.goOffline!,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.7,
                              letterSpacing: 0.06),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      drawer: Account(),
      body: isoffline
          ? Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/mapdelivery.png"),
                            fit: BoxFit.cover))),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    margin: EdgeInsets.all(20.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '64',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.orders!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6a6c74)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '68 km',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.ride!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6a6c74)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '\$302.50',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              AppLocalizations.of(context)!.earnings!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff6a6c74)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/mapdelivery.png"),
                      fit: BoxFit.cover))),
      floatingActionButton: isoffline
          ? null
          : FloatingActionButton(
              backgroundColor: kMainColor,
              child: Icon(Icons.list),
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.newDeliveryPage),
            ),
    );
  }
}

class LogoutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BuildListTile(
      image: 'images/account/ic_menu_logoutact.png',
      text: AppLocalizations.of(context)!.logout,
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context)!.loggingOut!),
                content: Text(AppLocalizations.of(context)!.areYouSure!),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      AppLocalizations.of(context)!.no!,
                      style: TextStyle(
                        color: kMainColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kTransparentColor)),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: kTransparentColor)),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.yes!,
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                      onPressed: () {
                        Phoenix.rebirth(context);
                      })
                ],
              );
            });
      },
    );
  }
}

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 32.0,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
            SizedBox(
              width: 20.0,
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, PageRoutes.editProfile),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('\n' + 'George Anderson',
                      style: Theme.of(context).textTheme.bodyText1),
                  Text('\n' + '+1 987 654 3210',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Color(0xff9a9a9a))),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('deliveryman@email.com',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Color(0xff9a9a9a))),
                ],
              ),
            ),
          ],
        ));
  }
}
