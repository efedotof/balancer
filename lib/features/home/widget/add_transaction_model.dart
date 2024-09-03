import 'dart:developer';

import 'package:balancer/constants.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionModel extends StatefulWidget {
  const AddTransactionModel({super.key});

  @override
  State<AddTransactionModel> createState() => _AddTransactionModelState();
}

class _AddTransactionModelState extends State<AddTransactionModel> {
  final TextEditingController _amountController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedCategory;

  Color _amountColor = Colors.grey;
  Color _dateColor = Colors.grey;
  Color _categoryColor = Colors.grey;

  static const double _maxAmount = 1e18;

  void _validateFields() {
    setState(() {
      _amountColor = _isValidAmount(_amountController.text) ? Colors.grey : Colors.red;
      _dateColor = _selectedDate == null ? Colors.red : Colors.grey;
      _categoryColor = _selectedCategory == null ? Colors.red : Colors.grey;

      _selectedDate ??= DateTime.now();
    });
  }

  bool _isValidAmount(String value) {
  
    final RegExp regex = RegExp(r'^[+-]\d*\.?\d{0,2}$');
    if (!regex.hasMatch(value)) {
      return false;
    }

    String amountStr = value.substring(1);
    double amount;
    try {
      amount = double.parse(amountStr.isEmpty ? '0' : amountStr);
    } catch (e) {
      return false;
    }

    return amount <= _maxAmount;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Wrap(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    SizedBox(
                      child: TextField(
                        controller: _amountController,
                        style: TextStyle(color: _amountColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '+/- Сумма*',
                          hintStyle: TextStyle(color: _amountColor),
                          suffixText: '₽',
                          suffixStyle: TextStyle(color: _amountColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: _amountColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: _amountColor),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _amountColor = _isValidAmount(value) ? Colors.grey : Colors.red;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _dateColor = Colors.grey;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        width: MediaQuery.of(context).size.width * 0.89,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: _dateColor),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _selectedDate != null
                                  ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                  : "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                              style: TextStyle(color: _dateColor),
                            ),
                            const Icon(Icons.calendar_today,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      width: MediaQuery.of(context).size.width * 0.89,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: _categoryColor),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCategory,
                          hint: Text("Выберите категорию*",
                              style: TextStyle(color: _categoryColor)),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.grey),
                          dropdownColor: Colors.black87,
                          items: AppStrings.dropDownNames.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(color: Colors.grey)),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCategory = newValue;
                              _categoryColor = Colors.grey;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state is AddNewBox) {
                          return GestureDetector(
                            onTap: () {
                              log(_amountController.text);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4C6EEB),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator()),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              _validateFields();
                              if (_isValidAmount(_amountController.text) &&
                                  _selectedDate != null &&
                                  _selectedCategory != null) {
                                context.read<HomeCubit>().addNewBoxTransaction(
                                      context,
                                      _amountController.text,
                                      _selectedDate!,
                                      _selectedCategory!,
                                    );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4C6EEB),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: const Text(
                                'Добавить новую транзакцию',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
