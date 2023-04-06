class Anime {
  String? id;
  String? title;
  String? poster;
  String? genre;
  String? status;
  String? type;
  String? totalEpisode;
  String? sub;
  String? playerUrl;

  Anime(
      {this.id,
        this.title,
        this.poster,
        this.genre,
        this.status,
        this.type,
        this.totalEpisode,
        this.sub,
        this.playerUrl});

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = json['poster'];
    genre = json['genre'];
    status = json['status'];
    type = json['type'];
    totalEpisode = json['total_episode'];
    sub = json['sub'];
    playerUrl = json['player_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['poster'] = this.poster;
    data['genre'] = this.genre;
    data['status'] = this.status;
    data['type'] = this.type;
    data['total_episode'] = this.totalEpisode;
    data['sub'] = this.sub;
    data['player_url'] = this.playerUrl;
    return data;
  }
}
