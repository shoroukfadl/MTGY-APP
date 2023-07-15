

import '../../../../model/change_client_password/change_u_pass.dart';
import '../../../../model/create_post/createpost.dart';
import '../../../../model/delete/u_delete.dart';
import '../../../../model/edit_u_profile/edit_u_profile.dart';
import '../../../../model/login/sp_signin.dart';
import '../../../../model/reviews/sp_reviews.dart';
import '../../../../model/signout/signout.dart';
import '../../../../model/sp_get_offers/gett_offers.dart';

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

class SPGetOffersLoadingState extends SPHomeStates{}
class SPGetOffersSuccessState extends SPHomeStates{
  final GettOffersModel model;
  SPGetOffersSuccessState(this.model);

}
class SPGetOffersErrorState extends SPHomeStates{
  String error;
  SPGetOffersErrorState(this.error);
}


class SPCreateOfferLoadingState extends SPHomeStates{}
class SPCreateOfferSuccessState extends SPHomeStates{
  final SPCreatePostModel model;
  SPCreateOfferSuccessState(this.model);
}
class SPCreateOfferErrorState extends SPHomeStates{
  String error;
  SPCreateOfferErrorState(this.error);
}
class PickImageSuccess extends SPHomeStates{}
class SplitImageSuccess extends SPHomeStates{}

class SPGetReviewLoadingState extends SPHomeStates{}
class SPGetReviewSuccessState extends SPHomeStates{
  final SPGetReviews model;
  SPGetReviewSuccessState(this.model);
}
class SPGetReviewErrorState extends SPHomeStates{
  String error;
  SPGetReviewErrorState(this.error);
}
