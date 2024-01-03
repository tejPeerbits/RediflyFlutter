// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../common/core/app_text_style.dart';
// import '../../../common/core/responsive.dart';
// import '../../../common/model/app_model.dart';
//
// class AddDocuments extends StatefulWidget {
//   final List<Documents>? documents;
//
//   const AddDocuments({super.key, this.documents});
//
//   @override
//   State<AddDocuments> createState() => _AddDocumentsState();
// }
//
// class _AddDocumentsState extends State<AddDocuments> {
//   List<PlatformFile> files = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // downloadDocuments();
//
//     setState(() {
//       print("files length=${files.length}");
//     });
//   }
//
//   Uint8List decodeBase64(String base64String) {
//     Uint8List bytes = base64.decode(base64String);
//     return bytes;
//   }
//
//   String getBase64FileExtension(String base64String) {
//     switch (base64String.characters.first) {
//       case '/':
//         return 'jpeg';
//       case 'i':
//         return 'png';
//       case 'R':
//         return 'gif';
//       case 'U':
//         return 'webp';
//       case 'J':
//         return 'pdf';
//       default:
//         return 'unknown';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("documents length=${widget.documents!.length}");
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 5),
//           child: Text(
//             "Documents",
//             style: AppTextStyle.appTextStyleRegular(context),
//           ),
//         ),
//         Expanded(
//           child: GridView.builder(
//             itemCount:
//                 files.length < 6 ? 6 : files.length + 1,
//             padding: const EdgeInsets.all(9),
//             // physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//             ),
//             itemBuilder: (context, index) {
//               return index == 0
//                   ? InkWell(
//                       onTap: () async {
//                         FilePickerResult? result =
//                             await FilePicker.platform.pickFiles();
//
//                         if (result != null) {
//                           PlatformFile file = result.files.first;
//
//                           files.add(file);
//                           log("files length ${files.length}");
//                           setState(() {});
//                         } else {
//                           // User canceled the picker
//                         }
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         margin: const EdgeInsets.all(9),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(9),
//                           border: Border.all(color: Colors.white, width: 0.5),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Icon(
//                               CupertinoIcons.plus,
//                               color: Colors.green,
//                               size: 45,
//                             ),
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             Text(
//                               "Attach a document",
//                               textAlign: TextAlign.center,
//                               style:
//                                   AppTextStyle.appTextStyleVerySmall(context),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   : files.isNotEmpty && files.length >= index
//                       ? Stack(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 _openFile(files[index - 1]);
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.all(9),
//                                 padding: const EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(9),
//                                   border: Border.all(
//                                       color: Colors.white, width: 0.5),
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Center(
//                                         child: getWidget(
//                                       files[index - 1],
//                                     )),
//                                     Text(
//                                       files[index - 1].name,
//                                       textAlign: TextAlign.center,
//                                       style: AppTextStyle.appTextStyleVerySmall(
//                                           context),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               top: 14.r,
//                               right: 9.r,
//                               child: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     files.removeAt(index - 1);
//                                   });
//                                 },
//                                 icon: Container(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.white),
//                                     borderRadius: BorderRadius.circular(15),
//                                     color: Colors.white,
//                                   ),
//                                   child: const Icon(
//                                     Icons.close,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : Container(
//                           margin: const EdgeInsets.all(9),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(9),
//                             border: Border.all(color: Colors.white, width: 0.5),
//                           ),
//                         );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget getWidget(PlatformFile file) {
//     print("file.extension:${file.extension}");
//     switch (file.extension) {
//       case "pdf":
//         return Icon(
//           Icons.picture_as_pdf_rounded,
//           color: Colors.white,
//           size: Responsive.isiPad(context) ? 25.r : 18.r,
//         );
//       case "doc":
//         return const Icon(
//           CupertinoIcons.doc,
//           color: Colors.white,
//         );
//       case "png":
//       case "jpg":
//       case "jpeg":
//       case "webp":
//         return ClipRRect(
//           borderRadius: BorderRadius.circular(5.r),
//           child: Image.memory(
//             file.bytes!,
//             height: Responsive.isiPad(context) ? 100.h : 54,
//             width: Responsive.isiPad(context) ? 100.w : 54,
//             fit: BoxFit.cover,
//           ),
//         );
//       case "xlsx":
//         return const Icon(
//           Icons.file_present,
//           color: Colors.white,
//         );
//       case "mp4":
//         return const Icon(
//           Icons.video_library,
//           color: Colors.white,
//         );
//       default:
//         return const Icon(
//           Icons.error,
//           color: Colors.white,
//         );
//     }
//   }
//
//   void _openFile(PlatformFile file) {
//     // OpenFile.open(file.path);
//   }
//
//   // Future<void> downloadDocument() async {
//   //   final Directory tempDir = await getTemporaryDirectory();
//   //
//   //   if (widget.documents != null && widget.documents!.isNotEmpty) {
//   //     print("documents length=${widget.documents!.length}");
//   //     for (int i = 0; i < widget.documents!.length; i++) {
//   //       var bytes = decodeBase64(widget.documents![i].document!);
//   //       print("bytes:$bytes");
//   //       PlatformFile file = PlatformFile(
//   //           name:
//   //               'ABC.${getBase64FileExtension(widget.documents![i].document!)}',
//   //           size: bytes.length,
//   //           bytes: bytes);
//   //       files.add(file);
//   //     }
//   //   }
//   // }
//
//   // downloadDocuments() async {
//   //   final Directory tempDir = await getApplicationCacheDirectory();
//   //
//   //   if (widget.documents != null && widget.documents!.isNotEmpty) {
//   //     print("documents length=${widget.documents!.length}");
//   //     for (int i = 0; i < widget.documents!.length; i++) {
//   //       try {
//   //         var bytes = base64.decode(widget.documents![i].document!);
//   //         print("bytes:$bytes");
//   //
//   //         // Get the file extension
//   //         String extension =
//   //             getBase64FileExtension(widget.documents![i].document!);
//   //
//   //         // Construct the file name
//   //         String fileName = 'ABC_$i.$extension';
//   //
//   //         // Construct the file path in the temporary directory
//   //         String filePath = '${tempDir.path}/$fileName';
//   //
//   //         // Write the bytes to the file
//   //         var fileNew = await File(filePath).writeAsBytes(bytes);
//   //
//   //         // Create PlatformFile and add it to the list
//   //         PlatformFile file = PlatformFile(
//   //           name: fileName,
//   //           size: bytes.length,
//   //           bytes: bytes,
//   //           path: fileNew.path,
//   //         );
//   //
//   //         files.add(file);
//   //         setState(() {});
//   //       } catch (e) {
//   //         print("Error downloading document: $e");
//   //       }
//   //     }
//   //   }
//   // }
// }
