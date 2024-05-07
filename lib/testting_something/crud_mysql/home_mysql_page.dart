// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class HomeMysqlPage extends StatefulWidget {
//   HomeMysqlPage({super.key});

//   @override
//   State<HomeMysqlPage> createState() => _HomeMysqlPageState();
// }

// class _HomeMysqlPageState extends State<HomeMysqlPage> {
//   final TextEditingController namaController = TextEditingController();
//   final TextEditingController jobController = TextEditingController();
//   final TextEditingController namaEditController = TextEditingController();
//   final TextEditingController jobEditController = TextEditingController();

//   String id = '0';
//   String name = '-';
//   String job = '-';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 margin: const EdgeInsets.only(),
//                 child: TextFormField(
//                   // initialValue: 'John Doe',
//                   maxLength: 20,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                     labelStyle: TextStyle(
//                       color: Colors.blueGrey,
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                     // helperText: "What's your name?",
//                   ),
//                   controller: namaController,
//                   // onChanged: (value) {},
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 margin: const EdgeInsets.only(),
//                 child: TextFormField(
//                   // initialValue: 'Programmer',
//                   maxLength: 20,
//                   decoration: const InputDecoration(
//                     labelText: 'Job',
//                     labelStyle: TextStyle(
//                       color: Colors.blueGrey,
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                     // helperText: "What's your name?",
//                   ),
//                   controller: jobController,
//                   // onChanged: (value) {},
//                 ),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueGrey,
//                   ),
//                   onPressed: () async {
//                     // final nama = namaController.text;
//                     // final job = jobController.text;
//                     var response = await http.post(
//                       Uri.parse("https://reqres.in/api/users"),
//                       headers: {
//                         "Content-Type": "application/json",
//                       },
//                       body: jsonEncode({
//                         "name": namaController.text,
//                         "job": jobController.text,
//                       }),
//                     );

//                     print(response.statusCode);
//                     print(response.body);
//                     Map obj = jsonDecode(response.body);
//                     setState(() {
//                       id = obj['id'];
//                       name = obj['name'];
//                       job = obj['job'];
//                     });
//                   },
//                   child: const Text("Create"),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50.0,
//               ),
//               Text(
//                 "$id | $name | $job",
//                 style: TextStyle(
//                   fontSize: 24.0,
//                 ),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               Text(
//                 "====================",
//                 style: TextStyle(
//                   fontSize: 24.0,
//                 ),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 margin: const EdgeInsets.only(),
//                 child: TextFormField(
//                   // initialValue: 'John Doe',
//                   maxLength: 20,
//                   decoration: const InputDecoration(
//                     labelText: 'Name',
//                     labelStyle: TextStyle(
//                       color: Colors.blueGrey,
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                     // helperText: "What's your name?",
//                   ),
//                   controller: namaEditController,
//                   // onChanged: (value) {},
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 margin: const EdgeInsets.only(),
//                 child: TextFormField(
//                   // initialValue: 'Programmer',
//                   maxLength: 20,
//                   decoration: const InputDecoration(
//                     labelText: 'Job',
//                     labelStyle: TextStyle(
//                       color: Colors.blueGrey,
//                     ),
//                     enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                     // helperText: "What's your name?",
//                   ),
//                   controller: jobEditController,
//                   // onChanged: (value) {},
//                 ),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueGrey,
//                   ),
//                   onPressed: () async {
//                     // final nama = namaController.text;
//                     // final job = jobController.text;
//                     var response = await http.put(
//                       Uri.parse("https://reqres.in/api/users/$id"),
//                       headers: {
//                         "Content-Type": "application/json",
//                       },
//                       body: jsonEncode({
//                         "name": namaEditController.text,
//                         "job": jobEditController.text,
//                       }),
//                     );

