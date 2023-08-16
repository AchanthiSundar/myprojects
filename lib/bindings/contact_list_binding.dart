import 'package:myprojects/controller/contact_list_controller.dart';
import 'package:get/get.dart';



class ContactListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactListController>(
      () => ContactListController(),
    );
  }
}
