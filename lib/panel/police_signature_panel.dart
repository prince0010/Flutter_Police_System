import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:policesystem/panel/camera_panel.dart';
import 'package:signature/signature.dart';

class PoliceSignaturePanel extends StatefulWidget {
  const PoliceSignaturePanel({Key? key}) : super(key: key);

  @override
  State<PoliceSignaturePanel> createState() => _PoliceSignaturePanelState();
}

class _PoliceSignaturePanelState extends State<PoliceSignaturePanel> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 4.0,
    exportBackgroundColor: Colors.white,
    penColor: Colors.black,
  );
  // final keySignaturePad = GlobalKey<SfSignaturePadState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signature Panel'),
      ),
      body: ListView(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Sign Signature Here:",
                style: TextStyle(fontSize: 20.0, fontFamily: 'RobotoMono'),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
            height: 460,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), // if you need this
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              elevation: 5,
              margin: EdgeInsets.only(left: 450, right: 450),
              child: Signature(
                width: 450,
                height: 400,
                backgroundColor: ui.Color.fromARGB(255, 202, 202, 202),
                controller: _controller,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 730,
              right: 730,
            ),
            child: ElevatedButton(
                onPressed: () async {
                  if (_controller.isNotEmpty) {
                    final Uint8List? data = await _controller.toPngBytes();
                    if (data != null) {
                      final base64 = base64Encode(data);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Image.memory(data),
                                actions: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text('Is this the Final Signature?'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            if (_controller != null) {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             CameraPanel()));
                                            } else {
                                              Navigator.of(context).pop(false);
                                            }
                                          },
                                          child: Text('Add'),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('No'),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                    }
                  }
                },
                child: const Expanded(
                    child: Text(
                  'Save',
                ))),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 730,
                right: 730,
              ),
              child: ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  child: const Text(
                    'Clear',
                  )),
            ),
          ),
        ],
      ),
    );
  }

  // Future onSubmit() async {
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) => Center(
  //             child: CircularProgressIndicator(),
  //           ));

  //   final image = await keySignaturePad.currentState?.toImage();
  //   var imageSignature = image!.toByteData(format: ImageByteFormat.png);

  //   final file = await PdfApi.generatePDF(
  //     imageSignature: imageSignature,
  //   );
  //   Navigator.of(context).pop();
  //   await OpenFile.open(file.path);
  // }
}
