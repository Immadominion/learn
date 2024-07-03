import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn/data/local/image_picker_service.dart';
import 'package:learn/data/local/secure_storage_service.dart';

import '../data/local/toast_service.dart';
import '../data/services/error_service.dart';


GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  const sharedPreferences = FlutterSecureStorage();
  final imagePicker = ImagePicker();
  locator.registerSingleton(sharedPreferences);
  locator.registerSingleton(imagePicker);

  locator.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(
      secureStorage: locator(),
    ),
  );

  locator.registerLazySingleton<ImagePickerService>(
    () => ImagePickerService(
      picker: locator(),
    ),
  );

  locator.registerLazySingleton<ErrorService>(
    () => ErrorService(),
  );

  locator.registerLazySingleton<ToastService>(
    () => ToastService(),
  );
}
