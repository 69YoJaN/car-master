import 'package:car_master/constants/colors.dart';
import 'package:car_master/models/get_all_details/get_all_details.dart';
import 'package:car_master/stores/get_all_details_store/get_all_details_store.dart';
import 'package:car_master/utils/device/device_utils.dart';
import 'package:car_master/widgets/button_widget.dart';
import 'package:car_master/widgets/car_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CarMasterMainScreen extends StatefulWidget {
  const CarMasterMainScreen({super.key});

  @override
  State<CarMasterMainScreen> createState() => _CarMasterMainScreenState();
}

class _CarMasterMainScreenState extends State<CarMasterMainScreen> {
  //stores:---------------------------------------------------------------------
  late GetAllDetailsStore _getAllDetailsStore;

  @override
  void initState() {
    // loadData();
    super.initState();
  }

  String incident_id = '';
  String patient_id = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _getAllDetailsStore = Provider.of<GetAllDetailsStore>(context);
  }

  // loadData() async {
//To get

  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   // auth_token = preferences.getString(Preferences.auth_token) ?? '';
  //   setState(() {});

//To store
  //  SharedPreferences.getInstance().then((prefs) {
  //           prefs.setString(Preferences.incident_id, incident_id);
  //           prefs.setString(Preferences.patient_id, patient_id);
  //           // prefs.setString(Preferences.auth_token, auth_token);
  //         });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Master'),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SafeArea(
              child: Container(
            color: AppColors.backgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: DeviceUtils.getScaledWidth(context, 3.5),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: DeviceUtils.getScaledWidth(context, 3.5)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Visibility(
                              visible: false, child: _buildButton())),
                      Expanded(child: _buildButton()),
                    ],
                  ),
                ),
                SizedBox(
                  height: DeviceUtils.getScaledHeight(context, 2),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[_buildList()],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Observer(
            builder: (context) {
              return _getAllDetailsStore.loading
                  ? const CircularProgressIndicator()
                  : Container();
            },
          ),
          Observer(
            builder: (context) {
              return _getAllDetailsStore.loading
                  ? Container()
                  : _getAllDetailsStore.Success
                      ? _getAllDetailsStore.alldetailsResponse != null
                          ? Container()
                          : const Center(child: Text("No Data"))
                      : const Center(child: Text("No Data"));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Observer(
      builder: (context) {
        return _getAllDetailsStore.loading
            ? Container()
            : _getAllDetailsStore.Success
                ? _getAllDetailsStore.alldetailsResponse != null
                    ? _buildCarDetailsList()
                    : Container()
                : Container();
      },
    );
  }

  late final List<CarData> cars;

  _buildCarDetailsList() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _getAllDetailsStore.alldetailsResponse!.data!.length,
        // _getAllDetailsStore.rolesResponse!.services.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CarDetailsCard(
            item: _getAllDetailsStore.alldetailsResponse!.data![index],
            image: _getAllDetailsStore.alldetailsResponse!.data![index]
                .attachments![0].attachmentUrl![0].url,
          );
        });
  }

  Widget _buildButton() {
    return ButtonWidget(
      borderRadius:
          BorderRadius.circular(DeviceUtils.getScaledWidth(context, 2)),
      onPressed: () {
        _getAllDetailsStore.postAllDetails("CAR");
        //  Navigator.push(
        //   context as BuildContext,
        //   MaterialPageRoute(
        //       builder: (context) => VitalsDashboard(
        //           incident_id: incident_id,
        //           patient_id: patient_id,
        //           auth_token: auth_token)),
        // );
      },
      text: 'Add More',
    );
  }
}
