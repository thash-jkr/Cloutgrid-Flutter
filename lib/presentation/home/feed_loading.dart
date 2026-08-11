import 'package:flutter/material.dart';

class _SlidingGradientTransform extends GradientTransform {
  final double slidePercent;
  const _SlidingGradientTransform({required this.slidePercent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class _ShimmerBox extends StatelessWidget {
  final double? width;
  final double height;
  final double animationOffset;

  const _ShimmerBox({
    this.width,
    required this.height,
    required this.animationOffset,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        height: height,
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.transparent,
                Colors.white.withValues(alpha: 0.7),
                Colors.transparent,
              ],
              transform: _SlidingGradientTransform(
                slidePercent: animationOffset,
              ),
            ).createShader(bounds);
          },
          child: Container(color: Colors.grey.withValues(alpha: 0.3)),
        ),
      ),
    );
  }
}

class _LoadingBox extends StatelessWidget {
  final double animationOffset;

  const _LoadingBox({required this.animationOffset});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: _ShimmerBox(
            width: double.infinity,
            height: 50,
            animationOffset: animationOffset,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _ShimmerBox(
            width: double.infinity,
            height: 300,
            animationOffset: animationOffset,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: _ShimmerBox(
                  height: 50,
                  animationOffset: animationOffset,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: _ShimmerBox(
                  height: 50,
                  animationOffset: animationOffset,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FeedLoading extends StatefulWidget {
  const FeedLoading({super.key});

  @override
  State<FeedLoading> createState() => _FeedLoadingState();
}

class _FeedLoadingState extends State<FeedLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(
      begin: -1,
      end: 2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              _LoadingBox(animationOffset: _animation.value),
              _LoadingBox(animationOffset: _animation.value),
              _LoadingBox(animationOffset: _animation.value),
            ],
          ),
        );
      },
    );
  }
}
