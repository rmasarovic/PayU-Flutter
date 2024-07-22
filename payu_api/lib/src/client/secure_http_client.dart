import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

import 'package:http/io_client.dart';

class SecureHttpClient extends BaseClient{
  final HttpClient httpClient;
  BaseClient? client;

  SecureHttpClient(this.httpClient){
    if (kIsWeb) {
      client = BrowserClient();
    } else {
      client = IOClient();
    }
  }

  factory SecureHttpClient.create() {
    final context = _makeGlobalSecurityContext();
    final httpClient = HttpClient(context: context);
    httpClient.badCertificateCallback = (cert, host, port) => false;
    return SecureHttpClient(httpClient);
  }

  static SecurityContext _makeGlobalSecurityContext() {
    SecurityContext context = SecurityContext(withTrustedRoots: false);
    _setTrustedCertificatesBytes(context, 'packages/payu_api/ssl/entrust.pem');
    return context;
  }

  static void _setTrustedCertificatesBytes(SecurityContext context, String certificatePath) async {
    try {
      final certificate = await rootBundle.load(certificatePath);
      context.setTrustedCertificatesBytes(certificate.buffer.asInt8List());
    } catch (_) {}
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
     return client!.send(request);
  }
}
