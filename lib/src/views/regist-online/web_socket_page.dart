import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert'; // For JSON encoding/decoding
import 'package:google_fonts/google_fonts.dart'; // For Google Fonts
import 'package:intl/intl.dart'; // For date formatting

// Data model for a single symbol entry from the WebSocket.
class SymbolData {
  final String symbol;
  final double bid;
  final double bidHigh;
  final double bidLow;
  final double ask;
  final double askHigh;
  final double askLow;
  final DateTime datetime;
  final String direction;

  SymbolData({
    required this.symbol,
    required this.bid,
    required this.bidHigh,
    required this.bidLow,
    required this.ask,
    required this.askHigh,
    required this.askLow,
    required this.datetime,
    required this.direction,
  });

  // Factory constructor to create a SymbolData object from a JSON map.
  factory SymbolData.fromJson(String symbol, Map<String, dynamic> json) {
    return SymbolData(
      symbol: symbol,
      bid: json['bid']?.toDouble() ?? 0.0,
      // Provide default values or handle nulls gracefully
      bidHigh: json['bid_high']?.toDouble() ?? 0.0,
      bidLow: json['bid_low']?.toDouble() ?? 0.0,
      ask: json['ask']?.toDouble() ?? 0.0,
      askHigh: json['ask_high']?.toDouble() ?? 0.0,
      askLow: json['ask_low']?.toDouble() ?? 0.0,
      // Convert Unix timestamp (seconds) to DateTime object.
      datetime: DateTime.fromMillisecondsSinceEpoch(
          (json['datetime']?.toInt() ?? 0) * 1000),
      direction: json['direction'] ?? 'UNKNOWN',
    );
  }
}

// WebSocketSymbolTablePage is a StatefulWidget to manage WebSocket connection and UI state.
class WebSocketSymbolTablePage extends StatefulWidget {
  const WebSocketSymbolTablePage({super.key});

  @override
  State<WebSocketSymbolTablePage> createState() =>
      _WebSocketSymbolTablePageState();
}

class _WebSocketSymbolTablePageState extends State<WebSocketSymbolTablePage> {
  // Replace with your actual WebSocket server IP and Port.
  // Example: 'ws://192.168.1.100:8080'
  final String _webSocketUrl = 'ws://45.76.163.26:9001'; // Placeholder URL
  WebSocketChannel? _channel; // WebSocket channel instance
  Map<String, SymbolData> _symbolData = {}; // Map to store real-time symbol data

  @override
  void initState() {
    super.initState();
    _connectWebSocket(); // Establish WebSocket connection when the widget initializes.
  }

