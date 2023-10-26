import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/navi_bar/bottom_navigation/bottom_navigation_widget.dart';
import 'manu_page_widget.dart' show ManuPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManuPageModel extends FlutterFlowModel<ManuPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BottomNavigation component.
  late BottomNavigationModel bottomNavigationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    bottomNavigationModel = createModel(context, () => BottomNavigationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    bottomNavigationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
