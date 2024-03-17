import 'dart:async';

Timer makePeriodicCall(
  Duration duration,
  void Function(Timer timer) callback,{
      bool fireNow = false
 }

){
   var timer = Timer.periodic(duration,callback);
   if(fireNow){
     callback(timer);
   }
   return timer;
}