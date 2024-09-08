import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('О приложении'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Название:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Балансер',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Тип:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Приложение',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Основная категория:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Финансы',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Второстепенная категория:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Нет',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Возрастная категория:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              '0+',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Краткое описание:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Ваш личный финансовый трекер для ручного учета расходов и контроля бюджета.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Описание:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Балансер — это простое и удобное приложение для отслеживания ваших финансов. '
              'В современном мире, где деньги могут утекать сквозь пальцы, важно иметь инструмент, '
              'который поможет вам управлять своими финансами. Балансер — ваш надежный помощник в этом деле.\n\n'
              'С помощью Балансера вы можете легко добавлять свои расходы вручную, классифицировать их по категориям и '
              'всегда быть в курсе, на что именно были потрачены ваши деньги. Это приложение позволяет вам вести учет всех '
              'своих финансовых операций, будь то ежедневные покупки, крупные траты или регулярные платежи.\n\n'
              'Балансер подойдет как для тех, кто хочет контролировать свои повседневные траты, так и для тех, кто стремится к '
              'более глубокому анализу своих финансовых привычек. Приложение помогает вам сделать первые шаги к финансовой '
              'независимости, позволяя вести учет своих денег в удобном и понятном интерфейсе.\n\n'
              'Если вы хотите лучше понимать, куда уходят ваши деньги, планировать бюджет и экономить на ненужных расходах — '
              'Балансер станет вашим лучшим помощником. Начните контролировать свои финансы уже сегодня с помощью Балансера!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Обратная связь:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'fedmehol@icloud.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
