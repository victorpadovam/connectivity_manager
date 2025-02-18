# Connectivity Manager

`connectivity_manager` is a Flutter package for monitoring and managing network connectivity in Flutter apps. With this package, you can easily check the connectivity status (online or offline) and whether the device is connected via Wi-Fi or mobile data. It also provides the ability to listen to network connectivity changes in real-time.

## Installation

To add `connectivity_manager` to your project, add the following dependency in your `pubspec.yaml` file:

```
dependencies:
  connectivity_manager:
```

```
import 'package:connectivity_manager/connectivity_service.dart';
final ConnectivityService connectivityService = ConnectivityService();
```

##  Checking Initial Connectivity

```
ConnectivityResult result = await connectivityService.checkConnectivity();

if (result == ConnectivityResult.none) {
  print("No internet connection.");
} else if (result == ConnectivityResult.wifi) {
  print("Connected via Wi-Fi.");
} else if (result == ConnectivityResult.mobile) {
  print("Connected via Mobile Data.");
}

```

##  Connectivity Results

```
ConnectivityResult.none: No internet connection. The device is offline.
ConnectivityResult.wifi: The device is connected via Wi-Fi. However, this doesn't guarantee that the network has internet access.
ConnectivityResult.mobile: The device is connected via mobile data. This doesn't guarantee that the network has internet access either.
```

##  Listening to Connectivity Change

```
connectivityService.connectivityStream.listen((ConnectivityResult result) {
  if (result == ConnectivityResult.none) {
    // No internet connection
    print("No internet connection.");
  } else if (result == ConnectivityResult.wifi) {
    // Connected via Wi-Fi
    print("Connected via Wi-Fi.");
  } else if (result == ConnectivityResult.mobile) {
    // Connected via Mobile Data
    print("Connected via Mobile Data.");
  }
});
```