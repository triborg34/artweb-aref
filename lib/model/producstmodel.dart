class Producst {
  Producst({
       this.id,
       this.name,
       this.slug,
       this.permalink,
       this.dateCreated,
       this.dateCreatedGmt,
       this.dateModified,
       this.dateModifiedGmt,
       this.type,
       this.status,
       this.featured,
       this.catalogVisibility,
       this.description,
       this.shortDescription,
       this.sku,
       this.price,
       this.regularPrice,
       this.salePrice,
       this.onSale,
       this.purchasable,
       this.totalSales,
       this.virtual,
       this.downloadable,
       this.downloads,
       this.downloadLimit,
       this.downloadExpiry,
       this.taxStatus,
       this.manageStock,
       this.backorders,
       this.backordersAllowed,
       this.backordered,
       this.soldIndividually,
       this.weight,
       this.dimensions,
       this.shipping  ,
       this.shippingTaxable,
       this.shippingClass,
       this.shippingClassId,
       this.reviewsAllowed,
       this.averageRating,
       this.ratingCount,
       this.upsellIds,
       this.crossSellIds,
       this.parentId,
       this.purchaseNote,
       this.categories,
       this.tags,
       this.images,
       this.attributes,
       this.defaultAttributes,
       this.variations,
       this.groupedProducts,
       this.menuOrder,
       this.priceHtml,
       this.relatedIds,
       this.metaData,
       this.stockStatus,
       this.hasOptions,
  });
    int? id ;
    String? name;
    String? slug;
    String? permalink;
    String? dateCreated;
    String? dateCreatedGmt;
    String? dateModified;
    String? dateModifiedGmt;
    String? type;
    String? status;
    bool? featured;
    String? catalogVisibility;
    String? description;
    String? shortDescription;
    String? sku;
    String? price;
    String? regularPrice;
    String? salePrice;
    bool? onSale;
    bool? purchasable;
    int? totalSales;
    bool? virtual;
    bool? downloadable;
    List<dynamic>? downloads;
    int? downloadLimit;
    int? downloadExpiry;
    String? taxStatus;
    bool? manageStock;
    String? backorders;
    bool? backordersAllowed;
    bool? backordered;
    bool? soldIndividually;
    String? weight;
    Dimensions? dimensions;
    bool? shipping  ;
    bool? shippingTaxable;
    String? shippingClass;
    int? shippingClassId;
    bool? reviewsAllowed;
    String? averageRating;
    int? ratingCount;
    List<int>? upsellIds;
    List<dynamic>? crossSellIds;
    int? parentId;
    String? purchaseNote;
    List<Categories>? categories;
    List<Tags>? tags;
    List<Images>? images;
    List<Attributes>? attributes;
    List<dynamic>? defaultAttributes;
    List<dynamic>? variations;
    List<dynamic>? groupedProducts;
    int? menuOrder;
    String? priceHtml;
    List<int>? relatedIds;
    List<MetaData>? metaData;
    String? stockStatus;
    bool? hasOptions;
  
  Producst.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    catalogVisibility = json['catalog_visibility'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    onSale = json['on_sale'];
    purchasable = json['purchasable'];
    totalSales = json['total_sales'];
    virtual = json['virtual'];
    downloadable = json['downloadable'];
    downloads = List.castFrom<dynamic, dynamic>(json['downloads']);
    downloadLimit = json['download_limit'];
    downloadExpiry = json['download_expiry'];
    taxStatus = json['tax_status'];
    manageStock = json['manage_stock'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    backordered = json['backordered'];
    soldIndividually = json['sold_individually'];
    weight = json['weight'];
    dimensions = Dimensions.fromJson(json['dimensions']);
    shipping   = json['shipping_  '];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    reviewsAllowed = json['reviews_allowed'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];
    upsellIds = List.castFrom<dynamic, int>(json['upsell_ids']);
    crossSellIds = List.castFrom<dynamic, dynamic>(json['cross_sell_ids']);
    parentId = json['parent_id'];
    purchaseNote = json['purchase_note'];
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
    tags = List.from(json['tags']).map((e)=>Tags.fromJson(e)).toList();
    images = List.from(json['images']).map((e)=>Images.fromJson(e)).toList();
    attributes = List.from(json['attributes']).map((e)=>Attributes.fromJson(e)).toList();
    defaultAttributes = List.castFrom<dynamic, dynamic>(json['default_attributes']);
    variations = List.castFrom<dynamic, dynamic>(json['variations']);
    groupedProducts = List.castFrom<dynamic, dynamic>(json['grouped_products']);
    menuOrder = json['menu_order'];
    priceHtml = json['price_html'];
    relatedIds = List.castFrom<dynamic, int>(json['related_ids']);
    metaData = List.from(json['meta_data']).map((e)=>MetaData.fromJson(e)).toList();
    stockStatus = json['stock_status'];
    hasOptions = json['has_options'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['permalink'] = permalink;
    _data['date_created'] = dateCreated;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified'] = dateModified;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['type'] = type;
    _data['status'] = status;
    _data['featured'] = featured;
    _data['catalog_visibility'] = catalogVisibility;
    _data['description'] = description;
    _data['short_description'] = shortDescription;
    _data['sku'] = sku;
    _data['price'] = price;
    _data['regular_price'] = regularPrice;
    _data['sale_price'] = salePrice;
    _data['on_sale'] = onSale;
    _data['purchasable'] = purchasable;
    _data['total_sales'] = totalSales;
    _data['virtual'] = virtual;
    _data['downloadable'] = downloadable;
    _data['downloads'] = downloads;
    _data['download_limit'] = downloadLimit;
    _data['download_expiry'] = downloadExpiry;
    _data['tax_status'] = taxStatus;
    _data['manage_stock'] = manageStock;
    _data['backorders'] = backorders;
    _data['backorders_allowed'] = backordersAllowed;
    _data['backordered'] = backordered;
    _data['sold_individually'] = soldIndividually;
    _data['weight'] = weight;
    _data['dimensions'] = dimensions!.toJson();
    _data['shipping_  '] = shipping  ;
    _data['shipping_taxable'] = shippingTaxable;
    _data['shipping_class'] = shippingClass;
    _data['shipping_class_id'] = shippingClassId;
    _data['reviews_allowed'] = reviewsAllowed;
    _data['average_rating'] = averageRating;
    _data['rating_count'] = ratingCount;
    _data['upsell_ids'] = upsellIds;
    _data['cross_sell_ids'] = crossSellIds;
    _data['parent_id'] = parentId;
    _data['purchase_note'] = purchaseNote;
    _data['categories'] = categories!.map((e)=>e.toJson()).toList();
    _data['tags'] = tags!.map((e)=>e.toJson()).toList();
    _data['images'] = images!.map((e)=>e.toJson()).toList();
    _data['attributes'] = attributes!.map((e)=>e.toJson()).toList();
    _data['default_attributes'] = defaultAttributes;
    _data['variations'] = variations;
    _data['grouped_products'] = groupedProducts;
    _data['menu_order'] = menuOrder;
    _data['price_html'] = priceHtml;
    _data['related_ids'] = relatedIds;
    _data['meta_data'] = metaData!.map((e)=>e.toJson()).toList();
    _data['stock_status'] = stockStatus;
    _data['has_options'] = hasOptions;
    return _data;
  }
}

class Dimensions {
  Dimensions({
        this.length,
        this.width,
       this.height,
  });
    String? length;
    String? width;
    String? height;
  
  Dimensions.fromJson(Map<String, dynamic> json){
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['length'] = length;
    _data['width'] = width;
    _data['height'] = height;
    return _data;
  }
}

class Categories {
  Categories({
       this.id,
       this.name,
       this.slug,
  });
    int? id;
    String? name;
    String? slug;
  
  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    return _data;
  }
}

class Tags {
  Tags({
       this.id,
       this.name,
       this.slug,
  });
    int? id;
    String? name;
    String? slug;
  
  Tags.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    return _data;
  }
}

