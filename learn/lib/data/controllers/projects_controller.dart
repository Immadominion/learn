import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learn/core/constants/enum.dart';
import 'package:learn/data/%20model/profile_model.dart';
import 'package:learn/data/services/profile_services.dart';
import '../local/secure_storage_service.dart';
import '../services/error_service.dart';
import 'base_controller.dart';

final projectsController =
    ChangeNotifierProvider<ProfileController>((ref) => ProfileController());

class ProfileController extends BaseChangeNotifier {
  final SecureStorageService secureStorageService =
      SecureStorageService(secureStorage: const FlutterSecureStorage());
  final GetProjects getProjects = GetProjects();
  late Question question = Question();

  Future<void> toGetQuizByQuery(String query) async {
    loadingState = LoadingState.loading;
    try {
      debugPrint('To Get Bet Project IDs');
      final res = await getProjects.getQuizByQuery(query);
      if (res.statusCode == 200) {
        log('Response data: ${res.data}');
        question = Question.fromJson(res.data);
        loadingState = LoadingState.idle;
      } else {
        debugPrint(res.toString());
        loadingState = LoadingState.idle;
        throw Error();
      }
    } on DioException catch (e) {
      loadingState = LoadingState.idle;
      ErrorService.handleErrors(e);
    } catch (e) {
      loadingState = LoadingState.idle;
      ErrorService.handleErrors(e);
    }
    notifyListeners();
  }
}
