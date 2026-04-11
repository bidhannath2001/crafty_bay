
import '../core/network_caller/network_caller.dart';

NetworkCaller getNetworkCaller(){
  return NetworkCaller(
      headers: ()=>{
        'Content-Type':'application/json',
      },
      onUnauthorized: (){
        //Logout from app
        //clear user data
        //navigate to login screen
      }
  );
}