class Images {
  Images({
       this.id,
       this.dateCreated,
       this.dateCreatedGmt,
       this.dateModified,
       this.dateModifiedGmt,
       this.src,
       this.name,
       this.alt,
  });
    int? id;
    String? dateCreated;
    String? dateCreatedGmt;
    String? dateModified;
    String? dateModifiedGmt;
    String? src;
    String? name;
    String? alt;
  
  Images.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date_created'] = dateCreated;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified'] = dateModified;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['src'] = src;
    _data['name'] = name;
    _data['alt'] = alt;
    return _data;
  }
}

class Attributes {
  Attributes({
       this.id,
       this.name,
       this.position,
       this.visible,
       this.variation,
       this.options,
  });
    int? id;
    String? name;
    int? position;
    bool? visible;
    bool? variation;
    List<String>? options;
  
  Attributes.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    position = json['position'];
    visible = json['visible'];
    variation = json['variation'];
    options = List.castFrom<dynamic, String>(json['options']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['position'] = position;
    _data['visible'] = visible;
    _data['variation'] = variation;
    _data['options'] = options;
    return _data;
  }
}

class MetaData {
  MetaData({
       this.id,
       this.key,
       this.value,
  });
    int? id;
    String? key;
    String? value;
  
  MetaData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }
}