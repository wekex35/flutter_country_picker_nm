[![Pub](https://img.shields.io/badge/Pub-0.0.1-orange.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_country_picker_nm)

# flutter_country_picker_nm
A Flutter Country Picker Widget with support to country dialing codes.It is forked from flutter_country_picker to implement null-safety and further development

<img src="https://github.com/wekex35/flutter_country_picker_nm/blob/master/example/img/1.png?raw=true" width="200"/>  
<img src="https://github.com/wekex35/flutter_country_picker_nm/blob/master/example/img/2.png?raw=true" width="200"/>

## Usage

Add the CountryPicker widget in your layout and use the `onChanged` callback.  
[Full example](https://github.com/wekex35/flutter_country_picker_nm/tree/master/example)

 ```dart
 
///full Great Britain sample.
///static const Country GB = Country(
///    asset: "assets/flags/gb_flag.png",
///    dialingCode: "44",
///    isoCode: "GB",
///    name: "United Kingdom",
///    currency: "British pound",
///    currencyISO: "GBP",
///  );


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Flutter Country Picker Demo'),
      ),
      body: new Center(
        child: CountryPicker(
          dense: false,
          showFlag: true,  //displays flag, true by default
          showDialingCode: false, //displays dialing code, false by default
          showName: true, //displays country name, true by default
          showCurrency: false, //eg. 'British pound'
          showCurrencyISO: true, //eg. 'GBP'
          onChanged: (Country country) {
            setState(() {
              _selected = country;
            });
          },
          selectedCountry: _selected,
        ),
      ),
    );
  }

 ```
