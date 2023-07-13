class Category {
  Category({
     this.id,
     this.name,
     this.slug,
     this.parent,
     this.description,
     this.display,
     this.image,
     this.menuOrder,
     this.count,
  });
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
   String? image;
  int? menuOrder;
  int? count;
  
  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
    display = json['display'];
    image = json['image'];
    menuOrder = json['menu_order'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['parent'] = parent;
    _data['description'] = description;
    _data['display'] = display;
    _data['image'] = image;
    _data['menu_order'] = menuOrder;
    _data['count'] = count;
    return _data;
  }
}