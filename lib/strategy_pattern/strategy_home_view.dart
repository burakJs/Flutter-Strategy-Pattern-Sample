import 'package:flutter/material.dart';

import 'strategy_home_mixin.dart';

class StrategyHomeView extends StatefulWidget {
  const StrategyHomeView({super.key});

  @override
  State<StrategyHomeView> createState() => _StrategyHomeViewState();
}

class _StrategyHomeViewState extends State<StrategyHomeView> with StrategyHomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Pattern'),
      ),
      body: Column(),
      floatingActionButton: FloatingActionButton(
        onPressed: onStartedLogic,
        child: const Icon(Icons.add),
      ),
    );
  }
}
