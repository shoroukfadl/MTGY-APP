



import '../../model/forget_pass/forget_pass_u.dart';
import '../../model/forgetpassword/code.dart';
import '../../model/login/signin.dart';
import '../../model/login/sp_signin.dart';
import '../../model/order_pay/pay.dart';

abstract class MTGYSignInAppStates{}

class MTGYSignInAppInitalState extends MTGYSignInAppStates{}
class USignInLoadingState extends MTGYSignInAppStates{}
class UChangePWIconState extends MTGYSignInAppStates{}
class UChangeCPWIconState extends MTGYSignInAppStates{}
class USignInSuccessState extends MTGYSignInAppStates{
   final SignInModel model;
   USignInSuccessState(this.model);

}
class USignInErrorState extends MTGYSignInAppStates{
   String error;
   USignInErrorState(this.error);
}

class UForgetPassLoadingState extends MTGYSignInAppStates{}
class UForgetPassSuccessState extends MTGYSignInAppStates{
   final ForgetUserPassModel model;
   UForgetPassSuccessState(this.model);

}
class UForgetPassErrorState extends MTGYSignInAppStates{
   String error;
   UForgetPassErrorState(this.error);
}


class UVerify_EmailLoadingState extends MTGYSignInAppStates{}
class UVerify_EmailSuccessState extends MTGYSignInAppStates{
   final PayModel model;
   UVerify_EmailSuccessState(this.model);

}
class UVerify_EmailErrorState extends MTGYSignInAppStates{
   String error;
   UVerify_EmailErrorState(this.error);
}
class UVerifycodeLoadingState extends MTGYSignInAppStates{}
class UVerifycodeSuccessState extends MTGYSignInAppStates{
   final CodeVerificationModel model;
   UVerifycodeSuccessState(this.model);

}
class UVerifycodeErrorState extends MTGYSignInAppStates{
   String error;
   UVerifycodeErrorState(this.error);
}

class UCompeleteCodeState extends MTGYSignInAppStates{}
class UeditCodeState extends MTGYSignInAppStates{}

class UResetPassLoadingState extends MTGYSignInAppStates{}
class UResetPassSuccessState extends MTGYSignInAppStates{
   final PayModel model;
   UResetPassSuccessState(this.model);

}
class UResetPassErrorState extends MTGYSignInAppStates{
   String error;
   UResetPassErrorState(this.error);
}

class UActivateLoadingState extends MTGYSignInAppStates{}
class UActivateSuccessState extends MTGYSignInAppStates{
   final PayModel model;
   UActivateSuccessState(this.model);

}
class  UActivateErrorState extends MTGYSignInAppStates{
   String error;
   UActivateErrorState(this.error);
}

class SPSignInLoadingState extends MTGYSignInAppStates{}
class SPChangePWIconState extends MTGYSignInAppStates{}
class SPChangeCPWIconState extends MTGYSignInAppStates{}
class SPSignInSuccessState extends MTGYSignInAppStates{
   final SPSignInModel model;
   SPSignInSuccessState(this.model);

}
class SPSignInErrorState extends MTGYSignInAppStates{
   String error;
   SPSignInErrorState(this.error);
}


class SPForgetPassLoadingState extends MTGYSignInAppStates{}
class SPForgetPassSuccessState extends MTGYSignInAppStates{
   final ForgetUserPassModel model;
   SPForgetPassSuccessState(this.model);

}
class SPForgetPassErrorState extends MTGYSignInAppStates{
   String error;
   SPForgetPassErrorState(this.error);
}

class SPVerify_EmailLoadingState extends MTGYSignInAppStates{}
class SPVerify_EmailSuccessState extends MTGYSignInAppStates{
   final PayModel model;
   SPVerify_EmailSuccessState(this.model);

}
class SPVerify_EmailErrorState extends MTGYSignInAppStates{
   String error;
   SPVerify_EmailErrorState(this.error);
}
class SPVerifycodeLoadingState extends MTGYSignInAppStates{}
class SPVerifycodeSuccessState extends MTGYSignInAppStates{
   final CodeVerificationModel model;
   SPVerifycodeSuccessState(this.model);

}
class SPVerifycodeErrorState extends MTGYSignInAppStates{
   String error;
   SPVerifycodeErrorState(this.error);
}

class SPCompeleteCodeState extends MTGYSignInAppStates{}
class SPeditCodeState extends MTGYSignInAppStates{}

class SPResetPassLoadingState extends MTGYSignInAppStates{}
class SPResetPassSuccessState extends MTGYSignInAppStates{
   final PayModel model;
   SPResetPassSuccessState(this.model);

}
class SPResetPassErrorState extends MTGYSignInAppStates{
   String error;
   SPResetPassErrorState(this.error);
}

class SPActivateLoadingState extends MTGYSignInAppStates{}
class SPActivateSuccessState extends MTGYSignInAppStates{
   final PayModel model;
   SPActivateSuccessState(this.model);

}
class SPActivateErrorState extends MTGYSignInAppStates{
   String error;
   SPActivateErrorState(this.error);
}
