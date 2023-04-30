import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        ColoredBox(
          color: Theme.of(context).colorScheme.background,
          child: const SizedBox.expand(),
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: height * 257 / 844 + width * 20 / 1000,
              child: ColoredBox(
                color: Theme.of(context).colorScheme.secondary,
                child: SizedBox(
                  height: height * 257 / 844,
                  width: width,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: ColoredBox(
                color: Theme.of(context).colorScheme.background,
                child: SizedBox(
                  width: width,
                  height: width * 200 / 1000,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    var w = size.width / 1000;
    var h = size.height / 200;
    path.moveTo(0, size.height);
    path.lineTo(0, h * 180);
    //path.lineTo(w * 742, 0);
    // curved line
    path.lineTo(w * 680, h * 17);
    path.conicTo(w * 742, h * 0, w * 800, h * 17, 0.8);

    path.lineTo(w * 850, h * 29);
    path.conicTo(w * 882, h * 35, w * 910, h * 63, 0.8);

    path.lineTo(w * 925, h * 78);
    path.conicTo(w * 935, h * 85, w * 945, h * 103, 0.8);

    path.lineTo(size.width, h * 180);
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
//верхнюю треть (257/844) занимает синий бокс. Остальное - белый фон.
//поверх синего бокса белый колорбокс, обрезанный по шейпу с закругленным краем радиусом 145px. 
//шейп
// 0:180
// 820:0
// 882:35
// 935:85
// 1000:180
