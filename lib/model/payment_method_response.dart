class PaymentMethodResponse   {
  String? id;
  String? name;
  String? description;
  String? logo;
  String? route;
  bool? isDefault;

  PaymentMethodResponse(this.id, this.name, this.description, this.route, this.logo, {this.isDefault = false});

  PaymentMethodResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
