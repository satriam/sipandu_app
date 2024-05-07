import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_ui/extensions/build_context_ext.dart';
import 'package:hyper_ui/testting_something/printer_bluetooth/menu_printer_button.dart';
import 'package:hyper_ui/testting_something/printer_bluetooth/menu_printer_content.dart';
import 'package:hyper_ui/testting_something/printer_bluetooth/models/product_quantity.dart';
import 'package:hyper_ui/testting_something/printer_bluetooth/models/product_response_model.dart';
import 'package:hyper_ui/testting_something/printer_bluetooth/print_dataoutputs.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class ManagePrinterPage extends StatefulWidget {
  const ManagePrinterPage({super.key});

  @override
  State<ManagePrinterPage> createState() => _ManagePrinterPageState();
}

class _ManagePrinterPageState extends State<ManagePrinterPage> {
  int selectedIndex = 0;
  // final List<PrinterModel> datas = [
  //   PrinterModel(
  //     name: 'Galaxy A30',
  //     address: 12324567412,
  //   ),
  //   PrinterModel(
  //     name: 'Galaxy A30',
  //     address: 12324567412,
  //   ),
  //   PrinterModel(
  //     name: 'Galaxy A30',
  //     address: 12324567412,
  //   ),
  // ];

  String macName = '';

  String _info = "";
  String _msj = '';
  bool connected = false;
  List<BluetoothInfo> items = [];
  final List<String> _options = [
    "permission bluetooth granted",
    "bluetooth enabled",
    "connection status",
    "update info"
  ];

  String _selectSize = "2";
  final _txtText = TextEditingController(text: "Hello developer");
  bool _progress = false;
  String _msjprogress = "";

  String optionprinttype = "58 mm";
  List<String> options = ["58 mm", "80 mm"];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    int porcentbatery = 0;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await PrintBluetoothThermal.platformVersion;
      print("patformversion: $platformVersion");
      porcentbatery = await PrintBluetoothThermal.batteryLevel;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    final bool result = await PrintBluetoothThermal.bluetoothEnabled;
    print("bluetooth enabled: $result");
    if (result) {
      _msj = "Bluetooth enabled, please search and connect";
    } else {
      _msj = "Bluetooth not enabled";
    }

