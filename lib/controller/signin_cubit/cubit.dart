

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/controller/signin_cubit/states.dart';
import 'package:mtgy_app/services/network/dio/dio_helper.dart';
import 'package:mtgy_app/services/network/dio/endpoints.dart';

import '../../model/forget_pass/forget_pass_u.dart';
import '../../model/forgetpassword/code.dart';
import '../../model/login/signin.dart';
import '../../model/login/sp_signin.dart';
import '../../model/order_pay/pay.dart';
import '../../services/widgets/constant.dart';


class MTGYAppSignInCubit extends Cubit<MTGYSignInAppStates>
{
  MTGYAppSignInCubit() :super(MTGYSignInAppInitalState());
  static MTGYAppSignInCubit get(context) => BlocProvider.of(context);
  int index =0;
  bool USignInpasstoggle1 = true;
  bool USignInpasstoggle2 = true;
  bool SPSignInpasstoggle1 = true;
  bool SPSignInpasstoggle2 = true;
  bool SPForgetpasstoggle1 = true;
  bool SPForgetpasstoggle2 = true;
  bool CForgetpasstoggle1 = true;
  bool CForgetpasstoggle2 = true;
  SignInModel? signInModel ;
  SPSignInModel? SPsigninMpdel;
  ForgetUserPassModel? Uforgetpass;
  CodeVerificationModel? UcodeVerif;
  PayModel? verifymodel;
  PayModel? resetpassmodel;
  PayModel? activateaccountmodel;

  // user sign in
  void Signinchangepasswordicon()
  {
    USignInpasstoggle1 = !USignInpasstoggle1;
      emit(UChangePWIconState());
  }

  void SigninchangeConfirmpasswordicon()
  {
    USignInpasstoggle2 = !USignInpasstoggle2;
    emit(UChangeCPWIconState());
  }

  void UserSignIn({required String email,required String password})  {
    emit(USignInLoadingState());
    DioHelper.postData(url: CSignIn, data: {
      "email":email ,
      "password":password
    }).then((value) {
      signInModel = SignInModel.fromjson(value.data);
      print(signInModel!.message);
      print(signInModel!.token);
      print(signInModel!.data!.username);
    emit(USignInSuccessState(signInModel!));
    }).catchError((onError){
      emit(USignInErrorState(onError.toString()));
      print(onError);
    });
  }

  // client forgetpass
  void Uforgetchangepasswordicon()
  {
    CForgetpasstoggle1 = !CForgetpasstoggle1;
    emit(UChangePWIconState());
  }

  void UforgetchangeConfirmpasswordicon()
  {
    CForgetpasstoggle2 = !CForgetpasstoggle2;
    emit(UChangeCPWIconState());
  }

  void UforgetPassword({required String email,context})
  {
    emit(UForgetPassLoadingState());
    DioHelper.postData(url: CForgetPassword, data: {
      "email":email ,
    }).then((value) {
      Uforgetpass = ForgetUserPassModel.fromjson(value.data);
      print(Uforgetpass!.message);
      emit(UForgetPassSuccessState(Uforgetpass!));
    }).catchError((onError){
      emit(UForgetPassErrorState(onError.toString()));
      print(onError);
    });
  }


  void UVerifyCode({required String codereset})
  {
    emit(UVerifycodeLoadingState());
    DioHelper.postData(url: CVerifyResetCode, data: {
      "resetCode":codereset ,
    }).then((value) {
      UcodeVerif = CodeVerificationModel.fromjson(value.data);
      print(UcodeVerif!.status);
      emit(UVerifycodeSuccessState(UcodeVerif!));
    }).catchError((onError){
      emit(UVerifycodeErrorState(onError.toString()));
      print(onError);
    });
  }
  String? code;
  void Compeleteresetcode(String value)
  {
    code = value;
    print(code);
    emit(UCompeleteCodeState());
  }
  bool?  onEditing ;
  void editresetcode(bool value)
  {
    onEditing = value;
    emit(UeditCodeState());
  }

  void UResetPassword({required String password, required String confirmPassword})
  {
    emit(UResetPassLoadingState());
    DioHelper.putData(url: CResetPassword,token: resetPasstoken, data: {
      "new_password":password ,
      "passwordConfirm":confirmPassword,
    }).then((value) {
      resetpassmodel = PayModel.fromjson(value.data);
      print(resetpassmodel!.message);
      emit(UResetPassSuccessState(resetpassmodel!));
    }).catchError((onError){
      emit(UResetPassErrorState(onError.toString()));
      print(onError);
    });
  }


