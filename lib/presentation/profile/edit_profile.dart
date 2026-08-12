import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/network/api_config.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../widgets/category_list.dart';
import '../../widgets/category_sheet.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_sheet.dart';
import 'profile_crop.dart';

class EditProfile extends ConsumerStatefulWidget {
  final VoidCallback onNavigateBack;

  const EditProfile({super.key, required this.onNavigateBack});

  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  String _category = '';
  bool _controllersInitialized = false;

  final _picker = ImagePicker();
  Uint8List? _selectedImageBytes;
  Uint8List? _rawImageBytes;
  bool _showCropper = false;

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    final bytes = await file.readAsBytes();
    setState(() {
      _rawImageBytes = bytes;
      _showCropper = true;
    });
  }

  void _onCropCompleted(Uint8List? bytes) {
    setState(() {
      _showCropper = false;
      if (bytes != null) _selectedImageBytes = bytes;
    });
  }

  void _openCategorySheet() {
    cloutSheet(
      context,
      content: CategorySheet(
        categories: CategoryList.allOptions,
        selectedCategory: _category,
        onCategorySelected: (cat) {
          setState(() => _category = cat.value);
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> _handleSave() async {
    var data = {
      'user[name]': _nameController.text.trim(),
      'user[bio]': _bioController.text.trim(),
    };

    data = {...data, 'area': _category};

    try {
      await ref
          .read(authProvider.notifier)
          .updateProfile(
            userType: "creator",
            data: data,
            imageBytes: _selectedImageBytes,
          );

      if (!mounted) return;

      showToast(context, message: "Profile Updated");
      widget.onNavigateBack();
    } catch (e) {
      if (!mounted) return;
      showToast(context, message: "Updated failed: $e", isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final authState = ref.watch(authProvider);
    final user = authState.value?.user;
    final isLoaded = user != null;

    if (isLoaded && !_controllersInitialized) {
      _nameController.text = user.profile.name;
      _bioController.text = user.profile.bio ?? '';
      _category = user.area ?? user.targetAudience ?? '';
      _controllersInitialized = true;
    }

    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CloutHeader(
            title: 'Edit Profile',
            icon: HeaderAction(
              icon: Icons.arrow_back,
              contentDescription: 'Back',
              onClick: widget.onNavigateBack,
            ),
            actions: [
              HeaderAction(
                icon: Icons.save_outlined,
                contentDescription: 'Save',
                onClick: _handleSave,
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: kToolbarHeight + topInset,
              left: 15,
              right: 15,
            ),
            child: Column(
              spacing: 20,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipOval(
                        child: _selectedImageBytes != null
                            ? Image.memory(
                                _selectedImageBytes!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    ApiConfig.current.baseUrl +
                                    (user?.profile.profilePhoto ?? ''),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    const CircleAvatar(radius: 50),
                                errorWidget: (context, url, error) =>
                                    const CircleAvatar(radius: 50),
                              ),
                      ),
                      Positioned(
                        bottom: -10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Material(
                            color: Colors.white,
                            shape: const CircleBorder(),
                            elevation: 2,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: _pickImage,
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.edit_rounded, size: 15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                TextField(
                  minLines: 1,
                  maxLines: 5,
                  controller: _bioController,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(0),
                  child: GestureDetector(
                    onTap: _openCategorySheet,
                    child: AbsorbPointer(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          CategoryList.labelFor(_category),
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_showCropper && _rawImageBytes != null)
          Positioned.fill(
            child: Material(
              color: Colors.black,
              child: SafeArea(
                child: ProfileImageCropper(
                  imageBytes: _rawImageBytes!,
                  onCropCompleted: _onCropCompleted,
                  onCancelled: () => setState(() => _showCropper = false),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
