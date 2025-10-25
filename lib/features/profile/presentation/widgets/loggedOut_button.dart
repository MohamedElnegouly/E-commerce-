import 'package:e_commerce/features/Authentication/presentation/manager/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedOutButton extends StatelessWidget {
  const LoggedOutButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<AuthCubit>().logout(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orangeAccent,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(Icons.logout, color: Colors.white),
      label: const Text(
        'Logout',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}