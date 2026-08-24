import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class ProfileImageCropper extends StatefulWidget {
  final Uint8List imageBytes;
  final ValueChanged<Uint8List?> onCropCompleted;
  final VoidCallback onCancelled;

  const ProfileImageCropper({
    super.key,
    required this.imageBytes,
    required this.onCropCompleted,
    required this.onCancelled,
  });

  @override
  State<ProfileImageCropper> createState() => _ProfileImageCropperState();
}

class _ProfileImageCropperState extends State<ProfileImageCropper> {
  final _controller = CropController();
  bool _isCompressing = false;

  Future<void> _handleCropped(Uint8List? croppedImage) async {
    if (croppedImage == null) {
      widget.onCropCompleted(null);
      return;
    }

    setState(() => _isCompressing = true);

    final compressed = await FlutterImageCompress.compressWithList(
      croppedImage,
      minWidth: 500,
      minHeight: 500,
      quality: 80,
      format: CompressFormat.jpeg,
    );

    if (!mounted) return;
    setState(() => _isCompressing = false);
    widget.onCropCompleted(compressed);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Crop(
            controller: _controller,
            image: widget.imageBytes,
            aspectRatio: 1,
            withCircleUi: true,
            baseColor: Colors.black,
            maskColor: Colors.black.withValues(alpha: 0.6),
            onCropped: (result) {
              switch (result) {
                case CropSuccess(:final croppedImage):
                  _handleCropped(croppedImage);
                case CropFailure():
                  _handleCropped(null);
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton(
                onPressed: widget.onCancelled,
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () => _controller.crop(),
                child: const Text('Crop & Save'),
              ),
            ],
          ),
        ),
        if (_isCompressing)
          Positioned.fill(
            child: Container(
              color: Colors.black54,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
