import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isChecked = false;
  bool userUsagePolicyCheckBox = false;
  int selectedGender = 1;
  int selectedLangauge = 1;
  String? selectedBank;

  List<String> availableBanksList = ["SBI", "Axis", "BOB", "UBI", "ICICI"];
  @override
  Widget build(BuildContext context) {
    print("Width ${MediaQuery.of(context).size.width}");
    print("Height ${MediaQuery.of(context).size.height}");

    print(MediaQuery.of(context).orientation);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const Expanded(
                    flex: 20,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(
                          "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg"),
                    ),
                  ),
                  Expanded(
                    flex: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        profileCountsWidget("Posts", "0"),
                        profileCountsWidget("Following", "5"),
                        profileCountsWidget("Followers", "110"),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: ElevatedButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.person),
                        label: const Text("Follow")),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        label: const Text("Favourite")),
                  )
                ],
              ),
              const Text("Preferances"),
              Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (status) {
                        setState(() {
                          isChecked = status!;
                        });
                      }),
                  const Text("Agree Terms & Conditions")
                ],
              ),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: userUsagePolicyCheckBox,
                  title: Text("Agree with Terms & Usage Policy"),
                  subtitle: Text("I read the all documents"),
                  onChanged: (value) {
                    userUsagePolicyCheckBox = value!;
                    setState(() {});
                  }),
              Text("Gender Preferances"),
              //Radio(value: value, groupValue: groupValue, onChanged: onChanged)
              RadioListTile(
                  value: 0,
                  groupValue: selectedGender,
                  // subtitle: Text("Low Reseveration"),
                  title: const Text("Male"),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  }),
              RadioListTile(
                  value: 1,
                  groupValue: selectedGender,
                  // subtitle: Text("High Reseveration"),
                  title: const Text("Female"),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  }),
              RadioListTile(
                  value: 2,
                  groupValue: selectedGender,
                  // subtitle: Text("No Reseveration"),
                  title: const Text("Transgender"),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  }),
              Text("Language Preferances"),
              Row(
                children: [
                  Radio(
                      value: 0,
                      groupValue: selectedLangauge,
                      onChanged: (value) {
                        setState(() {
                          selectedLangauge = value!;
                        });
                      }),
                  Text("English"),
                  Radio(
                      value: 1,
                      groupValue: selectedLangauge,
                      onChanged: (value) {
                        setState(() {
                          selectedLangauge = value!;
                        });
                      }),
                  Text("Hindi")
                ],
              ),
              Text("Select Salary Account Bank"),
              DropdownButton(
                  value: selectedBank,
                  items: availableBanksList
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),

                  // items: [
                  //   DropdownMenuItem(
                  //     value: "SBI",
                  //     child: Text("SBI"),
                  //   ),
                  //   DropdownMenuItem(
                  //     value: "HDFC",
                  //     child: Text("HDFC"),
                  //   ),
                  //   DropdownMenuItem(
                  //     value: "Axis",
                  //     child: Text("Axis"),
                  //   ),
                  // ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      selectedBank = value;
                    });
                  }),
              Row(
                children: [
                  Container(
                    // width: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    color: Colors.teal,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 100,
                    color: Colors.red,
                  ),
                ],
              )
            ]),
          ),
        ),

        // body: Container(
        //   child: Column(
        //     children: [
        //       // Expanded(
        //       //     child: Container(
        //       //   color: Colors.green,
        //       //   child: Text(
        //       //     "I am child Widget",
        //       //     style: TextStyle(),
        //       //   ),
        //       // )),
        //       // Flexible(
        //       //     fit: FlexFit.tight,
        //       //     child: Container(
        //       //       color: Colors.red,
        //       //       child: Text(
        //       //         "I am child Widget, i will alots of works",
        //       //         style: TextStyle(),
        //       //       ),
        //       //     )),
        //       //Disable touch for itself and its subtree
        //       // IgnorePointer(
        //       //   ignoring: true,
        //       //   child: TextButton(
        //       //       onPressed: () {
        //       //         print("i am clciked");
        //       //       },
        //       //       child: Text("View videos(IgnorePointer)")),
        //       // ),
        //       // //Only disable touch for subtree but allows to its childerns
        //       // AbsorbPointer(
        //       //   absorbing: false,
        //       //   child: TextButton(
        //       //       onPressed: () {
        //       //         print("i am clciked");
        //       //       },
        //       //       child: Text("View videos(AbsorbPointer)")),
        //       // ),
        //       // const Placeholder(
        //       //   fallbackWidth: 100,
        //       //   fallbackHeight: 100,
        //       //   // child: Text("Comming Soon"),
        //       // )
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget profileCountsWidget(String title, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(color: Colors.grey, fontSize: 24),
        ),
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}
