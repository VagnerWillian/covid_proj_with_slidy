class CountryModel {
  String _country;
  int _cases;
  int _todayCases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _active;
  int _critical;
  int _casesPerOneMillion;
  int _deathsPerOneMillion;

  CountryModel(
      {String country,
        int cases,
        int todayCases,
        int deaths,
        int todayDeaths,
        int recovered,
        int active,
        int critical,
        int casesPerOneMillion,
        int deathsPerOneMillion}) {
    this._country = country;
    this._cases = cases;
    this._todayCases = todayCases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
    this._deathsPerOneMillion = deathsPerOneMillion;
  }

  String get country => _country;
  set country(String country) => _country = country;
  int get cases => _cases;
  set cases(int cases) => _cases = cases;
  int get todayCases => _todayCases;
  set todayCases(int todayCases) => _todayCases = todayCases;
  int get deaths => _deaths;
  set deaths(int deaths) => _deaths = deaths;
  int get todayDeaths => _todayDeaths;
  set todayDeaths(int todayDeaths) => _todayDeaths = todayDeaths;
  int get recovered => _recovered;
  set recovered(int recovered) => _recovered = recovered;
  int get active => _active;
  set active(int active) => _active = active;
  int get critical => _critical;
  set critical(int critical) => _critical = critical;
  int get casesPerOneMillion => _casesPerOneMillion;
  set casesPerOneMillion(int casesPerOneMillion) =>
      _casesPerOneMillion = casesPerOneMillion;
  int get deathsPerOneMillion => _deathsPerOneMillion;
  set deathsPerOneMillion(int deathsPerOneMillion) =>
      _deathsPerOneMillion = deathsPerOneMillion;

  CountryModel.fromJson(Map<String, dynamic> json) {
    _country = json['country'] ?? "";
    _cases = json['cases'] ?? 0;
    _todayCases = json['todayCases'] ?? 0;
    _deaths = json['deaths'] ?? 0;
    _todayDeaths = json['todayDeaths'] ?? 0;
    _recovered = json['recovered'] ?? 0;
    _active = json['active'] ?? 0;
    _critical = json['critical'] ?? 0;
    _casesPerOneMillion = json['casesPerOneMillion'] ?? 0;
    _deathsPerOneMillion = json['deathsPerOneMillion'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this._country;
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['casesPerOneMillion'] = this._casesPerOneMillion;
    data['deathsPerOneMillion'] = this._deathsPerOneMillion;
    return data;
  }
}
