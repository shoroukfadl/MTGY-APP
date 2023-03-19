
import 'package:mtgy_app/models/change_u_pass/change_u_pass.dart';
import 'package:mtgy_app/models/login/signin.dart';

import '../../../../models/delete/u_delete.dart';
import '../../../../models/edit_u_profile/edit_u_profile.dart';
import '../../../../models/forget_pass/forgot_sp_pass.dart';
import '../../../../models/login/sp_signin.dart';
import '../../../../models/signout/signout.dart';

abstract class SPHomeStates{}
class SPHomeInitalState extends SPHomeStates{}
class SPHomeLoadingState extends SPHomeStates{}
class SPHomeChangeScreenState extends SPHomeStates{}

class SPProfileoadingState extends SPHomeStates{}
class SPProfileSuccessState extends SPHomeStates{
  final SPSignInModel model;
  SPProfileSuccessState(this.model);

}
class SPProfileErrorState extends SPHomeStates{
  String error;
  SPProfileErrorState(this.error);
}

class SPDeleteloadingState extends SPHomeStates{}
class SPDeleteSuccessState extends SPHomeStates{
  final DeleteAccountModel model;
  SPDeleteSuccessState(this.model);

}
class SPDeleteErrorState extends SPHomeStates{
  String error;
  SPDeleteErrorState(this.error);
}

class SPUpdatePasswordloadingState extends SPHomeStates{}
class SPUpdatePasswordSuccessState extends SPHomeStates{
  final ChangeUPasswordModel model;
  SPUpdatePasswordSuccessState(this.model);

}
class SPUpdatePasswordErrorState extends SPHomeStates{
  String error;
  SPUpdatePasswordErrorState(this.error);
}

class SPEditProfileoadingState extends SPHomeStates{}
class SPEditProfileSSPccessState extends SPHomeStates{
  final EditUserProfileModel model;
  SPEditProfileSSPccessState(this.model);

}
class SPEditProfileErrorState extends SPHomeStates{
  String error;
  SPEditProfileErrorState(this.error);
}

class SPNPWIconState extends SPHomeStates{}
class SPNCPWIconState extends SPHomeStates{}
class SPOPWIconState extends SPHomeStates{}

class SPSignoutLoadingState extends SPHomeStates{}
class SPSignoutSuccessState extends SPHomeStates{
  final SignOutModel model;
  SPSignoutSuccessState(this.model);

}
class SPSignoutErrorState extends SPHomeStates{
  String error;
  SPSignoutErrorState(this.error);
}