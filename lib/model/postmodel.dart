class PostModel {
  PostModel({
     this.id,
     this.date,
     this.dateGmt,
     this.guid,
     this.modified,
     this.modifiedGmt,
     this.slug,
     this.status,
     this.type,
     this.link,
     this.title,
     this.content,
     this.excerpt,
     this.author,
     this.featuredMedia,
     this.commentStatus,
     this.pingStatus,
     this.sticky,
     this.template,
     this.format,
     this.meta,
     this.categories,
     this.tags,
     this.embedded,
  });
   int? id;
   String? date;
   String? dateGmt;
   Guid? guid;
   String? modified;
   String? modifiedGmt;
   String? slug;
   String? status;
   String? type;
   String? link;
   Title? title;
   Content? content;
   Excerpt? excerpt;
   int? author;
   int? featuredMedia;
   String? commentStatus;
   String? pingStatus;
   bool? sticky;
   String? template;
   String? format;
   List<dynamic>? meta;
   List<int>? categories;
   List<dynamic>? tags;
   Embedded? embedded;
  
  PostModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = Guid.fromJson(json['guid']);
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = Title.fromJson(json['title']);
    content = Content.fromJson(json['content']);
    excerpt = Excerpt.fromJson(json['excerpt']);
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    meta = List.castFrom<dynamic, dynamic>(json['meta']);
    categories = List.castFrom<dynamic, int>(json['categories']);
    tags = List.castFrom<dynamic, dynamic>(json['tags']);
    embedded = Embedded.fromJson(json['_embedded']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date'] = date;
    _data['date_gmt'] = dateGmt;
    _data['guid'] = guid?.toJson();
    _data['modified'] = modified;
    _data['modified_gmt'] = modifiedGmt;
    _data['slug'] = slug;
    _data['status'] = status;
    _data['type'] = type;
    _data['link'] = link;
    _data['title'] = title?.toJson();
    _data['content'] = content?.toJson();
    _data['excerpt'] = excerpt?.toJson();
    _data['author'] = author;
    _data['featured_media'] = featuredMedia;
    _data['comment_status'] = commentStatus;
    _data['ping_status'] = pingStatus;
    _data['sticky'] = sticky;
    _data['template'] = template;
    _data['format'] = format;
    _data['meta'] = meta;
    _data['categories'] = categories;
    _data['tags'] = tags;
    _data['_embedded'] = embedded?.toJson();
    return _data;
  }
}

class Guid {
  Guid({
     this.rendered,
  });
   String? rendered;
  
  Guid.fromJson(Map<String, dynamic> json){
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rendered'] = rendered;
    return _data;
  }
}

class Title {
  Title({
     this.rendered,
  });
   String? rendered;
  
  Title.fromJson(Map<String, dynamic> json){
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rendered'] = rendered;
    return _data;
  }
}

class Content {
  Content({
     this.rendered,
     this.protected,
  });
   String? rendered;
   bool? protected;
  
  Content.fromJson(Map<String, dynamic> json){
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rendered'] = rendered;
    _data['protected'] = protected;
    return _data;
  }
}

class Excerpt {
  Excerpt({
     this.rendered,
     this.protected,
  });
   String? rendered;
   bool? protected;
  
  Excerpt.fromJson(Map<String, dynamic> json){
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['rendered'] = rendered;
    _data['protected'] = protected;
    return _data;
  }
}

class Embedded {
  Embedded({
      this.wpfeaturedmedia,
  });
     var wpfeaturedmedia;
 Embedded.fromJson(Map<String, dynamic> json) {
  wpfeaturedmedia=json['wp:featuredmedia'];
  
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['wp:featuredmedia'] = wpfeaturedmedia!.map((e)=>e.toJson()).toList();
    return _data;
  }
}


class Wpfeaturedmedia {
  Wpfeaturedmedia({
   
     this.sourceUrl,
  });
 
  String? sourceUrl;
  
  Wpfeaturedmedia.fromJson(Map<String, dynamic> json){
   
    sourceUrl = json['source_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
  
    _data['source_url'] = sourceUrl;
    return _data;
  }
}