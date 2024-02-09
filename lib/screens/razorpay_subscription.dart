import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpaySubscription extends StatefulWidget {
  const RazorpaySubscription({super.key});

  @override
  State<RazorpaySubscription> createState() => _RazorpaySubscriptionState();
}

class _RazorpaySubscriptionState extends State<RazorpaySubscription> {
  var _razorpay = Razorpay();
  Map<String, dynamic> options = {};
  @override
  void initState() {
    options = {
      'key': 'rzp_test_DzUq9La0FlTeIu',
      'amount': 300 * 100,
      'name': 'sai academy',
      'description': 'Flutter & Dart classes',
      'prefill': {
        'contact': '9876543210',
        'email': 'sai@gmail.com'
      } // user details here
    };

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Gateway"),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              _razorpay.open(options);
            },
            child: Text("Complete Payment"))
      ]),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("_handlePaymentSuccess");
    // response.paymentId
    //response.data
    Fluttertoast.showToast(msg: "_handlePaymentSuccess");
    // api call
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("_handlePaymentError");
    Fluttertoast.showToast(msg: "_handlePaymentError");
    // api calls
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("_handleExternalWallet");
    Fluttertoast.showToast(msg: "_handleExternalWallet");
  }
}
