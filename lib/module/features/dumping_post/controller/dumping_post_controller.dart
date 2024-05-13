import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hyper_ui/core.dart';
import '../view/dumping_post_view.dart';

class DumpingPostController extends State<DumpingPostView> {
  static late DumpingPostController instance;
  late DumpingPostView view;

  @override
  void initState() {
    instance = this;

    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
