import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final Color amountColor;
  final DateTime date;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.date,
  });

  String _formatNumber(double number) {
    final absNumber = number.abs();
    if (absNumber >= 1e18) {
      return '${(number / 1e18).toStringAsFixed(2)} квинт'; // квинтильон
    } else if (absNumber >= 1e15) {
      return '${(number / 1e15).toStringAsFixed(2)} квадр'; // квадриллион
    } else if (absNumber >= 1e12) {
      return '${(number / 1e12).toStringAsFixed(2)} трлн'; // триллион
    } else if (absNumber >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(2)} млрд'; // миллиард
    } else if (absNumber >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(2)} млн'; // миллион
    } else if (absNumber >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(2)} тыс'; // тысяча
    } else {
      return number.toStringAsFixed(2); // обычное число
    }
  }

  @override
  Widget build(BuildContext context) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    final hour = date.hour.toString().padLeft(2, '0');
    final minute = date.minute.toString().padLeft(2, '0');

    final formattedDate = '$day.$month.$year  $hour:$minute';

    // Parse the amount string to a double and format it
    final doubleAmount = double.tryParse(amount.replaceAll(',', '.')) ?? 0.0;
    final formattedAmount = _formatNumber(doubleAmount);

    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0), // Adjust padding if necessary
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
        overflow: TextOverflow.ellipsis, // Ensure text does not overflow
      ),
      subtitle: Text(
        formattedDate,
        style: const TextStyle(color: Colors.white70),
        overflow: TextOverflow.ellipsis, // Ensure text does not overflow
      ),
      trailing: SizedBox(
        width: 120, // Set a fixed width for trailing text
        child: Text(
          textAlign: TextAlign.end,
          '$formattedAmount ₽',
          style: TextStyle(color: amountColor, fontSize: 18),
          overflow: TextOverflow.ellipsis, // Ensure text does not overflow
          maxLines: 1, // Ensure the text is limited to a single line
        ),
      ),
    );
  }
}
