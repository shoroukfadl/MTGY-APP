



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtgy_app/screens/client/pay&order/cubit/states.dart';

import '../../../../models/order_pay/pay.dart';
import '../../../../shared/network/dio/dio_helper.dart';
import '../../../../shared/network/dio/endpoints.dart';
import '../../home/cubit/states.dart';

class UOrder_PayCubit extends Cubit<UOrder_PayStates>
{
  UOrder_PayCubit() :super(UOrder_PayInitalState());
  static UOrder_PayCubit get(context) => BlocProvider.of(context);
  PayModel? pay_model;
  bool isCreditCardExpanded = true;
  bool isFawryExpanded = false;

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
}

