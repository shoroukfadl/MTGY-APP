import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/models/change_u_pass/change_u_pass.dart';
import 'package:mtgy_app/models/delete/u_delete.dart';
import 'package:mtgy_app/models/edit_u_profile/edit_u_profile.dart';
import 'package:mtgy_app/models/login/signin.dart';
import 'package:mtgy_app/models/signout/signout.dart';
import 'package:mtgy_app/screens/client/home/cubit/states.dart';
import 'package:mtgy_app/screens/signup/client_1.dart';
import 'package:mtgy_app/shared/network/chache_helper.dart';
import 'package:mtgy_app/shared/network/dio/dio_helper.dart';
import 'package:mtgy_app/shared/network/dio/endpoints.dart';

import '../../../../models/services_models/Natural/Natural.dart';
import '../../../../shared/widgets/constant.dart';
import '../../../signin/screens/client/cilent_signin.dart';
import '../../../signin/screens/serviceprovider/serviceprovider_signin.dart';



class UHomeCubit extends Cubit<UHomeStates>
{
  UHomeCubit() :super(UHomeInitalState());
  static UHomeCubit get(context) => BlocProvider.of(context);
  int index =0;
  SignInModel? dataprofile;
  DeleteAccountModel? deletemodel;
  ChangeUPasswordModel? passwordModel;
  EditUserProfileModel? editModel;
  SignOutModel? signoutModel;
  getNaturalModel? naturalmodel;
  bool UChangepasstoggle1 = true;
  bool UChangepasstoggle2 = true;
  bool UChangepasstoggle3 = true;
  //UMain Home
  void changScreenInMainHome(selectedindex)
  {
    index = selectedindex;
    emit(UHomeChangeScreenState());
  }
  
  // Settings 
  /* USignOut */
  void userSignout(context){
    emit(USignOutState());
    DioHelper.getData(url: CSignOut, token: token).then((value) {
      signoutModel = SignOutModel.fromjson(value.data);
      print(signoutModel!.message);
      print(signoutModel!.status);
      emit(USignOutSuccessState(signoutModel!));
      CacheHelper.removeData(key: "token").then((value){
        if(value)
        {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context)=>ClientSignIn2()), (route) => false);
        }
      });
    });

  }

  /* UDelete Account */
  void  UDeleteAccount({required String Email,context}){
    emit(UDeleteloadingState());
    DioHelper.deleteData(url: CDeleteAccount ,data:
        {
         'email' :Email
        }
    ).then((value) {
      deletemodel = DeleteAccountModel.fromjson(value.data);
      print(deletemodel!.message);
      print(deletemodel!.status);
      emit(UDeleteSuccessState(deletemodel!));
    }).then((value) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context)=>ClintSignUp()), (route) => false
      );
    }).catchError((onError){
      emit(UDeleteErrorState(onError.toString()));
      print(onError);
    });


  }
  
  /* UGet Profile */
  void getClientProfile()
  {
    emit(UProfileoadingState());
   DioHelper.getData(url: CProfile,token:token).then((value) {
      dataprofile  = SignInModel.fromjson(value.data);
     // print(' Sign in : ${signInModel!.data!.username}');
     print(dataprofile!.data!.username);
      emit(UProfileSuccessState(dataprofile!));
    }).catchError((onError){
      emit(UProfileErrorState(onError.toString()));
      print(onError);
    });
  }

  /* UEdit Profile */
  void editClientProfile({String? username,String? email , String? phone})
  {
    emit(UEditProfileoadingState());
    DioHelper.putData(
        url: CUpdateProfile,
        token:token,
        data: {
      'email':email,
      'username':username,
      'phoneNumber':phone
    }
       ).then((value) {
          editModel  = EditUserProfileModel.fromjson(value.data);
          print(editModel!.message);
          emit(UEditProfileSuccessState(editModel!));
        }).catchError((onError){
        emit(UEditProfileErrorState(onError.toString()));
        print(onError);
    });
  }

  /* UChangePassword Account */
  void  UUpdatePassword({
    required String oldpasss
    ,required String newpass,
    required String confirmnewpass,
  }){
    emit(UUpdatePasswordloadingState());
    DioHelper.postData(url: CUpdatePassword, token:token ,data:
    {
      "old_password":oldpasss,
      "new_password":newpass,
      "passwordConfirm":confirmnewpass
    }
    ).then((value) {
      passwordModel = ChangeUPasswordModel.fromjson(value.data);
      print(passwordModel!.message);
      print(passwordModel!.status);
      emit(UUpdatePasswordSuccessState(passwordModel!));
    }).catchError((onError){
      emit(UUpdatePasswordErrorState(onError.toString()));
      print(onError);
    });
  }

  void changeoldpasswordicon()
  {
    UChangepasstoggle1 = !UChangepasstoggle1;
    emit(UCPWIconState());
  }
  void changenewpasswordicon()
  {
    UChangepasstoggle2 = !UChangepasstoggle2;
    emit(UCCPWIconState());
  }
  void changeconpasswordicon()
  {
    UChangepasstoggle3 = !UChangepasstoggle3;
    emit(UCCPWIconState());
  }

  // Services

  // Get services
  void  GetNaturalData(){
    DioHelper.getData(url: Natural,token: token).then((value) {
      naturalmodel = getNaturalModel.fromjson(value.data);
      print(naturalmodel!.status);
      emit(getNaturalSuccessState(naturalmodel!));
    }).catchError((onError){
      emit(getNaturalErrorState(onError.toString()));
      print(onError);
    });
  }


}

