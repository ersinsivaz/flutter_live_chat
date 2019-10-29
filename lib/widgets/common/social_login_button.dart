import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double buttonHeight;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton({Key key, 
    @required this.buttonText, 
    this.buttonColor : Colors.purple, 
    this.textColor : Colors.white, 
    this.radius : 16, 
    this.buttonHeight : 40, 
    this.buttonIcon, 
    this.onPressed}) 
    : assert(buttonText != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: buttonHeight,
            child: RaisedButton(
                  onPressed: onPressed,
                  color: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(radius))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      buttonIcon,
                      Text(buttonText,style: TextStyle(color: textColor),),
                      Text(""),
                    ],
                  ),
                ),
      ),
    );
  }

}