  void UActivateAccount({required String email})
  {
    emit(UActivateLoadingState());
    DioHelper.postData(url: CVerifyEmail, data: {
      "email":email ,
    }).then((value) {
      activateaccountmodel = PayModel.fromjson(value.data);
      print(activateaccountmodel!.message);
      emit(UActivateSuccessState(activateaccountmodel!));
    }).catchError((onError){
      emit(UActivateErrorState(onError.toString()));
      print(onError);
    });
  }

  // SP sign in
  void SPSinchangepassicon()
  {
    SPSignInpasstoggle1 = !SPSignInpasstoggle1;
    emit(SPChangePWIconState());
  }

  void SPSinchangeconpassicon()
  {
    SPSignInpasstoggle2 = !SPSignInpasstoggle2;
    emit(SPChangeCPWIconState());
  }

  void SPSignin({required String email,required String password})  {
    emit(SPSignInLoadingState());
    DioHelper.postData(url: SPSignIn, data: {
      "email":email ,
      "password":password
    }).then((value) {
      SPsigninMpdel = SPSignInModel.fromjson(value.data);
      print(SPsigninMpdel!.message);
      print(SPsigninMpdel!.token);
      print(SPsigninMpdel!.data!.servicename);
      emit(SPSignInSuccessState(SPsigninMpdel!));
    }).catchError((onError){
      emit(SPSignInErrorState(onError.toString()));
      print(onError);
    });
  }
  void SPforgetchangeConfirmpasswordicon()
  {
    SPForgetpasstoggle2 = !SPForgetpasstoggle2;
    emit(UChangeCPWIconState());
  } void SPforgetchangepasswordicon()
  {
    SPForgetpasstoggle1 = !SPForgetpasstoggle1;
    emit(UChangePWIconState());
  }

  void SPforgetPassword({required String email})
  {
    emit(SPForgetPassLoadingState());
    DioHelper.postData(url: SPForgetPassword, data: {
      "email":email ,
    }).then((value) {
      Uforgetpass = ForgetUserPassModel.fromjson(value.data);
      print(Uforgetpass!.message);
      emit(SPForgetPassSuccessState(Uforgetpass!));
    }).catchError((onError){
      emit(SPForgetPassErrorState(onError.toString()));
      print(onError);
    });
  }


  void SPVerifyCode({required String codereset})
  {
    emit(SPVerifycodeLoadingState());
    DioHelper.postData(url: SPVerifyResetCode, data: {
      "resetCode":codereset ,
    }).then((value) {
      UcodeVerif = CodeVerificationModel.fromjson(value.data);
      print(UcodeVerif!.status);
      emit(SPVerifycodeSuccessState(UcodeVerif!));
    }).catchError((onError){
      emit(SPVerifycodeErrorState(onError.toString()));
      print(onError);
    });
  }
  String? SPcode;
  void SPCompeleteresetcode(String value)
  {
    SPcode = value;
    print(SPcode);
    emit(SPCompeleteCodeState());
  }
  bool?  SPonEditing ;
  void SPeditresetcode(bool value)
  {
    SPonEditing = value;
    emit(SPeditCodeState());
  }

  void SPresetPassword({required String password, required String confirmPassword})
  {
    emit(SPResetPassLoadingState());
    DioHelper.putData(url: SPResetPassword,token: resetPasstoken, data: {
      "new_password":password ,
      "passwordConfirm":confirmPassword,
    }).then((value) {
      resetpassmodel = PayModel.fromjson(value.data);
      print(resetpassmodel!.message);
      emit(SPResetPassSuccessState(resetpassmodel!));
    }).catchError((onError){
      emit(SPResetPassErrorState(onError.toString()));
      print(onError);
    });
  }


  void SPActivateAccount({required String email})
  {
    emit(SPActivateLoadingState());
    DioHelper.postData(url: SPVerifyEmail, data: {
      "email":email ,
    }).then((value) {
      activateaccountmodel = PayModel.fromjson(value.data);
      print(activateaccountmodel!.message);
      emit(SPActivateSuccessState(activateaccountmodel!));
    }).catchError((onError){
      emit(SPActivateErrorState(onError.toString()));
      print(onError);
    });
  }

}

