import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

ChargeCard(String card_number, String code) {
  FlutterPhoneDirectCaller.callNumber('*' + code + '*' + card_number + '#');
}
