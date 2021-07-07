import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_play_with_bloc/screens/permission_require/permission_require.dart';
import 'package:flutter_play_with_bloc/utils/permission_util.dart';

class PermissionRequireForm extends StatefulWidget {
  final permissionId;
  const PermissionRequireForm({Key? key, required this.permissionId})
      : super(key: key);

  @override
  _PermissionRequireState createState() => _PermissionRequireState();
}

class _PermissionRequireState extends State<PermissionRequireForm> {
  final List<PermissionMenuItem> childListItems =
      PermissionMenuItems.loadWeatherBottomMenuItems();

  _onGoToSetting() {
    PermissionUtil.openAppPermissionSetting();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => _onGoToSetting(),
        child: Container(
          child: Center(
            child: _buildBody(childListItems),
          ),
        ));
  }

  Column _buildBody(List<PermissionMenuItem> childListItems) {
    List<PermissionMenuItem> item = childListItems
        .where((element) => element.id == widget.permissionId)
        .toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 0,
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: item[0].icon,
          ),
        ),
        Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                item[0].title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )),
        Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Text(
                item[0].description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ))
      ],
    );
  }
}
