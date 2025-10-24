import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/auth_controller.dart';
import '../../services/secure_storage_service.dart';

class SessionTimer extends StatefulWidget {
  final Widget child;

  const SessionTimer({super.key, required this.child});

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> {
  Timer? _timer;
  final SecureStorageService _storageService = SecureStorageService();
  int _timeoutMinutes = 1;

  @override
  void initState() {
    super.initState();
    _loadTimeoutAndStartTimer();
  }

  Future<void> _loadTimeoutAndStartTimer() async {
    _timeoutMinutes = await _storageService.getTimeoutMinutes();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(Duration(minutes: _timeoutMinutes), _onTimeout);
  }

  void _onTimeout() {
    final authController = Provider.of<AuthController>(context, listen: false);
    authController.logout();
    print("¡Sesión cerrada por inactividad!");
  }

  void _handleUserInteraction(PointerEvent event) {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _handleUserInteraction,
      onPointerMove: _handleUserInteraction,
      onPointerUp: _handleUserInteraction,
      child: widget.child,
    );
  }
}
