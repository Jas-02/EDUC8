import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;

  late Future<void> _initializeCamera;

  @override
  void initState() {
    super.initState();
    _initializeCamera = initializeCamera();
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    cameraController = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await cameraController.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeCamera,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          } else {
            return Stack(
              children: [
                CameraPreview(cameraController),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(const Color(0xFF547CAB)),
                      ),
                      onPressed: () {
                        takePicture();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
 void takePicture() async {
  try {
    final XFile? file = await cameraController.takePicture();
    if (file != null) {
      // Save the image to the gallery
      final savedFile = await GallerySaver.saveImage(file.path);
      if (savedFile != null) {
        print('Picture saved to gallery');
      } else {
        print('Failed to save picture to gallery');
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}


  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
