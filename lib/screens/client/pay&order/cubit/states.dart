

import 'package:mtgy_app/models/change_u_pass/change_u_pass.dart';
import 'package:mtgy_app/models/login/signin.dart';
import 'package:mtgy_app/models/order_pay/pay.dart';
import 'package:mtgy_app/models/signout/signout.dart';
import 'package:mtgy_app/screens/reviews/models/paymentModal.dart';

import '../../../../models/delete/u_delete.dart';
import '../../../../models/edit_u_profile/edit_u_profile.dart';
import '../../../../models/services_models/Natural/Natural.dart';

abstract class UOrder_PayStates{}
class UOrder_PayInitalState extends UOrder_PayStates{}

class UPayLoadingState extends UOrder_PayStates{}
class UPaySuccessState extends UOrder_PayStates{
  final PayModel model;
  UPaySuccessState(this.model);

}
class UPayErrorState extends UOrder_PayStates{
  String error;
  UPayErrorState(this.error);
}

class UPayVisaState extends UOrder_PayStates{}
class UPayFawryState extends UOrder_PayStates{}
class UonCreditCardModelState extends UOrder_PayStates{}
class UImagePickerState extends UOrder_PayStates{}
class UImageGetState extends UOrder_PayStates{}