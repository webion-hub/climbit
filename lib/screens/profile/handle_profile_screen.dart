import 'dart:io';
import 'package:climbit/widget/pickers/user_image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:climbit/models/user_model.dart';
import 'package:climbit/services/user_service.dart';
import 'package:climbit/utils/constants.dart';
import 'package:climbit/utils/utils.dart';
import 'package:climbit/widget/buttons/main_button.dart';
import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HandleProfileScreen extends StatefulWidget {
  final String uid;
  final UserModel? user;

  const HandleProfileScreen({super.key, required this.uid, this.user});

  @override
  State<HandleProfileScreen> createState() => _HandleProfileScreenState();
}

class _HandleProfileScreenState extends State<HandleProfileScreen> {
  bool isLoading = false;
  late String? imageUrl = widget.user?.photoUrl;
  final formKey = GlobalKey<FormState>();
  late final _usernameController =
      TextEditingController(text: widget.user?.username ?? '');
  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

  void pickedImage(File image) {
    setState(() {
      isLoading = true;
    });

    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('${widget.uid}${p.extension(image.path)}');

    ref.putFile(image).then((p0) {
      ref.getDownloadURL().then((value) {
        imageUrl = value.toString();
      });
    }).onError((error, stackTrace) {
      Utils.showSnackBar(
          'C\'è stato un errore nel caricamento dell\'immagine, prova di nuovo');
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  void setUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      await UserService.updateProfile(
        user: UserModel(
          username: _usernameController.text,
          email: Utils.currentEmail().trim(),
          photoUrl: imageUrl ?? Constants.userImageDefault,
          id: Utils.currentUid(),
        ),
      );
    } catch (e) {
      Utils.showSnackBar(
        'C\'è stato un errore nell\'aggiornamento del profilo, prova di nuovo'
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Modifica il profilo',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: Constants.pagePadding,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.user != null
                      ? 'Modifica informazioni utente'
                      : 'Imposta il tuo profilo',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20.0),
                UserImagePicker(
                  imagePickFn: pickedImage,
                  imagePath:
                      widget.user?.photoUrl ?? Constants.userImageDefault,
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 10.0),
                const SizedBox(height: 20.0),
                isLoading
                    ? const LoadingWheel()
                    : MainButton(
                        text: "Modifica", 
                        onPressed: setUp,
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
