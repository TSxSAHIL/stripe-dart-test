// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe_web/flutter_stripe_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stripe Example',
      home: PaymentForm(),
    );
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  late final Stripe _stripe;

  @override
  void initState() {
    super.initState();
    _stripe = Stripe(
      publishableKey: '<YOUR_PUBLISHABLE_KEY>',
      secretKey: '<YOUR_SECRET_KEY>',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Form'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                ),
              ),
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                ),
              ),
            ),
            Card(
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Expiration Date',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Pay'),
              onPressed: () async {
                final paymentMethod = await _stripe.createPaymentMethod(
                  card: CardDetails(
                    number: '4242424242424242',
                    cvc: '123',
                    expirationDate: '12/2023',
                  ),
                );

                if (paymentMethod != null) {
                  // Do something with the payment method.
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}