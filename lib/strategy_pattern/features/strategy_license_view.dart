import 'package:flutter/material.dart';
import 'package:flutter_strategy_pattern/strategy_pattern/core/strategy_context.dart';
import 'package:kartal/kartal.dart';

@immutable
class StrategyLicense with Operation {
  const StrategyLicense();

  @override
  Future<StrategyResult?> execute(BuildContext context) async {
    final StrategyResult? response = await context.route.navigation.push<StrategyResult?>(
      MaterialPageRoute(
        builder: (context) => const StrategyLicenseView(),
      ),
    );

    return response;
  }
}

class StrategyLicenseView extends StatefulWidget {
  const StrategyLicenseView({super.key});

  @override
  State<StrategyLicenseView> createState() => _StrategyLicenseViewState();
}

class _StrategyLicenseViewState extends State<StrategyLicenseView> {
  bool _isChecked = false;

  void _updateChecked(bool? value) {
    if (value == null) return;
    if (value == _isChecked) return;

    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('---------- Random ------------'),
          Checkbox(value: _isChecked, onChanged: _updateChecked),
          ElevatedButton(
            onPressed: !_isChecked
                ? null
                : () {
                    context.route.pop(StrategyResult.success);
                  },
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
