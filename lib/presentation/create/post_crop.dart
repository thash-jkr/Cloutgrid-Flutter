import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';

class PostCrop extends StatefulWidget {
  final Uint8List imageBytes;
  final void Function(Uint8List?, String) onCropCompleted;
  final VoidCallback onCancelled;

  const PostCrop({
    super.key,
    required this.imageBytes,
    required this.onCropCompleted,
    required this.onCancelled,
  });

  @override
  State<PostCrop> createState() => _PostCropState();
}

class _PostCropState extends State<PostCrop> {
  late final CropController _controller;
  double _ratio = 1;
  String _ratioLabel = '1:1';

  @override
  void initState() {
    super.initState();
    _controller = CropController(aspectRatio: _ratio);
  }

  Future<(int, int)> getImageDimensions(Uint8List bytes) async {
    final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(
      bytes,
    );
    final ui.Codec codec = await ui.instantiateImageCodecFromBuffer(buffer);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.Image image = frameInfo.image;

    final width = image.width;
    final height = image.height;

    image.dispose();
    codec.dispose();

    return (width, height);
  }

  Rect _maximizedRectFor(double ratio, int imgWidth, int imgHeight) {
    double widthFraction, heightFraction;
    final imageRatio = imgWidth / imgHeight;

    if (ratio > imageRatio) {
      widthFraction = 1.0;
      heightFraction = (imgWidth / ratio) / imgHeight;
    } else {
      heightFraction = 1.0;
      widthFraction = (imgHeight * ratio) / imgWidth;
    }

    final left = (1 - widthFraction) / 2;
    final top = (1 - heightFraction) / 2;

    return Rect.fromLTWH(left, top, widthFraction, heightFraction);
  }

  Future<void> _setRatio(String label, double ratio) async {
    final (imgWidth, imgHeight) = await getImageDimensions(widget.imageBytes);
    final rect = _maximizedRectFor(ratio, imgWidth, imgHeight);

    if (!mounted) return;

    setState(() {
      _ratio = ratio;
      _ratioLabel = label;
      _controller.aspectRatio = ratio;
      _controller.crop = rect;
    });
  }

  Future<void> _handleCrop() async {
    try {
      final ui.Image bitmap = await _controller.croppedBitmap();
      final byteData = await bitmap.toByteData(format: ui.ImageByteFormat.png);
      widget.onCropCompleted(byteData?.buffer.asUint8List(), _ratioLabel);
    } catch (_) {
      widget.onCropCompleted(null, "1:1");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CropImage(
            controller: _controller,
            image: Image.memory(widget.imageBytes),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RatioToggle(
                label: '1:1',
                selected: _ratio == 1,
                onTap: () => _setRatio("1:1", 1),
              ),
              _RatioToggle(
                label: '4:3',
                selected: _ratio == 4 / 3,
                onTap: () => _setRatio("4:3", 4 / 3),
              ),
              _RatioToggle(
                label: '3:4',
                selected: _ratio == 3 / 4,
                onTap: () => _setRatio("3:4", 3 / 4),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 50,
            top: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: widget.onCancelled,
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: _handleCrop,
                child: const Text('Crop & Save'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RatioToggle extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RatioToggle({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return selected
        ? FilledButton(onPressed: onTap, child: Text(label))
        : OutlinedButton(
            onPressed: onTap,
            child: Text(label, style: const TextStyle(color: Colors.white)),
          );
  }
}
