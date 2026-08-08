import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/api_config.dart';
import '../../models/auth/auth_models.dart';
import '../../providers/auth/auth_notifier.dart';
import '../../providers/create/create_notifier.dart';
import '../../widgets/category_list.dart';
import '../../widgets/clout_empty.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_sheet.dart';
import '../../widgets/clout_toast.dart';
import '../../widgets/segmented_list.dart';
import 'post_crop.dart';

class CreatePost extends ConsumerStatefulWidget {
  final Uint8List selectedImage;
  final VoidCallback onNavigateBack;

  const CreatePost({
    super.key,
    required this.selectedImage,
    required this.onNavigateBack,
  });

  @override
  ConsumerState<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
  final _captionController = TextEditingController();
  final _captionFocusNode = FocusNode();
  final _scrollController = ScrollController();

  UserContainer? _collab;
  Uint8List? _croppedImage;
  bool _showImageViewer = false;

  void _onCropCompleted(Uint8List? bytes) {
    if (bytes == null) {
      widget.onNavigateBack();
      return;
    }
    setState(() => _croppedImage = bytes);
  }

  @override
  void initState() {
    super.initState();

    _captionFocusNode.addListener(() {
      if (_captionFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 150), () {
          if (!mounted) return;
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _captionController.dispose();
    _captionFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _openCollabSheet() {
    cloutSheet(
      context,
      content: _CollabSheet(
        selectedCollab: _collab,
        onCollabSelected: (c) => setState(() => _collab = c),
      ),
    );
  }

  Future<void> _handleSave() async {
    if (_captionController.text.trim().isEmpty) {
      showToast(context, message: 'Caption cannot be empty', isSuccess: false);
      return;
    }

    final success = await ref
        .read(createProvider.notifier)
        .handlePostImage(
          imageBytes: _croppedImage!,
          caption: _captionController.text.trim(),
          collab: _collab?.profile.username,
        );

    if (!mounted) return;

    if (success) {
      showToast(context, message: 'Posted');
      widget.onNavigateBack();
    } else {
      final error = ref.read(createProvider).errorMessage;
      showToast(context, message: error ?? 'Failed to post', isSuccess: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).value?.user;
    final isCreator = user?.profile.userType == 'creator';

    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CloutHeader(
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
            controller: _scrollController,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_croppedImage != null) ...[
                  GestureDetector(
                    onTap: () => setState(() => _showImageViewer = true),
                    child: Image.memory(
                      _croppedImage!,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ] else ...[
                  Image.memory(
                    widget.selectedImage,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ],

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: _captionController,
                    focusNode: _captionFocusNode,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: 'Caption',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                if (isCreator)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: _openCollabSheet,
                      child: AbsorbPointer(
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Collaboration',
                            border: const OutlineInputBorder(),
                            helperText:
                                'Optional – If you collaborated with any businesses for this post, mention them',
                            helperMaxLines: 2,
                            suffixIcon: _collab != null
                                ? IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () =>
                                        setState(() => _collab = null),
                                  )
                                : null,
                          ),
                          child: Text(
                            _collab != null
                                ? '@${_collab!.profile.username}'
                                : '',
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),

        if (_croppedImage == null)
          Positioned.fill(
            child: Material(
              color: Colors.black.withValues(alpha: 0.9),
              child: SafeArea(
                top: false,
                bottom: false,
                child: PostCrop(
                  imageBytes: widget.selectedImage,
                  onCropCompleted: _onCropCompleted,
                  onCancelled: widget.onNavigateBack,
                ),
              ),
            ),
          ),

        if (_showImageViewer && _croppedImage != null)
          Positioned.fill(
            child: Material(
              color: Colors.black.withValues(alpha: 0.9),
              child: SafeArea(
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _showImageViewer = false),
                      child: InteractiveViewer(
                        minScale: 1,
                        maxScale: 4,
                        child: Center(child: Image.memory(_croppedImage!)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _CollabSheet extends ConsumerStatefulWidget {
  final UserContainer? selectedCollab;
  final ValueChanged<UserContainer> onCollabSelected;

  const _CollabSheet({
    required this.selectedCollab,
    required this.onCollabSelected,
  });

  @override
  ConsumerState<_CollabSheet> createState() => _CollabSheetState();
}

class _CollabSheetState extends ConsumerState<_CollabSheet> {
  final _queryController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    setState(() => _query = value);
    if (value.isNotEmpty) {
      ref.read(createProvider.notifier).searchBusiness(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final createState = ref.watch(createProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(title: 'Search Collaboration'),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, kToolbarHeight + topInset, 15, 20),
        children: [
          TextField(
            controller: _queryController,
            onChanged: _onQueryChanged,
            decoration: InputDecoration(
              labelText: 'Search for Businesses',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (createState.collabs.isEmpty)
            CloutEmpty(
              type: EmptyType.general,
              message: _query.isEmpty
                  ? 'Search for the business you collaborated with'
                  : 'No results found',
              isLoading: createState.isLoading,
            )
          else
            ...createState.collabs.asMap().entries.map((entry) {
              final index = entry.key;
              final collab = entry.value;
              final isSelected =
                  collab.profile.username ==
                  widget.selectedCollab?.profile.username;

              return Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: SegmentedListItem(
                  index: index,
                  count: createState.collabs.length,
                  selected: isSelected,
                  leading: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConfig.current.baseUrl +
                          collab.profile.profilePhoto,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircleAvatar(radius: 25),
                      errorWidget: (context, url, error) =>
                          const CircleAvatar(radius: 25),
                    ),
                  ),
                  onTap: () {
                    widget.onCollabSelected(collab);
                    Navigator.pop(context);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        collab.profile.name,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        CategoryList.labelFor(collab.targetAudience ?? ''),
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? Colors.white70 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
        ],
      ),
    );
  }
}