//                     print(response.statusCode);
//                     print(response.body);
//                     Map obj = jsonDecode(response.body);
//                     setState(() {
//                       // id = obj['id'];
//                       name = obj['name'];
//                       job = obj['job'];
//                     });
//                   },
//                   child: const Text("Update"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_editable_table/constants.dart';
import 'package:flutter_editable_table/entities/table_entity.dart';
import 'package:flutter_editable_table/flutter_editable_table.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Editable Table',
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: child,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Editable Table'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _editableTableKey = GlobalKey<EditableTableState>();
  final data = {
    "column_count": null,
    "row_count": null,
    "addable": true,
    "removable": true,
    "caption": {
      "layout_direction": "row",
      "main_caption": {
        "title": "Caption",
        "display": true,
        "editable": false,
        "style": {
          "font_weight": "bold",
          "font_size": 18.0,
          "font_color": "#333333",
          "background_color": null,
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      "sub_caption": {
        "title": null,
        "display": true,
        "editable": true,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 64,
          "hint_text": "Please input the sub-caption",
          "fill_color": null
        },
        "constrains": {"required": true},
        "style": {
          "font_weight": "normal",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": null,
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      }
    },
    "columns": [
      {
        // "primary_key": true,
        "name": "id",
        "type": "int",
        "format": null,
        "description": null,
        "display": false,
        "editable": false,
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      // {
      //   "auto_increase": true,
      //   "type": "int",
      //   "format": "Step __VALUE__",
      //   "description": null,
      //   "display": true,
      //   "editable": false,
      //   "width_factor": 0.2,
      //   "style": {
      //     "font_weight": "bold",
      //     "font_size": 14.0,
      //     "font_color": "#333333",
      //     "background_color": "#b5cfd2",
      //     "horizontal_alignment": "center",
      //     "vertical_alignment": "center",
      //     "text_align": "center"
      //   }
      // },
      {
        "name": "category",
        "title": "Category",
        "type": "string",
        "format": null,
        "description": "User Name",
        "display": true,
        "editable": true,
        "width_factor": 0.4,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 128,
          "hint_text": "Please input the name"
        },
        "constrains": {"required": true},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
      {
        "name": "nilai",
        "title": "Nilai",
        "type": "integer",
        "format": null,
        "description": "Age",
        "display": true,
        "editable": true,
        "width_factor": 0.2,
        "input_decoration": {
          "min_lines": 1,
          "max_lines": 1,
          "max_length": 3,
          "hint_text": "Please input the age"
        },
        "constrains": {"required": true, "minimum": 1, "maximum": 120},
        "style": {
          "font_weight": "bold",
          "font_size": 14.0,
          "font_color": "#333333",
          "background_color": "#b5cfd2",
          "horizontal_alignment": "center",
          "vertical_alignment": "center",
          "text_align": "center"
        }
      },
    ],
    "rows": [
      {
        "id": 1,
        "name": "Visioner",
        "nilai": 9,
      },
      {
        "id": 2,
        "name": "Bertangng jawab",
        "nilai": 8,
      },
      {
        "id": 3,
        "name": "Kepimimpinan",
        "nilai": 3,
      },
      {
        "id": 4,
        "name": "Profuktif",
        "nilai": 3,
      },
      {
        "id": 5,
        "name": "Performance",
        "nilai": 6,
      },
    ],
    // "footer": {
    //   "layout_direction": "row",
    //   "content": [
    //     {
    //       "title": "Average Age: 22.4",
    //       "display": true,
    //       "editable": false,
    //       "style": {
    //         "font_weight": "normal",
    //         "font_size": 14.0,
    //         "font_color": "#333333",
    //         "background_color": null,
    //         "horizontal_alignment": "center",
    //         "vertical_alignment": "center",
    //         "text_align": "center"
    //       }
    //     },
    //     {
    //       "title": "Married: 3",
    //       "display": true,
    //       "editable": false,
    //       "style": {
    //         "font_weight": "normal",
    //         "font_size": 14.0,
    //         "font_color": "#333333",
    //         "background_color": null,
    //         "horizontal_alignment": "center",
    //         "vertical_alignment": "center",
    //         "text_align": "center"
    //       }
    //     },
    //     {
    //       "title": null,
    //       "display": true,
    //       "editable": true,
    //       "input_decoration": {
    //         "min_lines": 1,
    //         "max_lines": 1,
    //         "max_length": 64,
    //         "hint_text": "Please input identity",
    //         "fill_color": null
    //       },
    //       "constrains": {"required": true},
    //       "style": {
    //         "font_weight": "normal",
    //         "font_size": 14.0,
    //         "font_color": "#333333",
    //         "background_color": null,
    //         "horizontal_alignment": "center",
    //         "vertical_alignment": "center",
    //         "text_align": "center"
    //       }
    //     }
    //   ]
    // }
  };

  bool editing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.print),
          onPressed: () {
            print(_editableTableKey.currentState?.currentData);
          },
        ),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          // GestureDetector(
          //   behavior: HitTestBehavior.opaque,
          //   onTap: () {
          //     WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          //     _editableTableKey.currentState?.addRow();
          //   },
          //   child: Icon(Icons.add),
          // ),
          SizedBox(width: 8.0),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
              _editableTableKey.currentState?.readOnly = editing;
              setState(() {
                editing = !editing;
              });
              if (!editing) {
                print(
                    'table filling status: ${_editableTableKey.currentState?.currentData.isFilled}');
              }
            },
            child: Icon(!editing ? Icons.edit : Icons.check),
          ),
          SizedBox(width: 14.0),
        ],
      ),
      body: SingleChildScrollView(
        child: EditableTable(
          key: _editableTableKey,
          data: data,
          entity: TableEntity.fromJson(data),
          readOnly: true,
          tablePadding: EdgeInsets.all(8.0),
          captionBorder: Border(
            top: BorderSide(color: Color(0xFF999999)),
            left: BorderSide(color: Color(0xFF999999)),
            right: BorderSide(color: Color(0xFF999999)),
          ),
          headerBorder: Border.all(color: Color(0xFF999999)),
          rowBorder: Border.all(color: Color(0xFF999999)),
          footerBorder: Border.all(color: Color(0xFF999999)),
          removeRowIcon: Icon(
            Icons.remove_circle_outline,
            size: 24.0,
            color: Colors.redAccent,
          ),
          addRowIcon: Icon(
            Icons.add_circle_outline,
            size: 24.0,
            color: Colors.white,
          ),
          addRowIconContainerBackgroundColor: Colors.blueAccent,
          formFieldAutoValidateMode: AutovalidateMode.always,
          onRowRemoved: (row) {
            print('row removed: ${row.toString()}');
          },
          onRowAdded: () {
            print('row added');
          },
          onFilling: (FillingArea area, dynamic value) {
            print('filling: ${area.toString()}, value: ${value.toString()}');
          },
          onSubmitted: (FillingArea area, dynamic value) {
            print('submitted: ${area.toString()}, value: ${value.toString()}');
          },
        ),
      ),
    );
  }
}
