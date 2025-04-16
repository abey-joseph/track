import 'package:flutter/material.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';

class HabitAddPage extends StatefulWidget {
  const HabitAddPage({Key? key}) : super(key: key);

  @override
  State<HabitAddPage> createState() => _HabitAddPageState();
}

class _HabitAddPageState extends State<HabitAddPage> {
  final _nameCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  bool _isBinary = true;
  String? _countType;
  double _targetVal = 0;
  String _targetType = 'Minimum';
  String _frequency = 'Everyday';
  List<bool> _weekDays = List.filled(7, false);
  bool _reminder = false;
  int _everyXDays = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Habit'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: titleActionButton(icon: Icons.save, onTap: () {}),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Habit Name'),
            ),
            TextField(
              maxLines: 2,
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Binary'),
                    value: true,
                    groupValue: _isBinary,
                    onChanged: (val) => setState(() => _isBinary = val!),
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Countable'),
                    value: false,
                    groupValue: _isBinary,
                    onChanged: (val) => setState(() => _isBinary = val!),
                  ),
                ),
              ],
            ),
            if (!_isBinary) ...[
              DropdownButton<String>(
                hint: const Text('Select Count Type'),
                value: _countType,
                items: const [
                  DropdownMenuItem(value: 'count', child: Text('Count')),
                  DropdownMenuItem(value: 'pages', child: Text('Pages')),
                  DropdownMenuItem(value: 'money', child: Text('Money')),
                  DropdownMenuItem(value: 'minutes', child: Text('Minutes')),
                ],
                onChanged: (val) => setState(() => _countType = val),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Target'),
                      onChanged: (v) =>
                          setState(() => _targetVal = double.tryParse(v) ?? 0),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _targetType,
                      items: const [
                        DropdownMenuItem(
                            value: 'Minimum', child: Text('Minimum')),
                        DropdownMenuItem(
                            value: 'Maximum', child: Text('Maximum')),
                      ],
                      onChanged: (val) => setState(() => _targetType = val!),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 16),
            DropdownButton<String>(
              isExpanded: true,
              value: _frequency,
              items: const [
                DropdownMenuItem(value: 'Everyday', child: Text('Everyday')),
                DropdownMenuItem(
                    value: 'SelectDays', child: Text('Choose days')),
                DropdownMenuItem(
                    value: 'EveryXDays', child: Text('Once in every set days')),
                DropdownMenuItem(value: 'OnceWeek', child: Text('Once a week')),
                DropdownMenuItem(
                    value: 'OnceMonth', child: Text('Once a month')),
              ],
              onChanged: (val) => setState(() => _frequency = val!),
            ),
            if (_frequency == 'SelectDays')
              Wrap(
                spacing: 8,
                children: List.generate(7, (i) {
                  final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                  return ChoiceChip(
                    label: Text(days[i]),
                    selected: _weekDays[i],
                    onSelected: (selected) {
                      setState(() => _weekDays[i] = selected);
                    },
                  );
                }),
              ),
            if (_frequency == 'EveryXDays')
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'In every X days'),
                onChanged: (v) =>
                    setState(() => _everyXDays = int.tryParse(v) ?? 1),
              ),
            SwitchListTile(
              title: const Text('Enable Reminder'),
              value: _reminder,
              onChanged: (val) => setState(() => _reminder = val),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Habit Name
Description
Type of Habit
  - Binary
  - Countable
      - (count, pages, money, minutes)
        - Target
          - __
        - Target Type
          - Minimum / Maximum
how often
  - everyday
  - choose days from week
    - S M T W T F S
  - once in every set days
   - In every ___ Days
  - once in a week
  - once in a month
Enable reminder
*/
