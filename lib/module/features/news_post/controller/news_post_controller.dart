import 'package:SiPandu/core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsPostController extends State<NewsPostView> {
  static late NewsPostController instance;
  late NewsPostView view;

  @override
  void initState() {
    instance = this;
    // dosave();
    getmemory();
    super.initState();
  }

  String? test;
  int? id_user;
  @override
  void dispose() => super.dispose();

  getmemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id_user = prefs.getInt('id_user');
  }

  dosave() async {
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    await NewsService().post(information: test, id: id_user);

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      headerAnimationLoop: false,
      animType: AnimType.topSlide,
      title: 'Berhasil',
      desc: 'Berhasil Menyimpan data Loading',
      btnOkOnPress: () => Get.back(),
    ).show();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
