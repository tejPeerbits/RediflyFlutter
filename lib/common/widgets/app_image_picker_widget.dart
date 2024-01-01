import 'dart:convert';
import 'dart:io';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../core/app_text_style.dart';

class AppImagePickerWidget extends StatefulWidget {
  final String fieldName;
  final Function(List<File>) selectedImages;
  final List<String> prefilledImages;

  const AppImagePickerWidget(
      {super.key,
      required this.fieldName,
      required this.selectedImages,
      required this.prefilledImages});

  @override
  State<AppImagePickerWidget> createState() => _AppImagePickerWidgetState();
}

class _AppImagePickerWidgetState extends State<AppImagePickerWidget> {
  final List<File> pickedImageList = [];

  @override
  void initState() {
    if (widget.prefilledImages.isEmpty) return;
    for (String image in widget.prefilledImages) {
      pickedImageList.add(File.fromRawPath(base64Decode(image)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.fieldName,
                style: AppTextStyle.appTextStyleH3(context),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        pickedImageList.add(File(value.path));
                      });
                      widget.selectedImages(pickedImageList);
                    });
                  },
                  icon: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 18.r,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then((value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        pickedImageList.add(File(value.path));
                      });
                    });
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 18.r,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: pickedImageList.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.passthrough,
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.file(
                          pickedImageList[index],
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      showImageViewer(
                          context, FileImage(pickedImageList[index]));
                    },
                  ),
                  Positioned(
                    right: -5.w,
                    top: -5.w,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pickedImageList.removeAt(index);
                        });
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
