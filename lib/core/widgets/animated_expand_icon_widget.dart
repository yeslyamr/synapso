import 'package:flutter/material.dart';

class AnimatedExpandIcon extends AnimatedWidget {
  const AnimatedExpandIcon({
    super.key,
    required AnimationController controller,
  }) : super(listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value,
      child: SizedBox(
        height: 24,
        width: 24,
        key: const ValueKey('icon1'),
        child: Image.asset(
          'assets/icons/arrow_down.png',
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}
