import 'dart:async';

import 'package:rxdart_ext/rxdart_ext.dart';

void Function(String)? streamDebugPrint;

extension DebugMapStreamsExtension on Map<String, Stream<dynamic>> {
  List<StreamSubscription<dynamic>> debug() {
    return entries
        .map(
          (entry) => entry.value
              .cast<dynamic>()
              .debug(
                identifier: entry.key,
                log: streamDebugPrint,
              )
              .collect(),
        )
        .toList(growable: false);
  }
}
