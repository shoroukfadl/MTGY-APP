import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/models/change_u_pass/change_u_pass.dart';
import 'package:mtgy_app/models/delete/u_delete.dart';
import 'package:mtgy_app/models/edit_u_profile/edit_u_profile.dart';
import 'package:mtgy_app/models/login/signin.dart';
import 'package:mtgy_app/screens/client/home/cubit/states.dart';
import 'package:mtgy_app/screens/serviceprovider/home/cubit/states.dart';
import 'package:mtgy_app/screens/signin/screens/serviceprovider/serviceprovider_signin.dart';
import 'package:mtgy_app/screens/signup/client_1.dart';
import 'package:mtgy_app/screens/signup/serviceprovider_1.dart';
import 'package:mtgy_app/shared/network/chache_helper.dart';
import 'package:mtgy_app/shared/network/dio/dio_helper.dart';
import 'package:mtgy_app/shared/network/dio/endpoints.dart';

import '../../../../models/login/sp_signin.dart';
import '../../../../models/signout/signout.dart';
import '../../../../shared/widgets/constant.dart';
import '../../../signin/screens/client/cilent_signin.dart';



class SPHomeCubit extends Cubit<SPHomeStates>
{
  SPHomeCubit() :super(SPHomeInitalState());
  static SPHomeCubit get(context) => BlocProvider.of(context);
  int index =0;
  SPSignInModel? dataprofile;
  DeleteAccountModel? deletemodel;
  ChangeUPasswordModel? passwordModel;
  SignOutModel? signoutModel;
  EditUserProfileModel? editModel;
  bool SPChangepasstoggle1 = true;
  bool SPChangepasstoggle2 = true;
  bool SPChangepasstoggle3 = true;
  //SPMain Home
  void changScreenInMainHome(selectedindex)
  {
    index = selectedindex;
    emit(SPHomeChangeScreenState());
  }
  
  // Settings 
  /* SPSignOut */
  void SPSignout(context){
    emit(SPSignoutLoadingState());
    DioHelper.getData(url: SPSignOut, token: token).then((value) {
      signoutModel = SignOutModel.fromjson(value.data);
      print(signoutModel!.message);
      print(signoutModel!.status);
      emit(SPDeleteSuccessState(deletemodel!));
      CacheHelper.removeData(key: "token").then((value){
        if(value)
        {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context)=>ServiceProviderSignIn()), (route) => false);
        }
      });
    });

  }


  
  /* SPGet Profile */
  void getSPProfile()
  {
    emit(SPProfileoadingState());
   DioHelper.getData(url: SPGetProfile,token:token).then((value) {
      dataprofile  = SPSignInModel.fromjson(value.data);
     // print(' Sign in : ${signInModel!.data!.username}');
      SPDeleteEmail = dataprofile!.data!.email;
      print(SPDeleteEmail);
     print(dataprofile!.data!.servicename);
      emit(SPProfileSuccessState(dataprofile!));
    }).catchError((onError){
      emit(SPProfileErrorState(onError.toString()));
      print(onError);
    });
  }

  /* SPEdit Profile */
  void editSPProfile({String? username,String? email , String? phone, String? address ,
    String? category})
  {
    emit(SPEditProfileoadingState());
    DioHelper.putData(
        url: SPUpdateProfile,
        token:token,
        data: {
      'email':email,
      'serviceName':username,
      'phoneNumber':phone,
      'address':address,
      'category':category
    }
       ).then((value) {
          editModel  = EditUserProfileModel.fromjson(value.data);
          print(editModel!.message);
          getSPProfile();
          emit(SPEditProfileSSPccessState(editModel!));
        }).catchError((onError){
        emit(SPEditProfileErrorState(onError.toString()));
        print(onError);
    });
  }

/* SPDelete Account */
  SPDeleteAccount({ required String Email}){
    emit(SPDeleteloadingState());
    DioHelper.deleteData(url: SPDelete ,data:
    {
      'email' :Email
    }
    ).then((value) {
      deletemodel = DeleteAccountModel.fromjson(value.data);
      print(deletemodel!.message);
      print(deletemodel!.status);
      emit(SPDeleteSuccessState(deletemodel!));
    }).catchError((onError){
      emit(SPDeleteErrorState(onError.toString()));
      print(onError);
    });


  }


  /* SPChangePassword Account */
  void  SPupdatePassword({
    required String oldpasss
    ,required String newpass,
    required String confirmnewpass,
  }){
    emit(SPUpdatePasswordloadingState());
    DioHelper.postData(url: SPUpdatePassword, token:token ,data:
    {
      "old_password":oldpasss,
      "new_password":newpass,
      "passwordConfirm":confirmnewpass
    }
    ).then((value) {
      passwordModel = ChangeUPasswordModel.fromjson(value.data);
      print(passwordModel!.message);
      print(passwordModel!.status);
      emit(SPUpdatePasswordSuccessState(passwordModel!));
    }).catchError((onError){
      emit(SPUpdatePasswordErrorState(onError.toString()));
      print(onError);
    });
  }

  void changeoldpasswordicon()
  {
    SPChangepasstoggle1 = !SPChangepasstoggle1;
    emit(SPNPWIconState());
  }
  void changenewpasswordicon()
  {
    SPChangepasstoggle2 = !SPChangepasstoggle2;
    emit(SPNCPWIconState());
  }
  void changeconpasswordicon()
  {
    SPChangepasstoggle3 = !SPChangepasstoggle3;
    emit(SPOPWIconState());
  }

}

