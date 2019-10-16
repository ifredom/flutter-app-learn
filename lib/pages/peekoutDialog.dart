import 'package:flutter/material.dart';

// 使用方法
// _showDailog() {
//   showDialog(
//       context: context,
//       builder: (context) {
//         return CustomDialog(
//           title: "Success",
//           description:
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//           buttonText: "Okay",
//         );
//       });
// }

class CustomDialog extends StatelessWidget {
  final String title, description;
  final Image image;

  CustomDialog({
    @required this.title,
    @required this.description,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildCard(context),
        buildCircle(),
        //...bottom card part,
        //...top circlular image part,
      ],
    );
  }

  Widget buildCard(BuildContext context) {
    return Positioned(
      top: 50,
      left: Consts.padding,
      right: Consts.padding * 2,
      child: Container(
        padding: EdgeInsets.only(
          top: Consts.avatarRadius + Consts.padding,
          bottom: Consts.avatarRadius + Consts.padding,
          left: Consts.avatarRadius + Consts.padding,
          right: Consts.avatarRadius + Consts.padding,
        ),
        margin: EdgeInsets.only(top: Consts.avatarRadius),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(); // To close the dialog
                },
                child: Text('okay'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircle() {
    return Positioned(
      right: 16,
      top: 50,
      child: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        radius: Consts.avatarRadius,
      ),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 16.0;
}
