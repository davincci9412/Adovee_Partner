import 'package:adovee_partner/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';
import 'package:flutter/rendering.dart';

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}
 
class _AppointmentsPageState extends State<AppointmentsPage> {
  TextEditingController _searchController = TextEditingController();
  
  List wonders = [
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "Taj Mahal",
        country: "India"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Christ-the-Redeemer.jpg",
        name: "Christ the Redeemer",
        country: "Brazil"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2016/03/petra-jordan9.jpg",
        name: "Petra",
        country: "Jordan"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Great-Wall-of-China-view.jpg",
        name: "The Great Wall of China",
        country: "China"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/View-of-the-Colosseum.jpg",
        name: "The Colosseum",
        country: "Rome"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Machu-Picchu-around-sunset.jpg",
        name: "Machu Picchu",
        country: "Peru"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Chichen-Itza-at-night.jpg",
        name: "Chichén Itzá",
        country: "Mexico"),
  ];

  Widget appointmentsTable()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: DataTable(
        columns: [
          DataColumn(label: Text('Item Type')),
          DataColumn(label: Text('Sales'), numeric: true),
          DataColumn(label: Text('Refund'), numeric: true),
          DataColumn(label: Text('Total')),
        ], 
        rows: [
          DataRow(cells: [
           DataCell(Text('Service')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Products')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Vouchers')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Late cancellation fees')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('No show fees')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Total Sales')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          
        ]
        )
    );
  }


  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Appointments",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search by Reference or Client",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchController.text.isEmpty
                          ? null
                          : InkWell(
                              onTap: () => _searchController.clear(),
                              child: Icon(Icons.clear),
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                appointmentsTable(),
                PaginatedDataTable(
                  header: Text('Data Table Header'), 
                  columns: [
                    DataColumn(label: Text('name')),
                    DataColumn(label: Text('gener')),
                    DataColumn(label: Text('css')),
                    DataColumn(label: Text('csdf')),
                    DataColumn(label: Text('csdf')),
                    DataColumn(label: Text('csdf')),
                    DataColumn(label: Text('csdf')),

                  ], 
                  source: dts,
                  onRowsPerPageChanged: (r) {
                    setState(() {
                      _rowPerPage = r;
                    });
                  },
                  rowsPerPage: _rowPerPage,
                  horizontalMargin: 20,)
              ],
            )
        ),

      ), 
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(current: 1)),
        );

        return false;
      },
      
    );
  }
}

class DTS extends DataTableSource
{
  
  @override
  DataRow getRow(int index)
  {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text("cell1")),
        DataCell(Text("cell2")),
        DataCell(Text("cell3")),
        DataCell(Text("cell4")),
        DataCell(Text("cell4")),
        DataCell(Text("cell4")),
        DataCell(Text("cell4")),

      ]
    );
  }

  @override
  bool get isRowCountApproximate =>false;

  @override
  int get rowCount => 10;

  @override
  int get selectedRowCount => 0;
}