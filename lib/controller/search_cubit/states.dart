

import '../../model/search/seach.dart';

abstract class USearchStates{}
class USearchInitalState extends USearchStates{}
class USearchLoadingState extends USearchStates{}
class USearchSuccessState extends USearchStates{
  final USearchModel model;
  USearchSuccessState(this.model);

}
class USearchErrorState extends USearchStates{
  String error;
  USearchErrorState(this.error);
}
