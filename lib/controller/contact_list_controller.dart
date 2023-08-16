import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/contact_list.dart';

class ContactListController extends GetxController {
  Rx<List<ContactListModel>> contactListModel = Rx<List<ContactListModel>>([]);
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  late ContactListModel contactList;
  var itemCount = 0.obs;

  @override
  void onClose() {
    userNameController.dispose();
    mobileNoController.dispose();
  }

  @override
  void onReady() {}

  addContact(String userName, String mobileNo) {
    contactList = ContactListModel(name: userName, mobileNo: mobileNo);
    contactListModel.value.add(contactList);
    itemCount.value = contactListModel.value.length;
    userNameController.clear();
    mobileNoController.clear();
  }

  removeContact(int index){
    contactListModel.value.removeAt(index);
    itemCount.value = contactListModel.value.length;
  }
}
