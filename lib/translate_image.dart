import 'package:flutter/cupertino.dart';

class TranslateImage extends StatelessWidget {
  const TranslateImage({
    Key? key,
    required this.image,
    this.height = 100,
    this.offset = const Offset(0, 0),
  }) : super(key: key);
  final Offset offset;
  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: offset,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/$image',
            ),
          ),
        ),
      ),
    );
  }
}
