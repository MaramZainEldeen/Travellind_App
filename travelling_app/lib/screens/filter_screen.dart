import 'package:flutter/material.dart';
import 'package:travelling_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  /* @override
  void initState() {
   _summer =  widget.currentFilters['summer'];
   _winter =  widget.currentFilters['winter'];
   _family =  widget.currentFilters['family'];

    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('الفلترة '),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  'summer': _summer,
                  'winter': _winter,
                  'family': _family,
                };
                widget.saveFilters(selectedFilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('الرحلات الصيفية'),
                subtitle: Text('إظهار الرحلات في فصل الصيف فقط '),
                value: _summer,
                onChanged: (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('الرحلات الشتوية'),
                subtitle: Text('إظهار الرحلات في فصل الشتاء فقط '),
                value: _winter,
                onChanged: (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('الرحلات العائلية'),
                subtitle: Text('إظهار الرحلات التي للعائلات فقط '),
                value: _family,
                onChanged: (newValue) {
                  setState(() {
                    _family = newValue;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
