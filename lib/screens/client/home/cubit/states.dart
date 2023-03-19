import 'package:mtgy_app/models/change_u_pass/change_u_pass.dart';
import 'package:mtgy_app/models/login/signin.dart';
import 'package:mtgy_app/models/signout/signout.dart';

import '../../../../models/delete/u_delete.dart';
import '../../../../models/edit_u_profile/edit_u_profile.dart';
import '../../../../models/services_models/Natural/Natural.dart';

abstract class UHomeStates{}
class UHomeInitalState extends UHomeStates{}
class UHomeLoadingState extends UHomeStates{}
class UHomeChangeScreenState extends UHomeStates{}

class UProfileoadingState extends UHomeStates{}
class UProfileSuccessState extends UHomeStates{
  final SignInModel model;
  UProfileSuccessState(this.model);

}
class UProfileErrorState extends UHomeStates{
  String error;
  UProfileErrorState(this.error);
}

class USignOutState extends UHomeStates{}
class USignOutSuccessState extends UHomeStates{
  final SignOutModel model;
  USignOutSuccessState(this.model);

}
class USignOutErrorState extends UHomeStates{
  String error;
  USignOutErrorState(this.error);
}

class UDeleteloadingState extends UHomeStates{}
class UDeleteSuccessState extends UHomeStates{
  final DeleteAccountModel model;
  UDeleteSuccessState(this.model);

}
class UDeleteErrorState extends UHomeStates{
  String error;
  UDeleteErrorState(this.error);
}

class UUpdatePasswordloadingState extends UHomeStates{}
class UUpdatePasswordSuccessState extends UHomeStates{
  final ChangeUPasswordModel model;
  UUpdatePasswordSuccessState(this.model);

}
class UUpdatePasswordErrorState extends UHomeStates{
  String error;
  UUpdatePasswordErrorState(this.error);
}

class UEditProfileoadingState extends UHomeStates{}
class UEditProfileSuccessState extends UHomeStates{
  final EditUserProfileModel model;
  UEditProfileSuccessState(this.model);

}
class UEditProfileErrorState extends UHomeStates{
  String error;
  UEditProfileErrorState(this.error);
}

class UCPWIconState extends UHomeStates{}
class UCCPWIconState extends UHomeStates{}

class getNaturalLoadingState extends UHomeStates{}
class getNaturalSuccessState extends UHomeStates{
  final getNaturalModel model;
  getNaturalSuccessState(this.model);

}
class getNaturalErrorState extends UHomeStates{
  String error;
  getNaturalErrorState(this.error);
}

