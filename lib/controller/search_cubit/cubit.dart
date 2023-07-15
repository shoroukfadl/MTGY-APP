

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/controller/search_cubit/states.dart';

import '../../model/search/seach.dart';
import '../../services/network/dio/dio_helper.dart';
import '../../services/network/dio/endpoints.dart';

class USearchCubit extends Cubit<USearchStates>
{
  USearchCubit() :super(USearchInitalState());
  static USearchCubit get(context) => BlocProvider.of(context);

  USearchModel? searchmodel;

  /* UChangePassword Account */
  void  USearch({
    required String servicename
  }){
    emit(USearchLoadingState());
    DioHelper.postData(url: Usearch ,data:
    {
    'service': servicename
    }
    ).then((value) {
      searchmodel = USearchModel.fromjson(value.data);
      print(searchmodel!.status);
      emit(USearchSuccessState(searchmodel!));
    }).catchError((onError){
      emit(USearchErrorState(onError.toString()));
      print(onError);
    });
  }

}

