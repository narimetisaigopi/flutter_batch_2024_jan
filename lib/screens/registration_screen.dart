import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  SizedBox textFieldDefaultGap = const SizedBox(
    height: 16,
  );

  bool visiablePassword = false;
  @override
  void initState() {
    print("initState called");
    // calls only once

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

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Registration Screen"),
      ),
      body: Container(
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
          const Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: CachedNetworkImageProvider(
                    "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png"),
              ),
              Positioned(
                  bottom: 0,
                  right: 8,
                  child: Icon(
                    Icons.photo_camera,
                    size: 32,
                  ))
            ],
          ),
          textFieldDefaultGap,
          // name field
          TextFormField(
            maxLength: 100,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                hintText: "Enter name",
                label: Text("Name"),
                prefixIcon: Icon(Icons.person_outline),
                counterText: "",
                border: OutlineInputBorder()),
          ),
          textFieldDefaultGap,
          TextFormField(
            maxLength: 100,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                hintText: "Enter email",
                label: Text("Email"),
                prefixIcon: Icon(Icons.email_outlined),
                counterText: "",
                border: OutlineInputBorder()),
          ),
          textFieldDefaultGap,
          TextFormField(
            maxLength: 100,
            obscureText: visiablePassword,
            keyboardType: TextInputType.text,
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
          ElevatedButton(onPressed: () {}, child: const Text("Register")),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Already have account?",
                style: TextStyle(color: Colors.blue),
              ))
        ]),
      ),
    );
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