    setState(() {
      _info = "$platformVersion ($porcentbatery% battery)";
    });
  }

  Future<void> getBluetoots() async {
    setState(() {
      _progress = true;
      _msjprogress = "Wait";
      items = [];
    });
    final List<BluetoothInfo> listResult =
        await PrintBluetoothThermal.pairedBluetooths;

    setState(() {
      _progress = false;
    });

    if (listResult.isEmpty) {
      _msj =
          "There are no bluetoohs linked, go to settings and link the printer";
    } else {
      _msj = "Touch an item in the list to connect";
    }

    setState(() {
      items = listResult;
    });
  }

  Future<void> connect(String mac) async {
    setState(() {
      _progress = true;
      _msjprogress = "Connecting...";
      connected = false;
    });
    final bool result =
        await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    print("state conected $result");
    if (result) connected = true;
    setState(() {
      _progress = false;
    });
  }

  Future<void> disconnect() async {
    final bool status = await PrintBluetoothThermal.disconnect;
    setState(() {
      connected = false;
    });
    print("status disconnect $status");
  }

  // Future<void> printTest() async {
  //   bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
  //   //print("connection status: $conexionStatus");
  //   if (conexionStatus) {
  //     List<int> ticket = await testTicket();
  //     final result = await PrintBluetoothThermal.writeBytes(ticket);
  //     print("print test result:  $result");
  //   } else {
  //     //no conectado, reconecte
  //   }
  // }

  // // Future<List<int>> testTicket() async {
  // //   List<int> bytes = [];
  // //   // Using default profile
  // //   final profile = await CapabilityProfile.load();
  // //   final generator = Generator(
  // //       optionprinttype == "58 mm" ? PaperSize.mm58 : PaperSize.mm80, profile);
  // //   //bytes += generator.setGlobalFont(PosFontType.fontA);
  // //   bytes += generator.reset();

  // //   bytes +=
  // //       generator.text('Code with Bahri', styles: const PosStyles(bold: true));
  // //   bytes +=
  // //       generator.text('Reverse text', styles: const PosStyles(reverse: true));
  // //   bytes += generator.text('Underlined text',
  // //       styles: const PosStyles(underline: true), linesAfter: 1);
  // //   bytes += generator.text('Align left',
  // //       styles: const PosStyles(align: PosAlign.left));
  // //   bytes += generator.text('Align center',
  // //       styles: const PosStyles(align: PosAlign.center));
  // //   bytes += generator.text('Align right',
  // //       styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

  // //   bytes += generator.text(
  // //     'FIC Batch 11',
  // //     styles: const PosStyles(
  // //       height: PosTextSize.size2,
  // //       width: PosTextSize.size2,
  // //     ),
  // //   );

  // //   bytes += generator.feed(2);
  // //   //bytes += generator.cut();
  // //   return bytes;
  // // }

  // // Future<void> printWithoutPackage() async {
  // //   //impresion sin paquete solo de PrintBluetoothTermal
  // //   bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
  // //   if (connectionStatus) {
  // //     String text = "${_txtText.text}\n";
  // //     bool result = await PrintBluetoothThermal.writeString(
  // //         printText: PrintTextSize(size: int.parse(_selectSize), text: text));
  // //     print("status print result: $result");
  // //     setState(() {
  // //       _msj = "printed status: $result";
  // //     });
  // //   } else {
  // //     //no conectado, reconecte
  // //     setState(() {
  // //       _msj = "no connected device";
  // //     });
  // //     print("no conectado");
  // //   }
  // // }

  // Future<void> printString() async {
  //   bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
  //   if (conexionStatus) {
  //     String enter = '\n';
  //     await PrintBluetoothThermal.writeBytes(enter.codeUnits);
  //     //size of 1-5
  //     String text = "Hello";
  //     await PrintBluetoothThermal.writeString(
  //         printText: PrintTextSize(size: 1, text: text));
  //     await PrintBluetoothThermal.writeString(
  //         printText: PrintTextSize(size: 2, text: "$text size 2"));
  //     await PrintBluetoothThermal.writeString(
  //         printText: PrintTextSize(size: 3, text: "$text size 3"));
  //   } else {
  //     //desconectado
  //     print("desconectado bluetooth $conexionStatus");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelola Printer'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print),
        onPressed: () async {
          List<ProductQuantity> products = [
            ProductQuantity(
              product: Product(
                id: 1,
                categoryId: 1,
                name: 'Nasi Goreng',
                description:
                    'Nasi goreng spesial dengan telur, ayam, dan bumbu rempah',
                image: 'https://example.com/nasi_goreng.jpg',
                price: '15000',
                stock: 50,
                status: 1,
                isFavorite: 1,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                category: Category(
                  id: 1,
                  name: 'Makanan',
                  description: 'Makanan Enak',
                  image: 'https://example.com/food.jpg',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              ),
              quantity: 10,
            ),
            ProductQuantity(
              product: Product(
                id: 2,
                categoryId: 1,
                name: 'Sate Ayam',
                description:
                    'Sate ayam lezat dengan bumbu kacang khas Indonesia',
                image: 'https://example.com/sate_ayam.jpg',
                price: '20000',
                stock: 30,
                status: 1,
                isFavorite: 1,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                category: Category(
                  id: 1,
                  name: 'Makanan',
                  description: 'Makanan Enak',
                  image: 'https://example.com/food.jpg',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              ),
              quantity: 8,
            ),
            ProductQuantity(
              product: Product(
                id: 3,
                categoryId: 2,
                name: 'Es Teh Manis',
                description: 'Minuman es teh manis segar dengan es batu',
                image: 'https://example.com/es_teh.jpg',
                price: '8000',
                stock: 40,
                status: 1,
                isFavorite: 1,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                category: Category(
                  id: 2,
                  name: 'Minuman',
                  description: 'Minuman Dingin',
                  image: 'https://example.com/drink.jpg',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              ),
              quantity: 15,
            ),
            ProductQuantity(
              product: Product(
                id: 4,
                categoryId: 2,
                name: 'Jus Alpukat',
                description: 'Jus alpukat segar tanpa pemanis tambahan',
                image: 'https://example.com/jus_alpukat.jpg',
                price: '12000',
                stock: 20,
                status: 1,
                isFavorite: 1,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                category: Category(
                  id: 2,
                  name: 'Minuman',
                  description: 'Minuman Dingin',
                  image: 'https://example.com/drink.jpg',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              ),
              quantity: 5,
            ),
            ProductQuantity(
              product: Product(
                id: 5,
                categoryId: 1,
                name: 'Bakso Spesial',
                description: 'Bakso dengan kuah kental dan daging sapi pilihan',
                image: 'https://example.com/bakso.jpg',
                price: '18000',
                stock: 25,
                status: 1,
                isFavorite: 1,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
                category: Category(
                  id: 1,
                  name: 'Makanan',
                  description: 'Makanan Enak',
                  image: 'https://example.com/food.jpg',
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ),
              ),
              quantity: 12,
            ),
          ];
          int totalQuantity = products
              .map((product) => product.quantity)
              .reduce((a, b) => a + b);
          int totalPrice = products
              .map((product) =>
                  int.parse(product.product.price!) * product.quantity)
              .reduce((a, b) => a + b);
          double discountPercentage = 0.20;
          int discountPer = 20;
          int discount = (totalPrice * discountPercentage).toInt();
          int subTotal = totalPrice - discount;
          double taxPercentage = 0.11;

          int tax = (subTotal * taxPercentage).toInt();
          int finalTotalPrice = subTotal + tax;
          int nominalBayar = 800000;
          int refund = nominalBayar - finalTotalPrice;
          final printValue = await PrintDataoutputs.instance.printOrder(
              products,
              totalQuantity,
              finalTotalPrice,
              'Tunai',
              nominalBayar,
              'Fahiem',
              discount,
              discountPer,
              tax,
              subTotal,
              subTotal + discount,
              refund);
          await PrintBluetoothThermal.writeBytes(printValue);
        },
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Container(
            width: context.deviceWidth / 2,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MenuPrinterButton(
                  label: 'Search',
                  onPressed: () {
                    getBluetoots();
                    selectedIndex = 0;
                    setState(() {});
                  },
                  isActive: selectedIndex == 0,
                ),
                MenuPrinterButton(
                  label: 'Disconnect',
                  onPressed: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                  isActive: selectedIndex == 1,
                ),
                MenuPrinterButton(
                  label: 'Test',
                  onPressed: () {
                    selectedIndex = 2;
                    setState(() {});
                  },
                  isActive: selectedIndex == 2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 34.0,
          ),
          _Body(
            // selectedIndex: selectedIndex,
            macName: macName,
            datas: items,
            clickHandler: (mac) async {
              macName = mac;
              await connect(mac);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  // final int selectedIndex;
  final String macName;
  final List<BluetoothInfo> datas;

  //clickHandler
  final Function(String) clickHandler;

  const _Body({
    Key? key,
    required this.macName,
    required this.datas,
    required this.clickHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (datas.isEmpty) {
      return const Text('No data available');
    } else {
      return Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: datas.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 16.0,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              clickHandler(datas[index].macAdress);
            },
            child: MenuPrinterContent(
              isSelected: macName == datas[index].macAdress,
              data: datas[index],
            ),
          ),
        ),
      );
    }
    // return const Placeholder();
  }
}
