import 'package:auto_route/auto_route.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).aboutTheApp),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                S.of(context).name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                S.of(context).balancer,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).type,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                S.of(context).application,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).mainCategory,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                S.of(context).finance,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).secondaryCategory,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                S.of(context).none,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).ageRating,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                '0+',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).shortDescription,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                S.of(context).yourPersonalFinancialTrackerForManuallyRecordingExpensesAndBudget,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).description,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                S.of(context).balancerIsASimpleAndConvenientApplicationForTrackingYour,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).contact,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                'fedmehol@icloud.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
