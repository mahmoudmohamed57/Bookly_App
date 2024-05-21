class ListPrice {
	num? amount;
	String? currencyCode;

	ListPrice({this.amount, this.currencyCode});

	factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
				amount: json['amount'] as num?,
				currencyCode: json['currencyCode'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'amount': amount,
				'currencyCode': currencyCode,
			};
}
