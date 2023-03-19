import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/models/signup/sp_signup.dart';
import 'package:mtgy_app/screens/signin/cubit/states.dart';
import 'package:mtgy_app/screens/signin/screens/client/cilent_signin.dart';
import 'package:mtgy_app/screens/signup/cubit/states.dart';
import 'package:mtgy_app/shared/network/chache_helper.dart';
import 'package:mtgy_app/shared/network/dio/dio_helper.dart';
import 'package:mtgy_app/shared/network/dio/endpoints.dart';

import '../../../models/signup/signup.dart';




class MTGYAppSignUpCubit extends Cubit<MTGYSignUpAppStates>
{
  MTGYAppSignUpCubit() :super(MTGYSignUpAppInitalState());
  static MTGYAppSignUpCubit get(context) => BlocProvider.of(context);
  int index =0;
  bool USignUppasstoggle1 = true;
  bool USignUppasstoggle2 = true;
  bool SPSignUppasstoggle1 = true;
  bool SPSignUppasstoggle2 = true;
  SignUpModel? signupModel ;
  SPSignUpModel? spsignupModel ;
  String dropdownValue = list.first ;



  // U SIGN UP
  void Signinchangepasswordicon()
  {
    USignUppasstoggle1 = !USignUppasstoggle1;
      emit(UChangePwIconState());
  }

  void SigninchangeConfirmpasswordicon()
  {
    USignUppasstoggle2 = !USignUppasstoggle2;
    emit(UChangeCPwIconState());
  }

  void clientSignup({
    required String email,
    required String password,
    required String username,
    required String confirmpassword,
    required String phone
  })  {
    emit(USignUpLoadingState());
    DioHelper.postData(url: CSignUp, data: {
      "email":email ,
      "username":username,
      "phoneNumber":phone,
      "password":password,
      "passwordConfirm":confirmpassword
    }).then((value) {
      signupModel = SignUpModel.fromjson(value.data);
      print(signupModel!.message);
      print(signupModel!.data!.token);
      print(signupModel!.status);
      emit(USignUpSuccessState(signupModel!));
    }).catchError((onError){
      emit(USignUpErrorState(onError.toString()));
      print(onError);
    });
  }


  // SP SIGN UP
  void SPSignUpchangeicon()
  {
    SPSignUppasstoggle1 = !SPSignUppasstoggle1;
    emit(SPChangePwIconState());
  }

  void SPSignUpchangeCicon()
  {
    SPSignUppasstoggle2 = !SPSignUppasstoggle2;
    emit(SPChangeCPwIconState());
  }


  static final List<String> list = [
    "Hotel" ,"Restaurant & Cafe", "Bazaar", "Cinema", "Tourism Company",
    "Transport company","Village & Resort"
  ];

  void categorytype(String val){
      dropdownValue = val;
      emit(SPChangeCategoryState());
}
  void SPSignup({
    required String email,
    required String password,
    required String servicename,
    required String confirmpassword,
    required String phone,
    required String address,
    required String category,
    required String image,
  })  {
    emit(SPSignUpLoadingState());
    DioHelper.postData(url: SPSignUp, data: {
    "serviceName":servicename,
    "email":email,
    "phoneNumber":phone,
    "Address":address,
    "password":password,
    "passwordConfirm":confirmpassword,
    "category":category
    }).then((value) {
      spsignupModel = SPSignUpModel.fromjson(value.data);
      print(spsignupModel!.message);
      print(spsignupModel!.data!.token);
      print(spsignupModel!.status);
      emit(SPSignUpSuccessState(spsignupModel!));
    }).catchError((onError){
      emit(SPSignUpErrorState(onError.toString()));
      print(onError);
    });
  }



}

