import 'package:flutter/material.dart';

enum ScreenKind { flow, tab, overlay }

enum ScreenId {
  splash(path: '/splash', kind: ScreenKind.flow),
  landing(path: '/landing', kind: ScreenKind.flow),
  login(path: '/login', kind: ScreenKind.flow),
  register(path: '/register', kind: ScreenKind.flow),
  forgot(path: '/forgot', kind: ScreenKind.flow),
  lock(path: '/lock', kind: ScreenKind.flow),
  home(path: '/home', kind: ScreenKind.tab, icon: Icons.home_filled),
  learn(path: '/learn', kind: ScreenKind.tab, icon: Icons.class_),
  quiz(path: '/quiz', kind: ScreenKind.tab, icon: Icons.create),
  profile(path: '/profile', kind: ScreenKind.tab, icon: Icons.account_circle),
  settings(path: '/settings', kind: ScreenKind.overlay, icon: Icons.settings_outlined, requiresAuth: true);

  const ScreenId({required this.path, required this.kind, this.icon, this.requiresAuth = false});

  final String path;
  final ScreenKind kind;
  final IconData? icon;
  final bool requiresAuth;

  String get label => switch (this) {
    ScreenId.splash => 'Splash',
    ScreenId.landing => 'Welcome',
    ScreenId.login => 'Login',
    ScreenId.register => 'Register',
    ScreenId.forgot => 'Forgot password',
    ScreenId.lock => 'Locked',
    ScreenId.home => 'Home',
    ScreenId.learn => 'Learn',
    ScreenId.quiz => 'Quiz',
    ScreenId.profile => 'Profile',
    ScreenId.settings => 'Settings',
  };

  static const List<ScreenId> tabs = [home, learn, quiz, profile];

  static const List<ScreenId> drawerItems = [settings];

  static ScreenId? fromPath(String path) {
    for (final s in values) {
      if (s.path == path) return s;
    }
    return null;
  }
}
