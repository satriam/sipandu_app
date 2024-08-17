import 'dart:io';
import 'package:SiPandu/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class QImagePicker extends StatefulWidget {
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final Function(String) onChanged;
  final String? provider;

  QImagePicker({
    Key? key,
    required this.label,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    required this.onChanged,
    this.obscure = false,
    this.provider = "cloudinary",
  }) : super(key: key);

  @override
  State<QImagePicker> createState() => _QImagePickerState();
}

class _QImagePickerState extends State<QImagePicker> {
  String? imageUrl;
  bool loading = false;
  late TextEditingController controller;

  @override
  void initState() {
    imageUrl = widget.value;
    controller = TextEditingController(
      text: widget.value ?? "-",
    );
    super.initState();
  }

  Future<String?> getFileAndroidIosAndWeb({bool fromCamera = false}) async {
    XFile? image = await ImagePicker().pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1920,
    );
    String? filePath = image?.path;
    if (filePath == null) return null;

    // Fix image rotation
    if (Platform.isAndroid || Platform.isIOS) {
      File rotatedFile =
          await FlutterExifRotation.rotateAndSaveImage(path: filePath);
      filePath = rotatedFile.path;
    }

    return filePath;
  }

  Future<String?> uploadFile(String filePath) async {
    return await uploadToAPI(filePath);
  }

  Future<String> uploadToAPI(String filePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final formData = FormData.fromMap({
      'files': await MultipartFile.fromFile(filePath),
    });

    var res = await Dio().post(
      '${ApiUrl.baseUrl}/api/upload',
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: formData,
    );

    var data = res.data;
    var realurl = data[0]["url"];
    var url = '${ApiUrl.baseUrl}$realurl';

    widget.onChanged(url);
    return url;
  }

  Future<String?> getFileMultiplePlatform() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        "png",
        "jpg",
      ],
      allowMultiple: false,
    );
    if (result == null) return null;
    return result.files.first.path;
  }

  browsePhoto({bool fromCamera = false}) async {
    if (loading) return;

    String? filePath;
    loading = true;
    setState(() {});

    if (!kIsWeb && Platform.isWindows) {
      filePath = await getFileMultiplePlatform();
    } else {
      filePath = await getFileAndroidIosAndWeb(fromCamera: fromCamera);
    }

    if (filePath == null) {
      loading = false; // Reset loading state if no file was selected
      setState(() {});
      return;
    }

    imageUrl = await uploadFile(filePath);

    loading = false;

    if (imageUrl != null) {
      widget.onChanged(imageUrl!);
      controller.text = imageUrl!;
    }
    setState(() {});
  }

  String? get currentValue {
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 96.0,
            width: 96.0,
            margin: EdgeInsets.only(
              top: 8.0,
            ),
            decoration: BoxDecoration(
              color: loading ? Colors.blueGrey[900] : null,
              image: loading
                  ? null
                  : DecorationImage(
                      image: NetworkImage(
                        imageUrl == null
                            ? "${AppConfig.imageUrlNotFound}"
                            : imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
            child: Visibility(
              visible: loading == true,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Uploading...",
                      style: TextStyle(
                        fontSize: 9.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: FormField(
                initialValue: false,
                validator: (value) {
                  return widget.validator?.call(imageUrl);
                },
                enabled: true,
                builder: (FormFieldState<bool> field) {
                  return TextFormField(
                    controller: controller,
                    obscureText: widget.obscure,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: widget.label,
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: Transform.scale(
                        scale: 0.8,
                        child: SizedBox(
                          width: 160.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () => browsePhoto(),
                                child: Text(
                                  "Browse",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () => browsePhoto(fromCamera: true),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      helperText: widget.helper,
                      hintText: widget.hint,
                      errorText: field.errorText,
                    ),
                    onChanged: (value) {
                      widget.onChanged(value);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
