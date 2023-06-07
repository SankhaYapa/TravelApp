import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:traveler/screens/sub_screens/order_details_screen/order_details.dart';
import 'package:traveler/screens/sub_screens/trip_details_screen/trip_details_screen.dart';

import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/values/paths.dart';
import 'package:traveler/values/util_function.dart';
import 'package:traveler/widgets/customcards/cancel_request_card.dart';
import 'package:traveler/widgets/customcards/inactive.dart';
import 'package:traveler/widgets/customcards/pay_now_card.dart';
import 'package:traveler/widgets/customcards/reject_accept_card.dart';

import '../../../../widgets/custom_images.dart';

class IncommingOfferInactive extends StatefulWidget {
  const IncommingOfferInactive({Key? key}) : super(key: key);

  @override
  State<IncommingOfferInactive> createState() => _IncommingOfferInactiveState();
}

class _IncommingOfferInactiveState extends State<IncommingOfferInactive> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ConstantColors.whiteColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          IncommingOfferInactiveCard(
            size: size,
            ontap: () {
              UtilFunction.navigateTo(context, TripDetailsScreen());
            },
            name: "Emmar Smith",
            prfleImg: "profile5.jpg",
          )
        ],
      )),
    );
  }
}
