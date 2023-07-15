
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtgy_app/controller/signup_cubit/states.dart';
import '../../model/signup/signup.dart';
import '../../model/signup/sp_signup.dart';
import '../../services/network/dio/dio_helper.dart';
import '../../services/network/dio/endpoints.dart';




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

  File? file ;
  String? fileName;
  void pickimage()async{
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(result != null){
      file = File(result.path) ;
      emit(SPPickImageSuccess());
    }
    fileName = file!.path.split("/").last;
    print(fileName);
    emit(SPSplitImageSuccess());
}

  void SPSignup({
    required String email,
    required String password,
    required String servicename,
    required String confirmpassword,
    required String phone,
    required String address,
    required String category,

  })  async{
    emit(SPSignUpLoadingState());
    FormData Data = FormData.fromMap({
      "serviceName":servicename,
      "email":email,
      "phoneNumber":phone,
      "Address":address,
      "password":password,
      "passwordConfirm":confirmpassword,
      "category":category,
      "image":await MultipartFile.fromFile(file!.path,filename: fileName)
    });
    DioHelper.postImage(url: SPSignUp, data:Data
    ).then((value) {
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

