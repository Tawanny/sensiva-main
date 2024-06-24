import 'package:flutter/material.dart';

class ShimmerArrows extends StatefulWidget {
  const ShimmerArrows({super.key});

  @override
  State<ShimmerArrows> createState() => _ShimmerArrowsState();
}

class _ShimmerArrowsState extends State<ShimmerArrows>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animeCntrl;

  @override
  void initState() {
    super.initState();
    _animeCntrl = AnimationController.unbounded(vsync: this)
      ..repeat(
        min: -0.5,
        max: 1.5,
        period: const Duration(seconds: 1),
      );
  }

  @override
  void dispose() {
    _animeCntrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animeCntrl,
      builder: (_, child) {
        return ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    Colors.white10,
                    Colors.white,
                    Colors.white10,
                  ],
                  stops: const [0.0, 0.3, 1],
                  transform:
                      _SliderGradientTransform(percent: _animeCntrl.value))
              .createShader(bounds),
          child: child,
        );
      },

      /// We can put the column out here since it a constant.
      child: const Column(
        children: [
          Align(heightFactor: .4, child: Icon(Icons.keyboard_arrow_up)),
          Align(heightFactor: .4, child: Icon(Icons.keyboard_arrow_up)),
          Align(heightFactor: .4, child: Icon(Icons.keyboard_arrow_up)),
        ],
      ),
    );
  }
}

class _SliderGradientTransform extends GradientTransform {
  final double percent;

  _SliderGradientTransform({required this.percent});
  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(0, -(bounds.height * percent), 0);
  }
}
