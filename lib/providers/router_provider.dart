import 'package:brick/screens/ar_collaboration.dart';
import 'package:brick/screens/arkit.dart';
import 'package:brick/screens/arkit_mask.dart';
import 'package:brick/screens/arkit_physics.dart';
import 'package:brick/screens/view_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:palestine_console/palestine_console.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: '/',
    observers: [],
    redirect: (context, state) {
      Print.green('ROUTER REDIRECT: ${state.location}', name: 'APP');
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: ViewList()),
      ),
      GoRoute(
        path: '/page-with-parameter',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: Screen()),
      ),
      GoRoute(
        path: '/page-with-parameter/:id',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final id = int.parse(state.params['id']!);
          return MaterialPage(child: Screen(id: id));
        },
      ),
      GoRoute(
        path: '/arkit',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: ArKit()),
      ),
      GoRoute(
        path: '/arkit-mask',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: ArKitMask()),
      ),
      GoRoute(
        path: '/arkit-physics',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: ArKitPhysics()),
      ),
      GoRoute(
        path: '/ar-collaboration',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(child: ArCollaboration()),
      ),
    ],
  ),
);

class Screen extends StatelessWidget {
  const Screen({this.id, super.key});

  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen ${id ?? ''}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                id != null ? 'id: $id' : 'no id',
              ),
            ],
          ),
          if (GoRouter.of(context).location == '/page-with-parameter')
            ElevatedButton(
              onPressed: () {
                context.push('/page-with-parameter/1');
              },
              child: const Text('Go to /page-with-parameter/1'),
            ),
        ],
      ),
    );
  }
}
