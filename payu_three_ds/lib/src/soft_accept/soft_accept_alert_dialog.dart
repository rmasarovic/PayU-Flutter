import 'package:flutter/material.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'helpers/soft_accept_constants.dart';
import 'models/soft_accept_request.dart';
import 'soft_accept_assembler.dart';
import 'soft_accept_controller.dart';

class SoftAcceptAlertDialog extends StatelessWidget {
  final SoftAcceptRequest request;

  const SoftAcceptAlertDialog({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<SoftAcceptController, SoftAcceptAssembler>(
      assembler: () => SoftAcceptAssembler(request),
      builder: (context, controller) => AlertDialog(
        title: Text('payment_security'.translated()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('please_wait_for_this_window_to_close_automatically'.translated()),
            SizedBox(
              height: 24.0,
              width: 24.0,
              child: Opacity(
                opacity: double.minPositive,
                child: WebViewWidget(

                  controller: WebViewController()
                  ..addJavaScriptChannel(SoftAcceptConstants.javascriptChannelName,
                      onMessageReceived: (e) async {
                        final message = await controller.handleJavascriptMessage(e.message);
                        // ignore: use_build_context_synchronously
                        if (message != null) Navigator.of(context).pop(message);
                      })
                  ..setBackgroundColor(Colors.yellowAccent)
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..loadRequest(Uri.parse(Uri.dataFromString(controller.iframe, mimeType: 'text/html').toString()))
                    ..setNavigationDelegate( NavigationDelegate(
                      onPageFinished: (e) => controller.didCompleteProcessingPage(),

                    ))
                  ,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
