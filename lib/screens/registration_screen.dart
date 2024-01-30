import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  SizedBox textFieldDefaultGap = const SizedBox(
    height: 16,
  );

  bool visiablePassword = true;
  XFile? pickedXFile;

  var formKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    print("initState called");
    // calls only once
    // nameTextEditingController.text = "AppName";

    // api data fetching, runtime permission, locations, etc
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // call mutlple times
    print("didChangeDependencies called");
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  String defaultImage =
      "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png";

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Registration Screen"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              CachedNetworkImage(
                  height: 150,
                  imageUrl:
                      "https://t4.ftcdn.net/jpg/02/78/54/29/360_F_278542923_rKZvE6M5pkL457HrQPxKi9JBuvzDIDnz.jpg"),
              Text(
                "Welcome to The App, create your account enjoy the shopping",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              textFieldDefaultGap,
              Stack(
                children: [
                  pickedXFile != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(File(pickedXFile!.path)))
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              CachedNetworkImageProvider(defaultImage)),
                  // backgroundImage: pickedXFile != null
                  //     ? FileImage(File(pickedXFile.path))
                  //     : CachedNetworkImageProvider(
                  //     "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png"),

                  Positioned(
                      bottom: 0,
                      right: 8,
                      child: InkWell(
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          pickedXFile = await imagePicker.pickMedia(
                            //source: ImageSource.gallery,
                            imageQuality: 30,
                            //preferredCameraDevice: CameraDevice.front
                          );
                          if (pickedXFile != null) {
                            print("image picked: ${pickedXFile!.path}");
                            setState(() {});
                          } else {
                            print("image not picked");
                          }
                        },
                        child: const Icon(
                          Icons.photo_camera,
                          size: 32,
                        ),
                      ))
                ],
              ),

              textFieldDefaultGap,
              TextField(),
              // name field
              TextFormField(
                controller: nameTextEditingController,
                maxLength: 100,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print("value : $value");
                  formKey.currentState!.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Please enter the name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  print("Moving to next line");
                  FocusScope.of(context).nextFocus();
                },
                decoration: const InputDecoration(
                    hintText: "Enter name",
                    label: Text("Name"),
                    prefixIcon: Icon(Icons.person_outline),
                    counterText: "",
                    border: OutlineInputBorder()),
              ),
              textFieldDefaultGap,
              TextFormField(
                controller: emailTextEditingController,
                maxLength: 100,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  print("Moving to next line");
                  FocusScope.of(context).nextFocus();
                },
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value ?? "");
                  print("emailValid ${emailValid}");
                  if (value == null || value.isEmpty) {
                    return "Email addrees should not be empty";
                  } else if (!emailValid) {
                    return "Please enter valid email addrees";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    hintText: "Enter email",
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email_outlined),
                    counterText: "",
                    border: OutlineInputBorder()),
              ),
              textFieldDefaultGap,
              TextFormField(
                controller: passwordTextEditingController,
                maxLength: 100,
                obscureText: visiablePassword,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  print("Moving to next line");
                  FocusScope.of(context).unfocus();
                },
                onFieldSubmitted: (value) {
                  validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Password should be atleast 8 characters';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Enter password",
                    label: const Text("password"),
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visiablePassword = !visiablePassword;
                            print(visiablePassword);
                          });
                        },
                        child: Icon(visiablePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined)),
                    counterText: "",
                    border: const OutlineInputBorder()),
              ),
              textFieldDefaultGap,
              ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    // Navigator.of(context).push(route);
                    // Navigator.of(context).pushAndRemoveUntil(route);
                    // Navigator.of(context).pushReplacement(route);

                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (ctx) => DashboardScreen()));

                    // validation with texteditingcontroller
                    validate();
                    // validation with form widget
                    // if (pickedXFile == null) {
                    //   print("Please select Image");
                    //   Fluttertoast.showToast(msg: "Please select Image");
                    // } else if (formKey.currentState!.validate()) {
                    //   print("Processing your request");
                    //   Fluttertoast.showToast(
                    //       msg: "Accont Created successfully");
                    //   Navigator.of(context).pushAndRemoveUntil(
                    //       MaterialPageRoute(
                    //           builder: (ctx) => DashboardScreen()),
                    //       (route) => false);
                    // } else {
                    //   print("Something went wrong");
                    // }
                  },
                  child: const Text("Register")),
              TextButton(
                  onPressed: () {
                    nameTextEditingController.clear();
                    emailTextEditingController.clear();
                    passwordTextEditingController.clear();
                  },
                  child: const Text(
                    "Clear textfields",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Already have account?",
                    style: TextStyle(color: Colors.blue),
                  ))
            ]),
          ),
        ),
      ),
    );
  }

  validate() {
    String name, email, password;
    name = nameTextEditingController.text;
    email = emailTextEditingController.text;
    password = passwordTextEditingController.text;

    if (name.isEmpty) {
      Fluttertoast.showToast(msg: "Enter valid name");
    } else if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Enter valid email");
    } else if (password.isEmpty || password.length < 8) {
      Fluttertoast.showToast(msg: "Enter valid password");
    } else {
      Fluttertoast.showToast(msg: "Success");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (ctx) => DashboardScreen(
                    email: email,
                    name: name,
                  )),
          (route) => false);
    }
  }

  @override
  void didUpdateWidget(covariant RegistrationScreen oldWidget) {
    print("didUpdateWidget called");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("dispose called");
    // close all the resource
    // TODO: implement dispose
    super.dispose();
  }
}
