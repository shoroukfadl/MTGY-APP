import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtgy_app/controller/SP_cubit/states.dart';

import '../../../../model/change_client_password/change_u_pass.dart';
import '../../../../model/create_post/createpost.dart';
import '../../../../model/delete/u_delete.dart';
import '../../../../model/edit_u_profile/edit_u_profile.dart';
import '../../../../model/login/sp_signin.dart';
import '../../../../model/reviews/sp_reviews.dart';
import '../../../../model/signout/signout.dart';
import '../../../../model/sp_get_offers/gett_offers.dart';
import '../../../../services/network/chache_helper.dart';
import '../../../../services/network/dio/dio_helper.dart';
import '../../../../services/network/dio/endpoints.dart';
import '../../../../services/widgets/constant.dart';
import '../../view/signin/serviceprovider/serviceprovider_signin.dart';




class SPHomeCubit extends Cubit<SPHomeStates>
{
  SPHomeCubit() :super(SPHomeInitalState());
  static SPHomeCubit get(context) => BlocProvider.of(context);
  int index =0;
  SPSignInModel? dataprofile;
  GettOffersModel? dataoffer;
  DeleteAccountModel? deletemodel;
  ChangeUPasswordModel? passwordModel;
  SignOutModel? signoutModel;
  EditUserProfileModel? editModel;
  SPCreatePostModel? createpostModel;
  SPGetReviews? reviewsmodel;
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
      emit(SPSignoutSuccessState(signoutModel!));
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

  /* SPGet offers */
  void getSPOffers()
  {
    emit(SPGetOffersLoadingState());
    DioHelper.getData(url: SPGetoffers,token:token).then((value) {
      dataoffer  = GettOffersModel.fromjson(value.data);
      print(dataoffer!.status);
      emit(SPGetOffersSuccessState(dataoffer!));
    }).catchError((onError){
      emit(SPGetOffersErrorState(onError.toString()));
      print(onError);
    });
  }
  /* createoffer Account */
  File? file ;
  String? fileName;
  void pickimage()async{
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(result != null){
      file = File(result.path) ;
      emit(PickImageSuccess());
    }
    fileName = file!.path.split("/").last;
    print(fileName);
    emit(SplitImageSuccess());
  }
  void  SPCreateoffer({
    required String? title,
    required String? details,
    required String? price,

  })async{
    FormData Data = FormData.fromMap({
        'offerTitle':title,
        'PostDetails':details,
        'price':price,
        'image': await MultipartFile.fromFile(file!.path,filename: fileName)
    });
    emit(SPCreateOfferLoadingState());
    DioHelper.postImage(url: SPCreatePost, token:token ,data:Data
    ).then((value) {
      createpostModel = SPCreatePostModel.fromjson(value.data);
      print(createpostModel!.message);
      print(createpostModel!.status);
      emit(SPCreateOfferSuccessState(createpostModel!));
    }).catchError((onError){
      emit(SPCreateOfferErrorState(onError.toString()));
      print(onError);
    });
  }

  void SPGetreview(){
    emit(SPGetReviewLoadingState());
    DioHelper.getData(url: SPGetReview, token: token)
    .then((value) {
      reviewsmodel = SPGetReviews.fromjson(value.data);
      print(reviewsmodel!.status);
      print("rate : ${SP_reviews[0].rate}");
      print("coment : ${SP_reviews[0].comment}");
      print("username : ${SP_reviews[0].username}");
      print("createdat : ${SP_reviews[0].createdat}");
      print("spid : ${SP_reviews[0].SPid}");
      print("userid : ${SP_reviews[0].userid}");
      print("len : ${SP_reviews.length}");
      emit(SPGetReviewSuccessState(reviewsmodel!));
    }).catchError((onError){
    emit(SPGetReviewErrorState(onError.toString()));
    print(onError);
    });
  }
}

