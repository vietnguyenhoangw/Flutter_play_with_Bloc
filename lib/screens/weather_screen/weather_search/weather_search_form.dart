import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather.dart';
import 'package:flutter_play_with_bloc/modals/location_weather.dart';
import 'dart:async';

class WeatherSearchForm extends StatefulWidget {
  const WeatherSearchForm({Key? key}) : super(key: key);

  @override
  _WeatherSearchFormState createState() => _WeatherSearchFormState();
}

class _WeatherSearchFormState extends State<WeatherSearchForm> {
  Timer? _debounce;
  final TextEditingController _textController = TextEditingController();
  String get _text => _textController.text;
  String textValue = "";

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchTextFieldChange(String val) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1300), () {
      BlocProvider.of<WeatherBloc>(context)
          .add(SearchLocationRequest(locationName: val));
    });
  }

  _onPressSearch() {
    if (_text.isNotEmpty) {
      _hideKeyBoard();
      BlocProvider.of<WeatherBloc>(context)
          .add(SearchLocationRequest(locationName: _text));
    }
  }

  _onPressListItem(LocationWeather location) {
    Navigator.of(context).pop(location);
  }

  _hideKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _hideKeyBoard,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("Search location"),
          ),
          body: BlocListener<WeatherBloc, WeatherState>(
              listener: (context, state) {},
              child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: TextField(
                                onChanged: _onSearchTextFieldChange,
                                controller: _textController,
                                decoration: const InputDecoration(
                                  labelText: 'City',
                                  hintText: 'Chicago, London...',
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
                      _renderContent(state),
                    ],
                  ),
                );
              })),
        ));
  }

  Container _renderContent(WeatherState state) {
    if (state is WeatherStateLoading) {
      return Container(
        child: Expanded(
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    } else if (state is SearchLocationStateSuccess) {
      List<LocationWeather> locations = state.locations;
      if (locations.length > 0) {
        return Container(
          child: Expanded(
            flex: 1,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: locations.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildListItem(locations, index);
                }),
          ),
        );
      } else {
        return Container(
          height: MediaQuery.of(context).size.height - 160,
          child: Center(
            child: Text("No data"),
          ),
        );
      }
    } else {
      return Container();
    }
  }

  Container _buildListItem(List<LocationWeather> locations, int index) {
    return Container(
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => _onPressListItem(locations[index]),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: Text(
              '${locations[index].title}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
