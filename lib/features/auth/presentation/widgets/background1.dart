import 'package:flutter/material.dart';

class Background1 extends StatefulWidget {
  const Background1({super.key});

  @override
  State<Background1> createState() => _Background1State();
}

class _Background1State extends State<Background1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //BACKGRUND COLOR
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(color: Color(0xFF8091CE)),
        ),

        Positioned(
          top: -100,
          bottom: 0,
          right: -260,
          left: 0,
          child: ClipPath(
            clipper: BG2Clipper(),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                //  color: Color(0xFF46506E),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF46506E).withValues(alpha: 0.8),
                    Color(0xFF5E7BC8).withValues(alpha: 0.6),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                ),
              ),
            ),
          ),
        ),

        //vertical left file
        Positioned(
          top: 0,
          bottom: 0,
          right: 70,
          left: 0,
          child: ClipPath(
            clipper: BG1Clipper(),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                //   color: Color(0xFF6C81CB).withValues(alpha: 0.6),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1C274B).withValues(alpha: 0.7),
                    Color(0xFF6C81CB).withValues(alpha: 0.7),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                ),
              ),
            ),
          ),
        ),
        //Circulo chiquito
        Positioned(
          bottom: 240,
          left: 20,
          child: _circle(
            70,
            fColor: Color(0xFFEFF3FC),
            lColor: Color(0xFF6A8EE5),
          ),
        ),

        Positioned(
          bottom: 100,
          left: 100,
          child: _circle(
            140,
            fColor: Color(0xFF3C66CD),
            lColor: Color(0xFF131E49),
          ),
        ),

        Positioned(
          top: -40,
          left: -35,
          child: _circle(
            140,
            fColor: Color(0xFF3C66CD),
            lColor: Color(0xFF131E49),
          ),
        ),
        //Circulo grande
        Positioned(
          top: -100,
          right: -200,
          child: _circle(
            400,
            fColor: Color(0xFF6A8EE5),
            lColor: Color(0xFFEFF3FC),
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        //mani
        Positioned(
          top: 75,
          right: -40,
          child: ClipPath(
            clipper: MyFinalClipper(),
            child: Container(
              width: 210,
              height: 210,
              //color: Color(0xFF7483e2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6878E0), Color(0xFF69A8E7)],
                ),
              ),
            ),
          ),
        ),

        //Circulo chiquito
        Positioned(
          top: 180,
          right: 60,
          child: _circle(
            90,
            fColor: Color(0xFFEFF3FC),
            lColor: Color(0xFF6A8EE5),
          ),
        ),
      ],
    );
  }

  Container _circle(
    double size, {
    Color fColor = const Color(0xFF385ebc),
    Color lColor = const Color(0xFF1c2649),
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [fColor, lColor],
          begin: begin,
          end: end,
        ),
        borderRadius: BorderRadius.circular(size),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class BG1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width * 0.92, size.height * 0.89);
    path.cubicTo(
      size.width * 0.83,
      size.height * 0.85,
      size.width * 0.71,
      size.height * 0.88,
      size.width * 0.61,
      size.height * 0.83,
    );
    path.cubicTo(
      size.width * 0.57,
      size.height * 0.81,
      size.width * 0.54,
      size.height * 0.78,
      size.width * 0.52,
      size.height * 0.75,
    );
    path.cubicTo(
      size.width / 2,
      size.height * 0.72,
      size.width * 0.49,
      size.height * 0.69,
      size.width * 0.44,
      size.height * 0.66,
    );
    path.cubicTo(
      size.width * 0.43,
      size.height * 0.65,
      size.width * 0.42,
      size.height * 0.65,
      size.width * 0.4,
      size.height * 0.64,
    );
    path.cubicTo(
      size.width * 0.31,
      size.height * 0.59,
      size.width * 0.23,
      size.height * 0.6,
      size.width * 0.19,
      size.height * 0.57,
    );
    path.cubicTo(
      size.width * 0.17,
      size.height * 0.55,
      size.width * 0.18,
      size.height * 0.53,
      size.width * 0.18,
      size.height * 0.52,
    );
    path.cubicTo(
      size.width * 0.19,
      size.height * 0.47,
      size.width / 4,
      size.height * 0.46,
      size.width * 0.29,
      size.height * 0.41,
    );
    path.cubicTo(
      size.width * 0.34,
      size.height * 0.36,
      size.width * 0.3,
      size.height * 0.36,
      size.width * 0.34,
      size.height * 0.32,
    );
    path.cubicTo(
      size.width * 0.38,
      size.height * 0.28,
      size.width * 0.45,
      size.height * 0.26,
      size.width * 0.49,
      size.height / 5,
    );
    path.cubicTo(
      size.width * 0.52,
      size.height * 0.18,
      size.width * 0.52,
      size.height * 0.17,
      size.width * 0.52,
      size.height * 0.16,
    );
    path.cubicTo(
      size.width * 0.52,
      size.height * 0.13,
      size.width * 0.47,
      size.height * 0.12,
      size.width * 0.46,
      size.height * 0.08,
    );
    path.cubicTo(
      size.width * 0.45,
      size.height * 0.07,
      size.width * 0.45,
      size.height * 0.05,
      size.width * 0.46,
      size.height * 0.04,
    );
    path.cubicTo(
      size.width * 0.47,
      size.height * 0.02,
      size.width * 0.53,
      size.height * 0.01,
      size.width * 0.61,
      0,
    );
    path.cubicTo(size.width * 0.61, 0, 0, 0, 0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.cubicTo(
      size.width,
      size.height * 0.94,
      size.width * 0.96,
      size.height * 0.91,
      size.width * 0.92,
      size.height * 0.89,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BG2Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.43);
    path.cubicTo(
      size.width * 0.05,
      size.height * 0.43,
      size.width * 0.16,
      size.height * 0.43,
      size.width * 0.26,
      size.height * 0.48,
    );
    path.cubicTo(
      size.width * 0.29,
      size.height * 0.49,
      size.width * 0.31,
      size.height / 2,
      size.width / 3,
      size.height * 0.52,
    );
    path.cubicTo(
      size.width * 0.35,
      size.height * 0.54,
      size.width * 0.36,
      size.height * 0.55,
      size.width * 0.4,
      size.height * 0.61,
    );
    path.cubicTo(
      size.width * 0.44,
      size.height * 0.67,
      size.width * 0.45,
      size.height * 0.68,
      size.width * 0.46,
      size.height * 0.7,
    );
    path.cubicTo(
      size.width * 0.49,
      size.height * 0.74,
      size.width / 2,
      size.height * 0.76,
      size.width * 0.52,
      size.height * 0.77,
    );
    path.cubicTo(
      size.width * 0.54,
      size.height * 0.79,
      size.width * 0.56,
      size.height * 0.8,
      size.width * 0.66,
      size.height * 0.84,
    );
    path.cubicTo(
      size.width * 0.77,
      size.height * 0.89,
      size.width * 0.78,
      size.height * 0.89,
      size.width * 0.83,
      size.height * 0.92,
    );
    path.cubicTo(
      size.width * 0.85,
      size.height * 0.93,
      size.width * 0.89,
      size.height * 0.95,
      size.width * 0.93,
      size.height,
    );
    path.cubicTo(
      size.width,
      size.height * 1.06,
      size.width * 1.02,
      size.height * 1.17,
      size.width * 0.97,
      size.height * 1.27,
    );
    path.cubicTo(
      size.width * 0.93,
      size.height * 1.36,
      size.width * 0.83,
      size.height * 1.41,
      size.width * 0.79,
      size.height * 1.43,
    );
    path.lineTo(0, size.height * 1.43);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MyFinalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width * 0.01, size.height / 4);
    path.cubicTo(
      size.width * 0.06,
      size.height * 0.09,
      size.width * 0.24,
      size.height * 0.01,
      size.width * 0.39,
      size.height * 0.02,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.02,
      size.width * 0.58,
      size.height * 0.03,
      size.width * 0.66,
      size.height * 0.17,
    );
    path.cubicTo(
      size.width * 0.71,
      size.height / 4,
      size.width * 0.7,
      size.height / 3,
      size.width * 0.76,
      size.height * 0.37,
    );
    path.cubicTo(
      size.width * 0.81,
      size.height * 0.4,
      size.width * 0.84,
      size.height * 0.37,
      size.width * 0.89,
      size.height * 0.39,
    );
    path.cubicTo(
      size.width * 1.04,
      size.height * 0.45,
      size.width * 1.03,
      size.height * 0.97,
      size.width * 0.9,
      size.height,
    );
    path.cubicTo(
      size.width * 0.88,
      size.height * 1.02,
      size.width * 0.86,
      size.height,
      size.width * 0.78,
      size.height * 0.97,
    );
    path.cubicTo(
      size.width * 0.61,
      size.height * 0.88,
      size.width * 0.61,
      size.height * 0.9,
      size.width * 0.47,
      size.height * 0.84,
    );
    path.cubicTo(
      size.width * 0.29,
      size.height * 0.75,
      size.width / 5,
      size.height * 0.7,
      size.width * 0.12,
      size.height * 0.6,
    );
    path.cubicTo(
      size.width * 0.07,
      size.height * 0.54,
      -0.03,
      size.height * 0.4,
      size.width * 0.01,
      size.height / 4,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
