import 'package:mtgy_app/model/services_models/Bazaar/bazaar.dart';
import '../../model/addreview/addreview.dart';
import '../../model/change_client_password/change_u_pass.dart';
import '../../model/delete/u_delete.dart';
import '../../model/edit_u_profile/edit_u_profile.dart';
import '../../model/login/signin.dart';
import '../../model/order_pay/addtocart.dart';
import '../../model/order_pay/get_cart.dart';
import '../../model/order_pay/pay.dart';
import '../../model/reviews/c_reviews.dart';
import '../../model/services_models/ArchaeologicalSite/archaeologicalSite.dart';
import '../../model/services_models/Natural/Natural.dart';
import '../../model/services_models/TourismCompany/TourismCompany.dart';
import '../../model/services_models/TransportationCompany/transportationCompany.dart';
import '../../model/services_models/cinema/cinema.dart';
import '../../model/services_models/hotels/hotels.dart';
import '../../model/services_models/resortAndVillage/resortAndVillage.dart';
import '../../model/services_models/restaurantAndCafe/restaurantAndCafe.dart';
import '../../model/signout/signout.dart';
import '../../model/sp_for_client/sp_for_client.dart';

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

class getSPCProfLoadingState extends UHomeStates{}
class getSPCProfSuccessState extends UHomeStates{
  final GetSPproForCModel model;
  getSPCProfSuccessState(this.model);

}
class getSPCProfErrorState extends UHomeStates{
  String error;
  getSPCProfErrorState(this.error);
}

class getNaturalLoadingState extends UHomeStates{}
class getNaturalSuccessState extends UHomeStates{
  final getNaturalModel model;
  getNaturalSuccessState(this.model);

}
class getNaturalErrorState extends UHomeStates{
  String error;
  getNaturalErrorState(this.error);
}

class getreviewsLoadingState extends UHomeStates{}
class getreviewsSuccessState extends UHomeStates{
  final CReviews model;
  getreviewsSuccessState(this.model);

}
class getreviewsErrorState extends UHomeStates{
  String error;
  getreviewsErrorState(this.error);
}

class rateState extends UHomeStates{}
class commentState extends UHomeStates{}
class addreviewsLoadingState extends UHomeStates{}
class addreviewsSuccessState extends UHomeStates{
  final AddreviewModel model;
  addreviewsSuccessState(this.model);

}
class addreviewsErrorState extends UHomeStates{
  String error;
  addreviewsErrorState(this.error);
}

class gethotelSuccessState extends UHomeStates{
  final GetHotelModel model;
  gethotelSuccessState(this.model);

}
class gethotelErrorState extends UHomeStates{
  String error;
  gethotelErrorState(this.error);
}

class getCinemaSuccessState extends UHomeStates{
  final GetCinemaModel model;
  getCinemaSuccessState(this.model);

}
class getCinemaErrorState extends UHomeStates{
  String error;
  getCinemaErrorState(this.error);
}

class getBazaarSuccessState extends UHomeStates{
  final GetbazaarModel model;
  getBazaarSuccessState(this.model);

}
class getBazaarErrorState extends UHomeStates{
  String error;
  getBazaarErrorState(this.error);
}
class getResortAndVillageSuccessState extends UHomeStates{
  final GetresortModel model;
  getResortAndVillageSuccessState(this.model);

}
class getResortAndVillagelErrorState extends UHomeStates{
  String error;
  getResortAndVillagelErrorState(this.error);
}

class getTourismCompanySuccessState extends UHomeStates{
  final GettourismModel model;
  getTourismCompanySuccessState(this.model);

}
class getTourismCompanyErrorState extends UHomeStates{
  String error;
  getTourismCompanyErrorState(this.error);
}

class getArchaeologicalSiteSuccessState extends UHomeStates{
  final getagrsitesModel model;
  getArchaeologicalSiteSuccessState(this.model);

}
class getArchaeologicalSiteErrorState extends UHomeStates{
  String error;
  getArchaeologicalSiteErrorState(this.error);
}

class getRestaurantAndCafeSuccessState extends UHomeStates{
  final GetrestuModel model;
  getRestaurantAndCafeSuccessState(this.model);

}
class getRestaurantAndCafeErrorState extends UHomeStates{
  String error;
  getRestaurantAndCafeErrorState(this.error);
}

class getTransportationCompanySuccessState extends UHomeStates{
  final GettransportModel model;
  getTransportationCompanySuccessState(this.model);

}
class getTransportationCompanyErrorState extends UHomeStates{
  String error;
  getTransportationCompanyErrorState(this.error);
}



class UPayLoadingState extends UHomeStates{}
class UPaySuccessState extends UHomeStates{
  final PayModel model;
  UPaySuccessState(this.model);

}
class UPayErrorState extends UHomeStates{
  String error;
  UPayErrorState(this.error);
}

class UPayVisaState extends UHomeStates{}
class UPayFawryState extends UHomeStates{}
class UonCreditCardModelState extends UHomeStates{}
class UImagePickerState extends UHomeStates{}
class UImageGetState extends UHomeStates{}

class UGetcartLoadingState extends UHomeStates{}
class UGetcartSuccessState extends UHomeStates{
  final Ugetcart model;
  UGetcartSuccessState(this.model);

}
class UGetcartErrorState extends UHomeStates{
  String error;
  UGetcartErrorState(this.error);
}

class UaddtocartLoadingState extends UHomeStates{}
class UaddtocartSuccessState extends UHomeStates{
  final UaddtocartModel model;
  UaddtocartSuccessState(this.model);

}
class UaddtocartErrorState extends UHomeStates{
  String error;
  UaddtocartErrorState(this.error);
}
class UremovefromcartState extends UHomeStates{}
