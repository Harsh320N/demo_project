import 'dart:math' as math show sin, pi;

import 'package:flutter/material.dart';
import 'package:user_listing_with_signup_demo/utils/utils_export.dart';

class DelayTween extends Tween<double> {
  DelayTween({double? begin, double? end, required this.delay})
      : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class FadingCubeLoader extends StatefulWidget {
  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  const FadingCubeLoader({
    Key? key,
    this.color = primaryColor,
    this.size = 30.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color'),
        super(key: key);

  @override
  State<FadingCubeLoader> createState() => _FadingCubeLoaderState();
}

class _FadingCubeLoaderState extends State<FadingCubeLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Center(
          child: Transform.rotate(
            angle: -45.0 * 0.0174533,
            child: Stack(
              children: List.generate(4, (i) {
                final size = widget.size * 0.5, position = widget.size * .5;
                return Positioned.fill(
                  top: position,
                  left: position,
                  child: Transform.scale(
                    scale: 1.1,
                    origin: Offset(-size * .5, -size * .5),
                    child: Transform(
                      transform: Matrix4.rotationZ(90.0 * i * 0.0174533),
                      child: Align(
                        alignment: Alignment.center,
                        child: FadeTransition(
                          opacity:
                              DelayTween(begin: 0.0, end: 1.0, delay: 0.3 * i)
                                  .animate(_controller),
                          child: SizedBox.fromSize(
                              size: Size.square(size), child: _itemBuilder(i)),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}