  // Establishes the WebSocket connection.
  void _connectWebSocket() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(_webSocketUrl));

      // Listen for messages from the WebSocket.
      _channel?.stream.listen(
            (message) {
          // When a message is received, parse it and update the UI.
          _parseAndDisplayData(message);
        },
        // Handle when the WebSocket connection is closed.
        onDone: () {
          debugPrint('WebSocket connection closed.');
          // Optionally, try to reconnect after a delay.
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) {
              _connectWebSocket();
            }
          });
        },
        // Handle any errors that occur with the WebSocket.
        onError: (error) {
          debugPrint('WebSocket error: $error');
          // Optionally, try to reconnect after a delay.
          Future.delayed(const Duration(seconds: 5), () {
            if (mounted) {
              _connectWebSocket();
            }
          });
        },
      );
      debugPrint('WebSocket connected to $_webSocketUrl');
    } catch (e) {
      debugPrint('Error connecting to WebSocket: $e');
      // Optionally, try to reconnect after a delay.
      Future.delayed(const Duration(seconds: 5), () {
        if (mounted) {
          _connectWebSocket();
        }
      });
    }
  }

  // Parses the incoming JSON message and updates the symbol data map.
  void _parseAndDisplayData(String message) {
    try {
      final Map<String, dynamic> decodedData = json.decode(message);
      final Map<String, SymbolData> newSymbolData = {};

      decodedData.forEach((symbol, data) {
        if (data is Map<String, dynamic>) {
          newSymbolData[symbol] = SymbolData.fromJson(symbol, data);
        }
      });

      setState(() {
        _symbolData = newSymbolData; // Update the state to rebuild the UI.
      });
    } catch (e) {
      debugPrint('Error parsing JSON message: $e');
    }
  }

  // Sends dummy data to the WebSocket server for testing purposes.
  // This simulates the 'ws.send' from your HTML example.
  void _sendDummyData() {
    if (_channel != null) {
      final dummyData = {
        "EURUSD": {
          "bid": 1.17669,
          "bid_high": 1.17700,
          "bid_low": 1.17600,
          "ask": 1.17671,
          "ask_high": 1.17750,
          "ask_low": 1.17650,
          "datetime": 1753396308,
          "direction": "NORMAL"
        },
        "XAUUSD": {
          "bid": 3372.76000,
          "bid_high": 3373.000,
          "bid_low": 3372.000,
          "ask": 3372.77000,
          "ask_high": 3373.500,
          "ask_low": 3372.500,
          "datetime": 1753396313,
          "direction": "UP"
        },
        "GBPUSD": {
          "bid": 1.35160,
          "bid_high": 1.35200,
          "bid_low": 1.35100,
          "ask": 1.35163,
          "ask_high": 1.35250,
          "ask_low": 1.35150,
          "datetime": 1753396311,
          "direction": "DOWN"
        },
        "JPYUSD": {
          "bid": 156.123,
          "bid_high": 156.200,
          "bid_low": 156.100,
          "ask": 156.125,
          "ask_high": 156.250,
          "ask_low": 156.150,
          "datetime": 1753396315,
          "direction": "NORMAL"
        },
      };
      _channel?.sink.add(json.encode(dummyData));
      debugPrint('Sent dummy data.');
    } else {
      debugPrint('WebSocket not connected. Cannot send dummy data.');
    }
  }

  @override
  void dispose() {
    _channel?.sink.close(); // Close the WebSocket connection when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Data Symbol dari WebSocket',
          style: GoogleFonts.openSans(), // Apply Open Sans to AppBar title
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Allow horizontal scrolling for wide table
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _symbolData.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text(
                  'Connecting to WebSocket or waiting for data...',
                  style: GoogleFonts.openSans(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _sendDummyData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Button background
                    foregroundColor: Colors.white, // Button text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    'Send Dummy Data (for testing)',
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'WebSocket URL: $_webSocketUrl',
                  style: GoogleFonts.openSans(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          )
              : DataTable(
            // Customize data table appearance
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[700]!),
            dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey[800]!),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white30, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            columnSpacing: 16.0, // Space between columns
            horizontalMargin: 12.0, // Horizontal padding for the table
            columns: <DataColumn>[
              DataColumn(label: Text('Symbol', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Bid', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Bid High', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Bid Low', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Ask', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Ask High', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Ask Low', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Datetime', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Direction', style: GoogleFonts.openSans(fontWeight: FontWeight.bold))),
            ],
            rows: _symbolData.values.map((data) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(data.symbol, style: GoogleFonts.openSans(color: Colors.white))),
                  DataCell(Text(data.bid.toStringAsFixed(5), style: GoogleFonts.openSans(color: Colors.lightGreenAccent))),
                  DataCell(Text(data.bidHigh.toStringAsFixed(5), style: GoogleFonts.openSans(color: Colors.lightGreen))),
                  DataCell(Text(data.bidLow.toStringAsFixed(5), style: GoogleFonts.openSans(color: Colors.orange))),
                  DataCell(Text(data.ask.toStringAsFixed(5), style: GoogleFonts.openSans(color: Colors.redAccent))),
                  DataCell(Text(data.askHigh.toStringAsFixed(5), style: GoogleFonts.openSans(color: Colors.red))),
                  DataCell(Text(data.askLow.toStringAsFixed(5), style: GoogleFonts.openSans(color: Colors.deepOrange))),
                  DataCell(Text(
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(data.datetime),
                    style: GoogleFonts.openSans(color: Colors.white70),
                  )),
                  DataCell(Text(
                    data.direction,
                    style: GoogleFonts.openSans(
                      color: data.direction == 'UP'
                          ? Colors.green
                          : data.direction == 'DOWN'
                          ? Colors.red
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
