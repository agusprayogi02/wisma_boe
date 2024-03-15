part of 'page.dart';

class PrinterController {
  var defaultPrinterType = PrinterType.bluetooth;
  var isBle = false;
  var reconnect = false;
  var isConnected = false;
  var printerManager = PrinterManager.instance;
  var devices = <BluetoothPrinterModel>[];
  late final RoomModel item;

  List<int>? pendingTask;
  var ipAddress = '';
  final ipController = TextEditingController();
  final portController = TextEditingController(text: '9100');
  BluetoothPrinterModel? selectedPrinter;

  late StreamSubscription bluetoothSubscription;
  late StreamSubscription usbSubscription;

  void scan() {
    devices.clear();
    printerManager
        .discovery(type: defaultPrinterType, isBle: isBle)
        .listen((device) {
      devices.add(BluetoothPrinterModel(
        deviceName: device.name,
        address: device.address,
        isBle: isBle,
        vendorId: device.vendorId,
        productId: device.productId,
        typePrinter: defaultPrinterType,
      ));
    });
  }

  void setPort(String value) {
    if (value.isEmpty) value = '9100';
    portController.text = value;
    var device = BluetoothPrinterModel(
      deviceName: value,
      address: ipAddress,
      port: portController.text,
      typePrinter: PrinterType.network,
      state: false,
    );
    selectDevice(device);
  }

  void setIpAddress(String value) {
    ipAddress = value;
    var device = BluetoothPrinterModel(
      deviceName: value,
      address: ipAddress,
      port: portController.text,
      typePrinter: PrinterType.network,
      state: false,
    );
    selectDevice(device);
  }

  void selectDevice(BluetoothPrinterModel device) async {
    if (selectedPrinter != null) {
      if ((device.address != selectedPrinter!.address) ||
          (device.typePrinter == PrinterType.usb &&
              selectedPrinter!.vendorId != device.vendorId)) {
        await PrinterManager.instance
            .disconnect(type: selectedPrinter!.typePrinter);
      }
    }

    selectedPrinter = device;
  }

  Future printReceive() async {
    List<int> bytes = [];
    final profile = await CapabilityProfile.load();

    final generator = Generator(PaperSize.mm80, profile);
    bytes += generator.setGlobalCodeTable('CP1252');
    bytes += generator.text('Kamar ${item.wisma?.name}',
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text('No. Kamar: ${item.name}');
    bytes += generator.qrcode(item.id ?? '0',
        size: QRSize.Size8, cor: QRCorrection.H, align: PosAlign.center);
    _printEscPos(bytes, generator);
  }

  /// print ticket
  void _printEscPos(List<int> bytes, Generator generator) async {
    var connectedTCP = false;
    print('selectedPrinter: $selectedPrinter');
    if (selectedPrinter == null) return;
    var bluetoothPrinter = selectedPrinter!;

    switch (bluetoothPrinter.typePrinter) {
      case PrinterType.usb:
        bytes += generator.feed(2);
        bytes += generator.cut();
        await printerManager.connect(
            type: bluetoothPrinter.typePrinter,
            model: UsbPrinterInput(
                name: bluetoothPrinter.deviceName,
                productId: bluetoothPrinter.productId,
                vendorId: bluetoothPrinter.vendorId));
        pendingTask = null;
        break;
      case PrinterType.bluetooth:
        bytes += generator.cut();
        await printerManager.connect(
            type: bluetoothPrinter.typePrinter,
            model: BluetoothPrinterInput(
                name: bluetoothPrinter.deviceName,
                address: bluetoothPrinter.address!,
                isBle: bluetoothPrinter.isBle ?? false,
                autoConnect: reconnect));
        pendingTask = null;
        if (Platform.isAndroid) pendingTask = bytes;
        break;
      case PrinterType.network:
        bytes += generator.feed(2);
        bytes += generator.cut();
        connectedTCP = await printerManager.connect(
            type: bluetoothPrinter.typePrinter,
            model: TcpPrinterInput(ipAddress: bluetoothPrinter.address!));
        if (!connectedTCP) print(' --- please review your connection ---');
        break;
      default:
    }
    if (bluetoothPrinter.typePrinter == PrinterType.bluetooth &&
        Platform.isAndroid) {
      if (printerManager.currentStatusBT == BTStatus.connected) {
        print('printing...');
        printerManager.send(type: bluetoothPrinter.typePrinter, bytes: bytes);
        pendingTask = null;
      }
    } else {
      print('printing...');
      printerManager.send(type: bluetoothPrinter.typePrinter, bytes: bytes);
    }
  }

  // conectar dispositivo
  connectDevice() async {
    isConnected = false;
    if (selectedPrinter == null) return;
    switch (selectedPrinter!.typePrinter) {
      case PrinterType.usb:
        await printerManager.connect(
            type: selectedPrinter!.typePrinter,
            model: UsbPrinterInput(
                name: selectedPrinter!.deviceName,
                productId: selectedPrinter!.productId,
                vendorId: selectedPrinter!.vendorId));
        isConnected = true;
        break;
      case PrinterType.bluetooth:
        final data = await printerManager.connect(
            type: selectedPrinter!.typePrinter,
            model: BluetoothPrinterInput(
                name: selectedPrinter!.deviceName,
                address: selectedPrinter!.address!,
                isBle: selectedPrinter!.isBle ?? false,
                autoConnect: reconnect));
        isConnected = data;
        break;
      case PrinterType.network:
        await printerManager.connect(
            type: selectedPrinter!.typePrinter,
            model: TcpPrinterInput(ipAddress: selectedPrinter!.address!));
        isConnected = true;
        break;
      default:
    }
  }
}
