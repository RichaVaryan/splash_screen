class MaterialReceiveModel {
  bool? status;
  List<Data>? data;

  MaterialReceiveModel({this.status, this.data});

  MaterialReceiveModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? arrivalDate;
  String? type;
  int? materialId;
  int? batchMaterialId;
  int? travelDocId;
  int? fileMaterialId;
  int? weight;
  String? createdAt;
  String? updatedAt;
  Material? material;
  BatchMaterial? batchMaterial;
  TravelDoc? travelDoc;

  Data(
      {this.id,
      this.arrivalDate,
      this.type,
      this.materialId,
      this.batchMaterialId,
      this.travelDocId,
      this.fileMaterialId,
      this.weight,
      this.createdAt,
      this.updatedAt,
      this.material,
      this.batchMaterial,
      this.travelDoc});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arrivalDate = json['arrival_date'];
    type = json['type'];
    materialId = json['material_id'];
    batchMaterialId = json['batch_material_id'];
    travelDocId = json['travel_doc_id'];
    fileMaterialId = json['file_material_id'];
    weight = json['weight'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    material = json['material'] != null
        ? new Material.fromJson(json['material'])
        : null;
    batchMaterial = json['batch_material'] != null
        ? new BatchMaterial.fromJson(json['batch_material'])
        : null;
    travelDoc = json['travel_doc'] != null
        ? new TravelDoc.fromJson(json['travel_doc'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['arrival_date'] = this.arrivalDate;
    data['type'] = this.type;
    data['material_id'] = this.materialId;
    data['batch_material_id'] = this.batchMaterialId;
    data['travel_doc_id'] = this.travelDocId;
    data['file_material_id'] = this.fileMaterialId;
    data['weight'] = this.weight;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.material != null) {
      data['material'] = this.material!.toJson();
    }
    if (this.batchMaterial != null) {
      data['batch_material'] = this.batchMaterial!.toJson();
    }
    if (this.travelDoc != null) {
      data['travel_doc'] = this.travelDoc!.toJson();
    }
    return data;
  }
}

class Material {
  int? id;
  String? materialNumber;
  String? materialName;
  int? supplierId;
  String? createdAt;
  String? updatedAt;
  Supllier? supllier;

  Material(
      {this.id,
      this.materialNumber,
      this.materialName,
      this.supplierId,
      this.createdAt,
      this.updatedAt,
      this.supllier});

  Material.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    materialNumber = json['material_number'];
    materialName = json['material_name'];
    supplierId = json['supplier_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    supllier = json['supllier'] != null
        ? new Supllier.fromJson(json['supllier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['material_number'] = this.materialNumber;
    data['material_name'] = this.materialName;
    data['supplier_id'] = this.supplierId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.supllier != null) {
      data['supllier'] = this.supllier!.toJson();
    }
    return data;
  }
}

class Supllier {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? createdAt;
  String? updatedAt;

  Supllier(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.createdAt,
      this.updatedAt});

  Supllier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BatchMaterial {
  int? id;
  String? batchMaterialNumber;
  String? batchMaterialName;
  String? type;
  int? minStock;
  int? maxStock;
  int? supplierId;
  String? createdAt;
  String? updatedAt;
  Supllier? supllier;

  BatchMaterial(
      {this.id,
      this.batchMaterialNumber,
      this.batchMaterialName,
      this.type,
      this.minStock,
      this.maxStock,
      this.supplierId,
      this.createdAt,
      this.updatedAt,
      this.supllier});

  BatchMaterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batchMaterialNumber = json['batch_material_number'];
    batchMaterialName = json['batch_material_name'];
    type = json['type'];
    minStock = json['min_stock'];
    maxStock = json['max_stock'];
    supplierId = json['supplier_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    supllier = json['supllier'] != null
        ? new Supllier.fromJson(json['supllier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['batch_material_number'] = this.batchMaterialNumber;
    data['batch_material_name'] = this.batchMaterialName;
    data['type'] = this.type;
    data['min_stock'] = this.minStock;
    data['max_stock'] = this.maxStock;
    data['supplier_id'] = this.supplierId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.supllier != null) {
      data['supllier'] = this.supllier!.toJson();
    }
    return data;
  }
}

class TravelDoc {
  int? id;
  String? numberTravelDoc;
  int? authUserId;
  int? supplierId;
  int? fileMaterialId;
  String? createdAt;
  String? updatedAt;

  TravelDoc(
      {this.id,
      this.numberTravelDoc,
      this.authUserId,
      this.supplierId,
      this.fileMaterialId,
      this.createdAt,
      this.updatedAt});

  TravelDoc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberTravelDoc = json['number_travel_doc'];
    authUserId = json['auth_user_id'];
    supplierId = json['supplier_id'];
    fileMaterialId = json['file_material_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number_travel_doc'] = this.numberTravelDoc;
    data['auth_user_id'] = this.authUserId;
    data['supplier_id'] = this.supplierId;
    data['file_material_id'] = this.fileMaterialId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}