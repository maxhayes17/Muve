import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:url_launcher/url_launcher.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  // final _formKey = GlobalKey<_SharePageState>();
  final _emailController = TextEditingController();
  final _smsController = TextEditingController();
  final _clipController = TextEditingController();

  sendEmail() async {
    String email = _emailController.text.toLowerCase();

    var url = Uri.parse("mailto:$email");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "could not launch $url";
    }
  }

  sendSMS() async {
    String phoneNumber = _smsController.text;
    String body = "Check out my routine on Muve";

    // final Uri smsLaunchUri = Uri(
    //   scheme: 'sms',
    //   path: phoneNumber,
    //   queryParameters: <String, String>{
    //     'body': Uri.encodeComponent("check our my routine from Muve")
    //   },
    // );
    // launchUrl(smsLaunchUri);

    var url = Uri.parse("sms:$phoneNumber&body=$body");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "coult not launch $url";
    }
  }

  saveToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _clipController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        const Text("Share Page"),
        TextFormField(
          controller: _emailController,
          validator: ValidationBuilder().email().build(),
        ),
        ElevatedButton(onPressed: sendEmail, child: const Text("send email")),
        const SizedBox(height: 20),
        TextFormField(
          controller: _smsController,
          validator: ValidationBuilder().phone().build(),
        ),
        ElevatedButton(onPressed: sendSMS, child: const Text("send sms ")),
        const SizedBox(height: 20),
        TextFormField(
          controller: _clipController,
        ),
        ElevatedButton(
          onPressed: () {
            saveToClipboard();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("copied to clipboard")));
          },
          child: const Text('save to clipboard'),
        ),
      ]),
    );
  }
}
