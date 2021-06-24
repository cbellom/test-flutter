import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final double height;
  final bool disabled;
  final void Function()? onPress;

  const CustomButton({
    this.inputText = '',
    this.height = 44,
    this.disabled = false,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: height,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          colors: disabled
              ? [Color(0xffcccccc), Color(0xffcecece)]
              : [Color(0xff9223E0), Color(0xff9223E0)],
          stops: [0.2, 0.5],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
      ),
      child: MaterialButton(
        onPressed: this.onPress,
        child: Text(
          inputText,
          style: TextStyle(
            color: disabled ? Colors.grey[200] : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
