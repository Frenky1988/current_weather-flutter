
import 'package:intl/intl.dart';

class Util{

  static String apiId = "7159a23e0e33bcd330391f4dac81e2be";
  static String getDate(DateTime dateTime){

    return new DateFormat("EEE, MMM d, y,").format(dateTime);

  }
  // static String getClock(DateTime dateTime){
  //
  //   return new DateFormat("HH:mm").format(dateTime);
  //
  // }
}