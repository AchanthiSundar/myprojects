import 'package:myprojects/utils/custom_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../model/contact_list.dart';
import '../widgets/navigation_drawer_widget.dart';

class ContactListTask extends StatelessWidget {
  const ContactListTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _Dashboard(),
    );
  }
}

class _Dashboard extends StatefulWidget {
  const _Dashboard({super.key});

  @override
  State<_Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<_Dashboard> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  List<ContactListModel> contactListModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: "Enter Your Name",
                labelText: "Enter Your Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: mobileNoController,
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: "",
                hintText: "Enter Your Mobile No",
                labelText: "Enter Your Mobile No",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton.filled(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 28),
                borderRadius: BorderRadius.circular(80),
                onPressed: () {
                  setState(() {
                    if (userNameController.text.isNotEmpty) {
                      if (mobileNoController.text.length == 10) {
                        contactListModel.add(ContactListModel(
                            name: userNameController.text,
                            mobileNo: mobileNoController.text));
                        userNameController.clear();
                        mobileNoController.clear();
                        hideKeyboard();
                        print(contactListModel[0].name);
                      } else {
                        showCupertinoAlertDialog(context, "Enter The Valid Mobile No");
                      }
                    } else {
                      showCupertinoAlertDialog(context, "Enter The Name");
                    }
                  });
                },
                child: const Text("Add Contact")),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: contactListModel.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                        title: Text(contactListModel[index].name!),
                        subtitle: Text(contactListModel[index].mobileNo!),
                        trailing: const Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          hideKeyboard();
                          {
                            Navigator.of(context).push(
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: ContactUserDetails(
                                      contactListModel:
                                          contactListModel[index])),
                            );
                          }
                        }),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class ContactUserDetails extends StatefulWidget {
  final ContactListModel contactListModel;

  const ContactUserDetails({super.key, required this.contactListModel});

  @override
  State<ContactUserDetails> createState() => _ContactUserDetailsState();
}

class _ContactUserDetailsState extends State<ContactUserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.contactListModel.name.toString(),
          style: const TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(widget.contactListModel.name.toString()),
              const SizedBox(
                height: 20,
              ),
              Text(widget.contactListModel.mobileNo.toString()),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
              ),
              const Row(
                children: [
                  Text(
                    'Contact Info',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      Image.asset(
                        "images/whatsapp.png",
                        fit: BoxFit.cover,
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Whatsapp : ' +
                          widget.contactListModel.mobileNo.toString())
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Image.asset(
                        "images/telegram.png",
                        fit: BoxFit.cover,
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Telegram : ' +
                          widget.contactListModel.mobileNo.toString()),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Image.asset(
                        "images/insta.png",
                        fit: BoxFit.cover,
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Instagram : ' +
                          widget.contactListModel.mobileNo.toString()),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
