import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_flutter/constants/endpoints.dart';

import 'package:nasa_flutter/modules/home/view/home_view.dart';
import 'package:nasa_flutter/modules/login/model/login_model.dart';
import 'package:nasa_flutter/utils/network/backend_calls.dart';
import 'package:overlay_support/overlay_support.dart';

class BackendRepository {
  createUser(LoginModel user) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email ?? "",
        password: user.password ?? "",
      );
      if (credential.user?.email != null) {
        Get.offAll(() => HomeView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSimpleNotification(
          const Text('The password provided is too weak.'),
          background: Colors.red,
          position: NotificationPosition.bottom,
        );
      } else if (e.code == 'email-already-in-use') {
        showSimpleNotification(
          const Text('The account already exists for that email.'),
          background: Colors.red,
          position: NotificationPosition.bottom,
        );
      } else {
        if (kDebugMode) {
          print(e.message);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  login(LoginModel user) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email ?? "",
        password: user.password ?? "",
      );
      if (credential.user?.email != null) {
        Get.offAll(() => HomeView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSimpleNotification(
          const Text('No user found for that email.'),
          background: Colors.red,
          position: NotificationPosition.bottom,
        );
      } else if (e.code == 'wrong-password') {
        showSimpleNotification(
          const Text('Wrong password provided for that user.'),
          background: Colors.red,
          position: NotificationPosition.bottom,
        );
      } else {
        if (kDebugMode) {
          print(e.message);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String> fetchCampaigns() async {
    try {
      String response = await BackendCall().getRequest(
        endpoint: campaignsEndpoint,
        body: {},
      );
      return response;
    } catch (e) {
      throw Exception('fetch campaigns error');
    }
  }

  Future<String> fetchCampaignDetail({
    required int id,
  }) async {
    try {
      String response = await BackendCall().getRequest(
        endpoint: campaignDetailEndpoint,
        body: {},
        parameters: "campaign_id=$id",
      );
      return response;
    } catch (e) {
      throw Exception('fetch campaign detail error');
    }
  }

  Future<String> postFinalizedCall({
    required Map<String, dynamic> data,
  }) async {
    try {
      String response = await BackendCall().postRequest(
        endpoint: finalizedCallEndpoint,
        body: data,
        tokenRequired: true,
      );
      return response;
    } catch (e) {
      return "";
    }
  }

  Future<String> fetchTasks(String stateName) async {
    try {
      String response = await BackendCall().getRequest(
        endpoint: tasksEndpoint,
        body: {},
        parameters: "type=$stateName",
      );

      return response;
    } catch (e) {
      throw Exception("Error fetching tasks");
    }
  }

  Future<Map> pauseCampaign(
      {required int campaignId, required String status}) async {
    try {
      String response = await BackendCall().postRequest(
        endpoint: pauseCampaignEndpoint,
        body: {
          "campaign_id": campaignId,
          "status": status,
        },
        tokenRequired: true,
      );
      return jsonDecode(response);
    } catch (e) {
      throw ("Error pausing Campaign");
    }
  }
}
