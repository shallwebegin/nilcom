import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/repository/common_firebase_storage.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/common/utils.dart';
import 'package:nilcom/models/article_model.dart';
import 'package:nilcom/models/user_model.dart';
import 'package:nilcom/more/controller/more_controller.dart';
import 'package:uuid/uuid.dart';

class WriteArticle extends ConsumerStatefulWidget {
  const WriteArticle({super.key, required this.currentUser});
  final UserModel currentUser;

  @override
  ConsumerState<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends ConsumerState<WriteArticle> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  XFile? image;
  Future<void> pickImage() async {
    image = await pickImageFromGallery();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: whiteColor,
                )),
            title: const Text(
              'Your Article',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = widget.currentUser;
                    ref
                        .read(commonFirebaseStorageProvider)
                        .storeFileToFirebase(
                            'articles/${user.uid}/${DateTime.now().millisecondsSinceEpoch}',
                            File(image!.path))
                        .then((value) {
                      final String uuid = Uuid().v4();
                      ArticleModel articleModel = ArticleModel(
                          uid: uuid,
                          title: _titleController.text,
                          content: _contentController.text,
                          author: '${user.name} ${user.surname}',
                          authorImg: user.profilePhoto!,
                          createdAt: DateTime.now(),
                          authorUid: user.uid!,
                          claps: 0,
                          views: 0);
                      ref
                          .read(moreControllerProvider)
                          .writeArticle(articleModel);
                    });
                  }
                },
                icon: const Icon(
                  Icons.done,
                  color: whiteColor,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: scaffoldPadding,
            child: Column(
              children: [
                Padding(
                  padding: vertical10,
                  child: GestureDetector(
                    onTap: pickImage,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.circular(30),
                          image: image != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(image!.path),
                                  ),
                                )
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            image == null
                                ? SvgPicture.asset(
                                    addImageSvg,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill the content';
                    }
                    return null;
                  },
                  style: const TextStyle(fontSize: 17, color: whiteColor),
                  controller: _titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Your title here',
                      hintStyle: TextStyle(fontSize: 17, color: greyColor)),
                ),
                Expanded(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill the content';
                      }
                      return null;
                    },
                    maxLines: 100,
                    controller: _contentController,
                    style: const TextStyle(fontSize: 17, color: whiteColor),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Your article content here',
                        hintStyle: TextStyle(fontSize: 17, color: greyColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
