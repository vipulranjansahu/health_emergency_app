import 'package:flutter/material.dart';
import 'package:pro_tec/networking.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class FundRequest extends StatefulWidget {
  FundRequest({required this.data});

Map<dynamic,dynamic>data;

  @override
  State<FundRequest> createState() => _FundRequestState();
}

class _FundRequestState extends State<FundRequest> {

  late Razorpay _razorpay;
  int amount =0;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(int amount) async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': amount,
      'name': widget.data["name"],
      'description': 'Payment',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!, );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, );
  }


  @override
  Widget build(BuildContext context) {



    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(CircleBorder()),
                    backgroundColor: MaterialStateProperty.all(
                        Color(0xFFFF5E5E)), // <-- Button color
                  ),
                ),
                Text(
                  "Fund Request",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.data["title"],
                  style: TextStyle(color: Color(0xFFA51C1C), fontSize: 20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("images/user.png"),
                Column(
                  children: [
                    Text(
                      "Request was started by ${widget.data["name"]}",
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                    Text(
                      "Date : 13/07/22 ",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "About",
                  style: TextStyle(fontSize: 25, color: Color(0xFFA51C1C)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                widget.data["description"]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("To see documents tap"),
                TextButton(
                    onPressed: () {
                      String url = widget.data["driveLink"];
                      launch(url);
                    },
                    child: Text(
                      "Here",
                      style: TextStyle(color: Color(0xFFA51C1C)),
                    )),
              ],
            ),
          ),
          Text(
            "Amount Collected",
            style: TextStyle(color: Color(0xFFA51C1C), fontSize: 20),
          ),
          Text(
            "₹ ${widget.data["collectedAmount"].toString()}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Amount to beCollected",
            style: TextStyle(color: Color(0xFFA51C1C), fontSize: 20),
          ),
          Text(
            "₹ ${widget.data["quantity"]}",
            style: TextStyle(fontSize: 20),
          ),
          Text("Amount you want to donate"),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFF6A6A)),
              child: TextFormField(
                onChanged: (value) {
                  amount = value as int;
                },
                initialValue: "  Enter Amount in ₹",
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: ElevatedButton(
              onPressed: () async{
                openCheckout(amount);
                await update_fund(widget.data["_id"],(widget.data["collectedAmount"]+amount));
              },
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(
                        child: Text(
                      "Contribute Now",
                      style: TextStyle(fontSize: 20),
                    )),
                  )),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )),
                backgroundColor: MaterialStateProperty.all(Color(0xFFFB4B4B)),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
