class GetAllDetailsModel {
  bool? success;
  String? message;
  List<CarData>? data;

  GetAllDetailsModel({this.success, this.message, this.data});

  GetAllDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CarData>[];
      json['data'].forEach((v) {
        data!.add(new CarData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarData {
  int? carId;
  String? rcNumber;
  int? capacity;
  String? model;
  String? remark;
  int? isActive;
  int? createdBy;
  List<Attachments>? attachments;

  CarData(
      {this.carId,
      this.rcNumber,
      this.capacity,
      this.model,
      this.remark,
      this.isActive,
      this.createdBy,
      this.attachments});

  CarData.fromJson(Map<String, dynamic> json) {
    carId = json['car_id'];
    rcNumber = json['rc_number'];
    capacity = json['capacity'];
    model = json['model'];
    remark = json['remark'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_id'] = this.carId;
    data['rc_number'] = this.rcNumber;
    data['capacity'] = this.capacity;
    data['model'] = this.model;
    data['remark'] = this.remark;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  String? attachmentType;
  List<AttachmentUrl>? attachmentUrl;

  Attachments({this.attachmentType, this.attachmentUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    attachmentType = json['attachment_type'];
    if (json['attachment_url'] != null) {
      attachmentUrl = <AttachmentUrl>[];
      json['attachment_url'].forEach((v) {
        attachmentUrl!.add(new AttachmentUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attachment_type'] = this.attachmentType;
    if (this.attachmentUrl != null) {
      data['attachment_url'] =
          this.attachmentUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttachmentUrl {
  int? id;
  String? url;

  AttachmentUrl({this.id, this.url});

  AttachmentUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    return data;
  }
}
