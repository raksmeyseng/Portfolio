import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/text_widget.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  const InfoText(
    Key? key, {
    required this.type,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          '$type: ',
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.blueGrey[100],
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
