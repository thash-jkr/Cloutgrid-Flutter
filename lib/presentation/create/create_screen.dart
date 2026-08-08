import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/clout_header.dart';

class CreateScreen extends StatefulWidget {
  final ValueChanged<Uint8List> onNavigateToCreatePost;

  const CreateScreen({super.key, required this.onNavigateToCreatePost});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    widget.onNavigateToCreatePost(
      bytes,
    ); // raw, uncropped — CreatePost handles cropping now
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Create'),
      body: Padding(
        padding: EdgeInsets.only(top: kToolbarHeight + topInset),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                elevation: 1,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: _pickImage,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Post',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  "Upload an image from a previous brand collaboration or campaign you've been part of",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/speaker.png',
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
