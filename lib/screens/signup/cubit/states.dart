import 'package:mtgy_app/models/signup/sp_signup.dart';

import '../../../models/signup/signup.dart';

abstract class MTGYSignUpAppStates{}
class MTGYSignUpAppInitalState extends MTGYSignUpAppStates{}
class USignUpLoadingState extends MTGYSignUpAppStates{}
class UChangePwIconState extends MTGYSignUpAppStates{}
class UChangeCPwIconState extends MTGYSignUpAppStates{}
class USignUpSuccessState extends MTGYSignUpAppStates{
   final SignUpModel model;
   USignUpSuccessState(this.model);

}
class USignUpErrorState extends MTGYSignUpAppStates{
   String error;
   USignUpErrorState(this.error);
}

class SPSignUpLoadingState extends MTGYSignUpAppStates{}
class SPChangePwIconState extends MTGYSignUpAppStates{}
class SPChangeCPwIconState extends MTGYSignUpAppStates{}
class SPChangeCategoryState extends MTGYSignUpAppStates{}
class SPSignUpSuccessState extends MTGYSignUpAppStates{
   final SPSignUpModel model;
   SPSignUpSuccessState(this.model);

}
class SPSignUpErrorState extends MTGYSignUpAppStates{
   String error;
   SPSignUpErrorState(this.error);
}
