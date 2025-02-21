import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void setupDepInj() => getIt.init();
