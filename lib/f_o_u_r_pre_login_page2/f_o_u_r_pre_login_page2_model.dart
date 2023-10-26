import '/components/following_privilege_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'f_o_u_r_pre_login_page2_widget.dart' show FOURPreLoginPage2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FOURPreLoginPage2Model extends FlutterFlowModel<FOURPreLoginPage2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for FollowingPrivilege component.
  late FollowingPrivilegeModel followingPrivilegeModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    followingPrivilegeModel =
        createModel(context, () => FollowingPrivilegeModel());
  }

  void dispose() {
    unfocusNode.dispose();
    followingPrivilegeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
