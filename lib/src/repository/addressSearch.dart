import 'package:flutter/material.dart';
import 'package:projucti_app/src/repository/placesService.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  PlaceApiProvider placeApiProvider;
  final sessionToken;
  AddressSearch(this.sessionToken){
    placeApiProvider=new PlaceApiProvider(sessionToken);
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(

      future: query.length>0?placeApiProvider.fetchSuggestions(query):null,
      builder: (context, snapshot) => query == ''
          ? Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Enter your address'),
      )
          : snapshot.hasData
          ? ListView.builder(
        itemBuilder: (context, index) => ListTile(


          title:
          Text(snapshot.data[index]),
          onTap: () {
            close(context, snapshot.data[index]);
          },
        ),
        itemCount: snapshot.data.length,
      )
          : Container(
        width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.all(16.0),
          child: Center(child: CircularProgressIndicator())),
    );
  }
}