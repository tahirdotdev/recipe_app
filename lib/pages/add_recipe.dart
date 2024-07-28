import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_master/services/database.dart';
import 'package:recipe_master/widget/support_widget.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  File? selectedImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  final ImagePicker _pickImage = ImagePicker();

  @override
  void dispose() {
    nameController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  Future<void> getImage() async {
    final image = await _pickImage.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> uploadItem() async {
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        detailsController.text.isNotEmpty) {
      try {
        String addId = randomAlphaNumeric(10);

        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child("blogImage").child(addId);

        final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
        final TaskSnapshot snapshot = await task;
        final String downloadUrl = await snapshot.ref.getDownloadURL();

        Map<String, dynamic> addRecipe = {
          "Name": nameController.text,
          "Details": detailsController.text,
          "Image": downloadUrl
        };

        await DatabaseMethods().Addrecipe(addRecipe);

        // Reset fields after successful upload
        setState(() {
          nameController.clear();
          detailsController.clear();
          selectedImage = null;
        });
      } catch (e) {
        // Handle errors here
        print("Error uploading item: $e");
      }
    } else {
      // Optionally, you can display a message to the user
      print("Please provide all required fields and select an image.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Recipe",
                    style: AppWidget.headingStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            selectedImage != null
                ? GestureDetector(
                    onTap: getImage,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: getImage,
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(),
                        ),
                        child: Icon(Icons.camera_alt_outlined),
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            Text(
              "Recipe Name",
              style: AppWidget.boldfieldtextstyle(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write your recipe",
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Recipe Details",
              style: AppWidget.boldfieldtextstyle(),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: detailsController,
                maxLines: 12,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Write your recipe details",
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: uploadItem,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
