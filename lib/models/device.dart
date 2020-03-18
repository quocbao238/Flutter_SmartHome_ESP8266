class DeviceModel {
  String image;
  int id;
  bool status;

  DeviceModel({this.id, this.status});
}

List<DeviceModel> devices = [
  DeviceModel(id: 1, status: true),
  DeviceModel(id: 2, status: false),
  DeviceModel(id: 3, status: false),
  DeviceModel(id: 4, status: true),
  DeviceModel(id: 5, status: true),
];
