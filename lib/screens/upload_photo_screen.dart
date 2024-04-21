import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  List<Uint8List> _images = [];
  List<File> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_selectedImages[index].path),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      _removeImage(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      height: 300.h,
                      width: double.infinity,
                      child: Image.memory(_images[index], fit: BoxFit.fitWidth),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.h,
              width: 100.w,
              child: OutlinedButton(
                onPressed: () {
                  showImagePickerOption(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF547CAB)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: BorderSide(
                          width: 1, color: Colors.black), // Set the border side
                      borderRadius:
                          BorderRadius.circular(10), // Set the border radius
                    ),
                  ),
                ),
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.blue[100],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Gallery")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camera")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromGallery() async {
    final List<XFile>? returnImages = await ImagePicker().pickMultiImage();
    if (returnImages == null) return;
    for (final XFile image in returnImages) {
      setState(() {
        _selectedImages.add(File(image.path));
        _images.add(File(image.path).readAsBytesSync());
      });
    }
    Navigator.of(context).pop(); // Close the model sheet
  }

  Future<void> _pickImageFromCamera() async {
    final XFile? returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      _selectedImages.add(File(returnImage.path));
      _images.add(File(returnImage.path).readAsBytesSync());
    });
    Navigator.of(context).pop();
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      _selectedImages.removeAt(index);
    });
  }
}
