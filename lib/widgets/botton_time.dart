import 'package:flutter/material.dart';
import 'package:juno_prueba/widgets/colors.dart';

class ButtonTime extends StatelessWidget {
  const ButtonTime(
      {Key? key,
      required this.select,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final bool select;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: select == true ? ColorStyle.azul : ColorStyle.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: select == true
                    ? Colors.transparent
                    : ColorStyle.neutral50)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: select == true ? ColorStyle.white : ColorStyle.neutral80),
        )),
      ),
    );
  }
}
