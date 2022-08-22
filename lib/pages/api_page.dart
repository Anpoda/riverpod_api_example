import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_example/providers/providers.dart';

class ApiPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: invalid_use_of_protected_member
    final state = ref.watch(userNotifierProvider.notifier).state;
    return Scaffold(
      body: state.when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (user) => Center(
              child: Text(user.name),
            ),
            error: (e) => Center(
              child: Text("Error occurred, $e"),
            ),
            initial: () => Center(
              child: ElevatedButton(
                child: const Text(
                  "Get Single User",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  ref.read(userNotifierProvider.notifier).getUser();
                },
              ),
            ),
          ),
    );
  }
}