import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityNetworkController{

  ConnectivityNetworkController._();

  static final ConnectivityNetworkController instance =
  ConnectivityNetworkController._();

  final ValueNotifier<bool> isConnect = ValueNotifier(true);

  Future<void> init()async{
    final result =  await  Connectivity().checkConnectivity() ;
    isInternetConnected(result.first);
    Connectivity().onConnectivityChanged.listen((result){
      isInternetConnected(result.first) ;
    });

  }

  bool isInternetConnected(ConnectivityResult? result){

    if(result == ConnectivityResult.none){
      isConnect.value = false ;
      return false ;
    }
    else if(result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi){
      isConnect.value = true ;
      return true ;
    }
    else {
      return false ;
    }
  }

}