import 'package:very_good_rx_blog_app/bootstrap.dart';
import 'package:very_good_rx_blog_app/common/flavors/flavor_config.dart';
import 'package:very_good_rx_blog_app/presentation/app/app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.production,
    values: FlavorValues(baseUrl: 'http://10.0.2.2:8080'),
  );
  bootstrap(() => const App());
}
