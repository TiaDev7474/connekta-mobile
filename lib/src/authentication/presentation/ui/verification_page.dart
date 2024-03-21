

import 'package:connekta/src/authentication/presentation/ui/widgets/verification_form.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  final String userEmail;
  const VerificationPage({super.key, required this.userEmail});
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        "Email verification ",
                           style: Theme.of(context)
                               .textTheme
                               .copyWith(
                             titleLarge: const TextStyle(
                               fontSize: 32,
                               fontWeight: FontWeight.bold,
                             ),
                           )
                               .titleLarge,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headlineSmall,
                          children: <TextSpan>[
                            const TextSpan(text:
                            "We sent you a verification code to "),
                            TextSpan(
                              text: widget.userEmail,
                              style: const TextStyle(color: Colors.blueAccent),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  const VerificationForm()

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
