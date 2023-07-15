import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtgy_app/controller/client_home_cubit/states.dart';
import 'package:mtgy_app/model/order_pay/pay.dart';
import '../../model/addreview/addreview.dart';
import '../../model/change_client_password/change_u_pass.dart';
import '../../model/delete/u_delete.dart';
import '../../model/edit_u_profile/edit_u_profile.dart';
import '../../model/login/signin.dart';
import '../../model/order_pay/addtocart.dart';
import '../../model/order_pay/get_cart.dart';
import '../../model/reviews/c_reviews.dart';
import '../../model/search/seach.dart';
import '../../model/services_models/ArchaeologicalSite/archaeologicalSite.dart';
import '../../model/services_models/Bazaar/bazaar.dart';
import '../../model/services_models/Natural/Natural.dart';
import '../../model/services_models/TourismCompany/TourismCompany.dart';
import '../../model/services_models/TransportationCompany/transportationCompany.dart';
import '../../model/services_models/cinema/cinema.dart';
import '../../model/services_models/hotels/hotels.dart';
import '../../model/services_models/resortAndVillage/resortAndVillage.dart';
import '../../model/services_models/restaurantAndCafe/restaurantAndCafe.dart';
import '../../model/signout/signout.dart';
import '../../model/sp_for_client/sp_for_client.dart';
import '../../services/network/chache_helper.dart';
import '../../services/network/dio/dio_helper.dart';
import '../../services/network/dio/endpoints.dart';
import '../../services/widgets/constant.dart';
import '../../view/signin/client/cilent_signin.dart';
import '../../view/signup/client_1.dart';



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
  getagrsitesModel? agrmodel;
  GetHotelModel? hotelmodel;
  GetCinemaModel? cinamamodel;
  GetbazaarModel? bazarsmodel;
  GetresortModel? resortmodel;
  GetrestuModel? getrestmodel;
  GettourismModel? tourismmodel;
  GettransportModel? transportModel;
  // GetHotelModel? cinamamodel;
  // GetHotelModel? hotelmodel;
  // GetHotelModel? cinamamodel;
  USearchModel? searchmodel;
  GetSPproForCModel? spprofilemodel;
  CReviews? reviewsmodel;
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
          getClientProfile();
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
      print(Natural_list[0].serviceName);

      emit(getNaturalSuccessState(naturalmodel!));
    }).catchError((onError){
      emit(getNaturalErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetAgrData(){
    DioHelper.getData(url: archaeologicalSite,token: token).then((value) {
      agrmodel = getagrsitesModel.fromjson(value.data);
      print(agrmodel!.status);
      print(agr_list[0].serviceName);

      emit(getArchaeologicalSiteSuccessState(agrmodel!));
    }).catchError((onError){
      emit(getArchaeologicalSiteErrorState(onError.toString()));
      print(onError);
    });
  }

  // hotels
  void  GetHotelData(){
    DioHelper.getData(url: hotel,token: token).then((value) {
      hotelmodel = GetHotelModel.fromjson(value.data);
      print(naturalmodel!.status);
      print(hotel_list[0].serviceName);
      print(hotel_list[5].spid);
      emit(gethotelSuccessState(hotelmodel!));
    }).catchError((onError){
      emit(gethotelErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetCinemaData(){
    DioHelper.getData(url: cinema,token: token).then((value) {
      cinamamodel = GetCinemaModel.fromjson(value.data);
      print(cinamamodel!.status);
      print(cinama_list[0].serviceName);
      emit(getCinemaSuccessState(cinamamodel!));
    }).catchError((onError){
      emit(getCinemaErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetBazaarData(){
    DioHelper.getData(url: restaurantAndCafe,token: token).then((value) {
      getrestmodel = GetrestuModel.fromjson(value.data);
      print(getrestmodel!.status);
      print(cafe_list[0].serviceName);
      emit(getRestaurantAndCafeSuccessState(getrestmodel!));
    }).catchError((onError){
      emit(getRestaurantAndCafeErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetResortAndVillageData(){
    DioHelper.getData(url: resortAndVillage,token: token).then((value) {
      resortmodel = GetresortModel.fromjson(value.data);
      print(resortmodel!.status);
      print(resort_list[0].serviceName);

      emit(getResortAndVillageSuccessState(resortmodel!));
    }).catchError((onError){
      emit(getResortAndVillagelErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetTourismCompanyData(){
    DioHelper.getData(url: tourismCompany,token: token).then((value) {
      tourismmodel = GettourismModel.fromjson(value.data);
      print(tourismmodel!.status);
      print(tourismcomp_list[0].serviceName);

      emit(getTourismCompanySuccessState(tourismmodel!));
    }).catchError((onError){
      emit(getTourismCompanyErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetRestaurantAndCafeData(){
    DioHelper.getData(url: restaurantAndCafe,token: token).then((value) {
      getrestmodel = GetrestuModel.fromjson(value.data);
      print(getrestmodel!.status);
      print(cafe_list[0].serviceName);

      emit(getRestaurantAndCafeSuccessState(getrestmodel!));
    }).catchError((onError){
      emit(gethotelErrorState(onError.toString()));
      print(onError);
    });
  }

  void  GetTransportationCompanyData(){
    DioHelper.getData(url: transportationCompany,token: token).then((value) {
      transportModel = GettransportModel.fromjson(value.data);
      print(transportModel!.status);
      print(Transportation_list[0].serviceName);

      emit(getTransportationCompanySuccessState(transportModel!));
    }).catchError((onError){
      emit(getTransportationCompanyErrorState(onError.toString()));
      print(onError);
    });
  }


  void  GetSPProfileForClient({
   required String id
}){
    emit(getSPCProfLoadingState());
        DioHelper.getData(url: "${SPprofForClient}/$id").then((value) {
          spprofilemodel = GetSPproForCModel.fromjson(value.data);
          print(spprofilemodel!.status);
          print(spprofilemodel!.data!.serviceName);
          print(spprofilemodel!.data!.cat);
          print(spprofilemodel!.data!.id);
          print(spprofilemodel!.data!.email);
          print(spprofilemodel!.data!.address);
          print(spprofilemodel!.data!.phoneNumber);
          emit(getSPCProfSuccessState(spprofilemodel!));
        }).catchError((onError){
          emit(getSPCProfErrorState(onError.toString()));
          print(onError);
        });
  }

  void UGetreview({
    required String id}

      ){
    emit(getreviewsLoadingState());
    DioHelper.getData(url: "${CGetReview}/$id", token: token)
        .then((value) {
       reviewsmodel = CReviews.fromjson(value.data);
      print(reviewsmodel!.status);
      print("rate : ${C_reviews[0].rate}");
      print("coment : ${C_reviews[0].comment}");
      print("username : ${C_reviews[0].username}");
      print("createdat : ${C_reviews[0].createdat}");
      print("spid : ${C_reviews[0].SPid}");
      print("userid : ${C_reviews[0].userid}");
      print("len : ${C_reviews.length}");
      emit(getreviewsSuccessState(reviewsmodel!));
    }).catchError((onError){
      emit(getreviewsErrorState(onError.toString()));
      print(onError);
    });
  }

  void Uaddreview({
    required String id,
    required int rate,
    required String comment,
  }

      ){
    emit(addreviewsLoadingState());
    DioHelper.postData(url: CaddReview, token: token,data: {
      "rate":rate,
      "comment":comment ,
      "sp_id":id
    })
        .then((value) {
      var addreviewsmodel = AddreviewModel.fromjson(value.data);
      print(addreviewsmodel.status);
      emit(addreviewsSuccessState(addreviewsmodel));
    }).catchError((onError){
      emit(addreviewsErrorState(onError.toString()));
      print(onError);
    });
  }
  double rating = 0;
  void rate(double rate){
      rating = rate;
      emit(rateState());

  }
  final commentcontroller= TextEditingController();
  void comment (String Comment ){

      commentcontroller.text = Comment;
      emit(commentState());

  }
  // payment and cart part

  PayModel? pay_model;
  bool isCreditCardExpanded = true;
  bool isFawryExpanded = false;
  Ugetcart? getcartmodel;
  UaddtocartModel? addtocartmodel;

  void VisaCard( bool isExpanded){
    isCreditCardExpanded = !isExpanded;
    isFawryExpanded = false;
    emit(UPayVisaState());
  }
  void Fawry( bool isExpanded){
    isFawryExpanded = !isExpanded;
    isCreditCardExpanded = false;
    emit(UPayFawryState());
  }


  String cardNumber = '';
  String expiryDate= '';
  String nameoncard = '';
  String cvvCode= '';
  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel){

    cardNumber = creditCardModel.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    nameoncard = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;
    emit(UonCreditCardModelState());
  }

  // image
  File? file;
  String? imagename;
  void PickerCamara()async{
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    file = File(myfile!.path);
    emit(UImagePickerState());
    imagename = file!.path.split("/").last;
    print(imagename);
    emit(UImageGetState());
  }

  Dio? d = Dio();
  void  UPay()async{
    emit(UPayLoadingState());
    FormData fromData = new FormData.fromMap({
      'image':await MultipartFile.fromFile(file!.path,filename:imagename )
    });
    // try {
    //   Response respose = await d!.post(
    //       "https://api-mtgy.onrender.com/$CPay"
    //       , data: fromData, options: Options(
    //       headers: {
    //         'Content-Type': 'multipart/form-data',
    //         "accept": "application/json",
    //       })
    //   ).then((value){
    //            pay_model = PayModel.fromjson(value.data);
    //            print(pay_model!.status);
    //            emit(UPaySuccessState(pay_model!));
    //   });
    //}catch(e){
    //  emit(UPayErrorState(e.toString()));
    //    print(e);
    //  };

    // if(imagename != null)
    //   {
    //     DioHelper.postData(url: CPay,data: {
    //       'image': await MultipartFile.fromFile(file!.path,filename:imagename ),
    //     }).then((value) {
    //       pay_model = PayModel.fromjson(value.data);
    //       print(pay_model!.status);
    //       emit(UPaySuccessState(pay_model!));
    //     }).catchError((onError){
    //       emit(UPayErrorState(onError.toString()));
    //       print(onError);
    //     });
    //   }
  }

  void  UGetCart(){
    emit(UGetcartLoadingState());
    DioHelper.getData(url: getCart,token: token).then((value) {
      getcartmodel = Ugetcart.fromjson(value.data);
      print(getcartmodel!.status);
      print(getcart_list[0].serviceName);
      emit(UGetcartSuccessState(getcartmodel!));
    }).catchError((onError){
      emit(UGetcartErrorState(onError.toString()));
      print(onError);
    });
  }

  void  UaddtoCart({
    required String service,
    required int    amount,
    required String category,
    required int price,
    required String id,
    required String image,
  }){
    emit(UaddtocartLoadingState());
    DioHelper.postData(url: addtoCart,token: token,data:{
      "service":service,
      "amount" :amount,
      "price":price,
      "category":category,
      "userId":id,
      "image":image
    }).then((value) {
      addtocartmodel = UaddtocartModel.fromjson(value.data);
      print(addtocartmodel!.status);
      emit(UaddtocartSuccessState(addtocartmodel!));
    }).then((value)  {
      UGetCart();
    }).catchError((onError){
      emit(UaddtocartErrorState(onError.toString()));
      print(onError);
    });
  }

  void removecart(int index){
    if(getcart_list.length != 0)
    {
      getcart_list.removeAt(index);
      emit(UremovefromcartState());

    }
  }

}

