import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:donation_app/src/features/home/baseHomeActivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetup extends StatefulWidget {
  final String uid;

  const ProfileSetup(this.uid, {Key? key}) : super(key: key);

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();

  Future getImage() async {
    XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxWidth: 512, maxHeight: 512);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<bool> _uploadImageAndData() async {
    if (_image != null) {
      // Upload image to Firebase Storage
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${widget.uid}.jpg');
      UploadTask uploadTask = ref.putFile(_image!);
      TaskSnapshot downloadUrl = (await uploadTask);
      String url = await downloadUrl.ref.getDownloadURL();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .update({
        'photoURL': url,
        'displayName': _nameController.text,
      });

      await FirebaseAuth.instance.currentUser!
          .updateDisplayName(_nameController.text);
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);

      Fluttertoast.showToast(
        msg: 'Logged in as ${_nameController.text}',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF209FA6),
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Please select an image');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Setup')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: getImage,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null ? Icon(Icons.add_a_photo) : null,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _nameController,
                textAlign: TextAlign.start,
                cursorColor: const Color.fromARGB(255, 32, 159, 166),
                decoration: InputDecoration(
                  focusColor: Colors.grey[100],
                  labelText: 'Enter your name',
                  labelStyle: GoogleFonts.poppins(),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      width: 0.2,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 32, 159, 166),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF209FA6),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  onPressed: () async {
                    bool success = await _uploadImageAndData();
                    if (success) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => basehomeActivity(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('Continue',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
