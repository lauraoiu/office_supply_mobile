import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:office_supply_mobile_master/config/paths.dart';
import 'package:office_supply_mobile_master/config/themes.dart';
import 'package:office_supply_mobile_master/widgets/circle_icon_button.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(imagePath + sweetHomePNG),
        backgroundColor(primaryLightColorTransparent),
        CircleIconButton(
          onTap: () => Navigator.of(context).pop(),
          margin: const EdgeInsets.only(top: 10, left: 10),
          iconData: Icons.arrow_back_ios,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Stationery Information',
            style: h5.copyWith(color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  accountAvatar(String photoUrl) => Material(
        elevation: 5,
        shadowColor: primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
        child: CircleAvatar(
          radius: 28,
          backgroundImage: const AssetImage(imagePath + blueAndPinkPNG),
          child: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(photoUrl),
          ),
        ),
      );

  accountInfo(GoogleSignInAccount googleSignInAccount) => Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              googleSignInAccount.displayName!,
              style: h6.copyWith(color: primaryLightColor, fontSize: 14),
              textAlign: TextAlign.start,
            ),
            Text(
              '(Nhân viên)',
              style: h6.copyWith(
                color: primaryLightColor,
                fontWeight: FontWeight.w200,
                fontSize: 13,
              ),
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                Text(
                  '1,642,000₫',
                  style: h6.copyWith(
                    color: primaryLightColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.yellow.shade800,
                  size: 14,
                )
              ],
            ),
          ],
        ),
      );

  notificationButton(VoidCallback onTap) => InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.notifications_active_outlined,
          color: primaryLightColor,
          size: 15,
        ),
      );

  signOutButton(VoidCallback onTap) => InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.logout_outlined,
          color: primaryLightColor,
          size: 15,
        ),
      );

  searchTextField() => SizedBox(
        width: size.width * 5 / 7,
        height: 40,
        child: const Material(
          elevation: 5,
          shadowColor: primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          child: TextField(
            obscureText: true,
            autofocus: false,
            decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Icon(
                Icons.search,
                color: primaryColor,
                size: 18,
              ),
              suffixIcon: Icon(
                Icons.list,
                color: primaryColor,
                size: 18,
              ),
              hintText: 'Tìm loại văn phòng phẩm',
              hintStyle: TextStyle(
                fontSize: 10,
                color: lightGrey,
              ),
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
        ),
      );

  backgroundImage(String photoUrl) => Container(
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(photoUrl),
            fit: BoxFit.cover,
          ),
        ),
      );

  backgroundColor(Color color) => Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
        ),
      );
}