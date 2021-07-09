import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_with_bloc/blocs/weather/weather.dart';
import 'package:flutter_play_with_bloc/modals/location_weather.dart';

class WeatherSearchForm extends StatefulWidget {
  const WeatherSearchForm({Key? key}) : super(key: key);

  @override
  _WeatherSearchFormState createState() => _WeatherSearchFormState();
}

class _WeatherSearchFormState extends State<WeatherSearchForm> {
  final TextEditingController _textController = TextEditingController();
  String get _text => _textController.text;

  _onPressSearch() {
    _hideKeyBoard();
    BlocProvider.of<WeatherBloc>(context)
        .add(SearchLocationRequest(locationName: _text));
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
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: TextField(
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
          flex: 1,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    } else if (state is SearchLocationStateSuccess) {
      List<LocationWeather> locations = state.locations;
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
