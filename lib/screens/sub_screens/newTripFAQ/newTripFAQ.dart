import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:traveler/values/constant_colors.dart';
import 'package:traveler/widgets/custom_header.dart';

class ExpandableContainer extends StatefulWidget {
  final String title;
  final String contentTitle;
  final String? contentDetails1;
  final String? contentDetails2;

  ExpandableContainer(
      {required this.title,
      required this.contentTitle,
      this.contentDetails1,
      this.contentDetails2});

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Icon(
                isExpanded ? Icons.remove : Icons.add,
                color: ConstantColors.mainColor,
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.only(top: 16, left: 10, right: 10),
              child: HtmlWidget('''
               <p> ${widget.contentTitle}</p>
               <br><br>
               <ol> 
                ${widget.contentDetails1 != null ? '<li>${widget.contentDetails1}</li>' : ''}
                  ${widget.contentDetails2 != null ? '<li>${widget.contentDetails2}</li>' : ''}
               </ol>
               
               '''),
            ),
        ],
      ),
    );
  }
}

class NewTripFAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      ConstantColors.mainColor,
                      ConstantColors.mainColor2,
                      ConstantColors.mainColor3,
                    ],
                  ),
                ),
                child: CustomHederWidget(
                  title: "FAQ",
                  iconsuffix: Icon(null),
                  iconprefix: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                )),
            Expanded(
              child: ListView(
                children: [
                  ExpandableContainer(
                    title: 'What is \'Deal Method\'?',
                    contentTitle:
                        'The traveler can choose the appropriate Deal Method for them, and there are two options:',
                    contentDetails1:
                        'Traveler Buy: In this option, the traveler purchases the product requested by the shopper as described in the order card. The shopper usually adds a purchase link for the product from global markets such as Amazon, eBay, Walmart, etc. You will pay for the product from your own funds, and when the product is confirmed to be delivered to the shopper, we will release the invoice to your account within 24 working hours. It will include the product price, the agreed-upon traveler reward, and any shipping or customs fees approved and paid by the shopper. We always recommend using this method because it insurance 100% protection for both the traveler and the shopper through Traveler Deals\' insurance. The shopper will pay in advance, and they cannot cancel the payment, and the traveler will receive all their dues upon confirming delivery by scanning QR code from shopper mobile phone. ',
                    contentDetails2:
                        'Shopper Buy: In this option, the shopper purchases the product with their own funds and ships it to the traveler, and the traveler only delivers the product to the shopper. When you confirm that the product has been delivered to the shopper by scanning QR code from shopper mobile phone, we will release the invoice to your account, which will include only the agreed-upon traveler reward.',
                  ),
                  ExpandableContainer(
                    title: 'Is identity verification necessary?',
                    contentTitle:
                        'Identity verification is required for travelers when creating a trip, as it is necessary to verify your identity to combat fraud. You cannot offer deals to shoppers before verifying your identity. This enhances trust in our community, and our top priority is the safety of the community. Identity verification will only be done once, and after that, you will not be asked to verify your identity again.',
                  ),
                  ExpandableContainer(
                    title: 'How do I contact my shopper? ',
                    contentTitle:
                        'When send an offer to a shopper, you can use notes to write a special note about the offer or your trip. Additionally, when your offer is accepted by a shopper, you can use the Traveler Deals Messenger to communicate with the shopper and confirm details about the product, such as its color or quality, as well as update the shopper on the status of their order or meeting location upon arrival in the shopper\'s country. We always recommend that the communication between the traveler and the shopper be through Traveler Deals Messenger.',
                  ),
                  ExpandableContainer(
                    title: 'Can I cancel my delivery offer? ',
                    contentTitle:
                        'Yes, you can cancel the offer you\'ve made to the Shopper as long as they haven\'t paid. You can access the sent offer and withdraw it. However, if the Shopper has already paid, you must honor the offer unless you absolutely cannot fulfill it. In that case, you can inform the Shopper through Traveler Deals Messenger. This also strengthens the trust between Shoppers and Travelers of our community. Additionally, frequent cancellations may affect your personal profile rating.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
