import 'list_price.dart';
import 'offer.dart';
import 'retail_price.dart';

class SaleInfo {
	String? country;
	String? saleability;
	bool? isEbook;
	ListPrice? listPrice;
	RetailPrice? retailPrice;
	String? buyLink;
	List<Offer>? offers;

	SaleInfo({
		this.country, 
		this.saleability, 
		this.isEbook, 
		this.listPrice, 
		this.retailPrice, 
		this.buyLink, 
		this.offers, 
	});

	factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
				country: json['country'] as String?,
				saleability: json['saleability'] as String?,
				isEbook: json['isEbook'] as bool?,
				listPrice: json['listPrice'] == null
						? null
						: ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
				retailPrice: json['retailPrice'] == null
						? null
						: RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
				buyLink: json['buyLink'] as String?,
				offers: (json['offers'] as List<dynamic>?)
						?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'country': country,
				'saleability': saleability,
				'isEbook': isEbook,
				'listPrice': listPrice?.toJson(),
				'retailPrice': retailPrice?.toJson(),
				'buyLink': buyLink,
				'offers': offers?.map((e) => e.toJson()).toList(),
			};
}
