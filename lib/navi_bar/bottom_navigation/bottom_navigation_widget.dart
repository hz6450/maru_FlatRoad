import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_navigation_model.dart';
export 'bottom_navigation_model.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    Key? key,
    int? selectedPageIndex,
    bool? hidden,
  })  : this.selectedPageIndex = selectedPageIndex ?? 1,
        this.hidden = hidden ?? false,
        super(key: key);

  final int selectedPageIndex;
  final bool hidden;

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late BottomNavigationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
          child: Container(
            width: 370.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 8.0),
                )
              ],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 1 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.house_outlined,
                          color: Color(0xFF323232),
                          size: 28.0,
                        ),
                        onPressed: () async {
                          context.goNamed(
                            'HomePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.map_outlined,
                          color: Color(0xFF323232),
                          size: 26.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'MapPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 4 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.add_alert_outlined,
                          color: Color(0xFF323232),
                          size: 26.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'ManuSafetyPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Opacity(
                      opacity: widget.selectedPageIndex == 5 ? 1.0 : 0.5,
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.menu,
                          color: Color(0xFF323232),
                          size: 26.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            'ManuPage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(width: 16.0))
                  .addToStart(SizedBox(width: 16.0))
                  .addToEnd(SizedBox(width: 16.0)),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.00, -1.00),
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 6.0),
                )
              ],
              shape: BoxShape.circle,
            ),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              fillColor: Color(0xFFFF9D00),
              icon: Icon(
                Icons.qr_code_scanner_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 40.0,
              ),
              onPressed: () async {
                _model.qRCodeResult = await FlutterBarcodeScanner.scanBarcode(
                  '#C62828', // scanning line color
                  'Cancel', // cancel button text
                  true, // whether to show the flash icon
                  ScanMode.BARCODE,
                );

                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
}
