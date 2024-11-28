import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatefulWidget {
  static const String routeName = '/payment-options';

  const PaymentOptionsScreen({super.key});

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  String? selectedPayment;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'title': 'Credit & Debit Card',
      'options': [
        {
          'name': 'Credit Card',
          'icon': Icons.credit_card,
        },
        {
          'name': 'Debit Card',
          'icon': Icons.credit_card_outlined,
        },
      ],
    },
    {
      'title': 'UPI',
      'options': [
        {
          'name': 'Google Pay',
          'icon': Icons.g_mobiledata,
        },
        {
          'name': 'PhonePe',
          'icon': Icons.phone_android,
        },
        {
          'name': 'Paytm UPI',
          'icon': Icons.payment,
        },
      ],
    },
    {
      'title': 'Wallet',
      'options': [
        {
          'name': 'Gokash Plus',
          'icon': Icons.account_balance_wallet,
        },
        {
          'name': 'Paytm',
          'icon': Icons.payment,
        },
        {
          'name': 'Amazon Pay',
          'icon': Icons.payments,
        },
      ],
    },
    {
      'title': 'Netbanking',
      'options': [
        {
          'name': 'Netbanking',
          'icon': Icons.account_balance,
          'subtitle': 'All Indian banks',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          method['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Divider(height: 1),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: method['options'].length,
                        itemBuilder: (context, optionIndex) {
                          final option = method['options'][optionIndex];
                          final paymentId = '${method['title']}_${option['name']}';
                          return RadioListTile(
                            value: paymentId,
                            groupValue: selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                selectedPayment = value as String;
                              });
                            },
                            title: Row(
                              children: [
                                Icon(
                                  option['icon'],
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      option['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    if (option['subtitle'] != null)
                                      Text(
                                        option['subtitle'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: selectedPayment != null
              ? () {
            // Handle payment processing
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Processing payment...'),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            );
          }
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Pay Now',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}