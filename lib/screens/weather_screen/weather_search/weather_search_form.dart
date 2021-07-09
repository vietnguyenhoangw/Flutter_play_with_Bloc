import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherSearchForm extends StatefulWidget {
  const WeatherSearchForm({Key? key}) : super(key: key);

  @override
  _WeatherSearchFormState createState() => _WeatherSearchFormState();
}

class _WeatherSearchFormState extends State<WeatherSearchForm> {
  final TextEditingController _textController = TextEditingController();
  String get _text => _textController.text;

  _onPressSearch() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text('City Search')),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: 'City',
                        hintText: 'Chicago',
                      ),
                    )),
                Expanded(
                    flex: 0,
                    child: IconButton(
                      key: const Key('searchPage_search_iconButton'),
                      icon: const Icon(Icons.search),
                      onPressed: _onPressSearch,
                    ))
              ],
            ),
          ),
        ));
  }
}
