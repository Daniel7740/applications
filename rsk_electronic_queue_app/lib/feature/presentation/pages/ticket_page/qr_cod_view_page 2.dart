import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:rsk_electronic_queue/core/theme/app_colors.dart';
import 'package:rsk_electronic_queue/core/theme/app_text_styles.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';
import 'package:rsk_electronic_queue/l10n/gencrated/l10n.dart';
import 'package:rsk_electronic_queue/routes/routes.dart';

@RoutePage()
class QRcodViewPage extends StatefulWidget {
  const QRcodViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRcodViewPageState();
}

class _QRcodViewPageState extends State<QRcodViewPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // Чтобы заставить работать горячую перезагрузку, нам нужно приостановить камеру, и/или возобновите работу камеры
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      // если платформа это Android
      controller!.pauseCamera();
    }
    controller!.resumeCamera(); // если платформа это iOS
  }

  @override
  Widget build(BuildContext context) {
    final qrcode = L10n.of(context).qrcode;
    final useCamera = L10n.of(context).useCamera;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        // surfaceTintColor: AppColors.shadow,
        title: Text(
          qrcode,
          style: AppTextStyles.style16w600.copyWith(color: AppColors.onPrimary),
        ),
        leading: IconButton(
          icon: AppImages.arrowLeftBlack,
          onPressed: () => context.router.push(const TicketRoute()),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    Text(
                      useCamera,
                      style: AppTextStyles.style14w500
                          .copyWith(color: AppColors.onTertiary),
                    ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Container(
                  //       margin: const EdgeInsets.all(8),
                  //       child: ElevatedButton(
                  //           onPressed: () async {
                  //             await controller?.toggleFlash();
                  //             setState(() {});
                  //           },
                  //           child: FutureBuilder(
                  //             future: controller?.getFlashStatus(),
                  //             builder: (context, snapshot) {
                  //               return Text('Flash: ${snapshot.data}');
                  //             },
                  //           )),
                  //     ),
                  //     // Container(
                  //     //   margin: const EdgeInsets.all(8),
                  //     //   child: ElevatedButton(
                  //     //       onPressed: () async {
                  //     //         await controller?.flipCamera();
                  //     //         setState(() {});
                  //     //       },
                  //     //       child: FutureBuilder(
                  //     //         future: controller?.getCameraInfo(),
                  //     //         builder: (context, snapshot) {
                  //     //           if (snapshot.data != null) {
                  //     //             return Text(
                  //     //                 'Camera facing ${describeEnum(snapshot.data!)}');
                  //     //           } else {
                  //     //             return const Text('loading');
                  //     //           }
                  //     //         },
                  //     //       )),
                  //     // )
                  //   ],
                  // ),
                  // // Row(
                  // //   mainAxisAlignment: MainAxisAlignment.center,
                  // //   crossAxisAlignment: CrossAxisAlignment.center,
                  // //   children: <Widget>[
                  // //     Container(
                  // //       margin: const EdgeInsets.all(8),
                  // //       child: ElevatedButton(
                  // //         onPressed: () async {
                  // //           await controller?.pauseCamera();
                  // //         },
                  // //         child: const Text('pause',
                  // //             style: TextStyle(fontSize: 20)),
                  // //       ),
                  // //     ),
                  // //     Container(
                  // //       margin: const EdgeInsets.all(8),
                  // //       child: ElevatedButton(
                  // //         onPressed: () async {
                  // //           await controller?.resumeCamera();
                  // //         },
                  // //         child: const Text('resume',
                  // //             style: TextStyle(fontSize: 20)),
                  // //       ),
                  // //     )
                  // //   ],
                  // // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // В этом примере мы проверяем ширину или высоту устройства и соответствующим образом меняем scanArea and overlay .
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // Чтобы убедиться, что вид сканера имеет правильный размер после поворота
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
