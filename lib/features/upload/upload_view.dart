import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/core/functions/functions.dart';
import 'package:taskati_app/core/storage/local_storage.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/features/home/home_view.dart';
import 'package:taskati_app/widgets/custom_button.dart';

String? imagePath;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                if (imagePath != null && name.isNotEmpty) {
                  AppLocalStorage.cacheData(AppLocalStorage.IS_UPLOAD, true);
                  AppLocalStorage.cacheData(
                      AppLocalStorage.Image_Key, imagePath!);
                  AppLocalStorage.cacheData(AppLocalStorage.Name_Key, name);
                  pushWithReplacment(context, const HomeView());
                } else if (imagePath != null && name.isEmpty) {
                  showErrorwidget(context, 'Please Enter Your Name');
                } else if (imagePath == null && name.isNotEmpty) {
                  showErrorwidget(context, 'Please Enter Your Image');
                } else {
                  showErrorwidget(
                      context, 'Please Enter Your Name and Your Image');
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.primarycolor,
              backgroundImage: (imagePath != null)
                  ? FileImage(File(imagePath!)) as ImageProvider
                  : const AssetImage('assets/user (1).png'),
            ),
            const Gap(20),
            CustomButton(
              text: 'Upload from Camera',
              width: 260,
              onTap: () {
                _uploadFromCamera();
              },
            ),
            const Gap(10),
            CustomButton(
              text: 'Upload from Gallery',
              width: 260,
              onTap: () {
                _uploadFromGallery();
              },
            ),
            const Gap(10),
            const Divider(),
            const Gap(10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
                print(name);
              },
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.primarycolor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.primarycolor)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.redcolor)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.redcolor)),
              ),
            ),
          ],
        ),
      )),
    );
  }


  _uploadFromCamera() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  _uploadFromGallery() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }
}
