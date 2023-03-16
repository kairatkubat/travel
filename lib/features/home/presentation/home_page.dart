import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel/features/home/presentation/controllers/user.dart';

final userStateNotifierProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateNotifierProvider);
    ref.listen(
      userStateNotifierProvider,
      (previousState, currentState) {},
      onError: (error, stackTrace) {
        print(error);
      },
    );
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.red,
              decoration: const InputDecoration(
                fillColor: Colors.purple,
              ),
              onSubmitted: (value) => onSubmitNameTextField(ref, value),
            ),
            Text(user.name),
          ],
        ),
      ),
    );
  }

  void onSubmitNameTextField(WidgetRef ref, String value) {
    ref.read(userStateNotifierProvider.notifier).updateName(value);
  }
}
