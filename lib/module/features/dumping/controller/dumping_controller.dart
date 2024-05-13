import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hyper_ui/core.dart';
import '../view/dumping_view.dart';

class DumpingController extends State<DumpingView> {
  static late DumpingController instance;
  late DumpingView view;

  @override
  void initState() {
    instance = this;
    getProfile();
    getlocation();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List Dumping = [];

  getProfile() async {
    Dumping = await DumpingService().get();

    setState(() {});
  }

  getlocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    print(position);
  }
}
