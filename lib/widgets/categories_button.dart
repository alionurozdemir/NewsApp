import 'package:flutter/material.dart';

class CategoriesButton extends StatelessWidget {
  final Color color;
  final String text;

  const CategoriesButton({Key? key, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 25),
          onPrimary: Colors.white,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 15),
            //style: Theme.of(context).copyWith().textTheme.bodyText2,
          ),
        ),
      ),
    );
  }
}
