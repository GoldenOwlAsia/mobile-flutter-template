import 'dart:math';

/// Map and geolocation utility class
/// Provides methods for calculating distances between coordinates
/// and performing location-based operations
class MapUtils {
  // Private constructor to prevent instantiation
  MapUtils._();

  // MARK: - Constants

  /// Earth's radius in kilometers
  static const double _earthRadiusKm = 6371.0;

  /// Conversion factor from degrees to radians
  static const double _degreesToRadians = pi / 180.0;

  // MARK: - Distance Calculations

  /// Calculate the distance between two geographic points using the Haversine formula
  ///
  /// Returns the distance in kilometers between two latitude/longitude coordinates.
  /// Uses the Haversine formula which accounts for the Earth's spherical shape.
  ///
  /// Parameters:
  /// - [lat1]: Latitude of the first point in degrees
  /// - [lng1]: Longitude of the first point in degrees
  /// - [lat2]: Latitude of the second point in degrees
  /// - [lng2]: Longitude of the second point in degrees
  ///
  /// Returns:
  /// - [double?]: Distance in kilometers, or null if any coordinate is null
  ///
  /// Example:
  /// ```dart
  /// final distance = MapUtils.getDistanceFromLatLonInKm(
  ///   40.7128, -74.0060,  // New York City
  ///   34.0522, -118.2437  // Los Angeles
  /// );
  /// // Returns approximately 3944.4 km
  /// ```
  static double? getDistanceFromLatLonInKm(
    double? lat1,
    double? lng1,
    double? lat2,
    double? lng2,
  ) {
    // Validate input coordinates
    if (lat1 == null || lng1 == null || lat2 == null || lng2 == null) {
      return null;
    }

    // Validate coordinate ranges
    if (!_isValidLatitude(lat1) ||
        !_isValidLatitude(lat2) ||
        !_isValidLongitude(lng1) ||
        !_isValidLongitude(lng2)) {
      return null;
    }

    // If coordinates are identical, distance is 0
    if (lat1 == lat2 && lng1 == lng2) {
      return 0.0;
    }

    // Convert degrees to radians
    final lat1Rad = lat1 * _degreesToRadians;
    final lat2Rad = lat2 * _degreesToRadians;
    final deltaLatRad = (lat2 - lat1) * _degreesToRadians;
    final deltaLngRad = (lng2 - lng1) * _degreesToRadians;

    // Haversine formula
    final a = sin(deltaLatRad / 2) * sin(deltaLatRad / 2) +
        cos(lat1Rad) *
            cos(lat2Rad) *
            sin(deltaLngRad / 2) *
            sin(deltaLngRad / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    final distance = _earthRadiusKm * c;

    return distance;
  }

  /// Calculate the distance between two geographic points in meters
  ///
  /// Convenience method that returns distance in meters instead of kilometers.
  ///
  /// Parameters:
  /// - [lat1]: Latitude of the first point in degrees
  /// - [lng1]: Longitude of the first point in degrees
  /// - [lat2]: Latitude of the second point in degrees
  /// - [lng2]: Longitude of the second point in degrees
  ///
  /// Returns:
  /// - [double?]: Distance in meters, or null if any coordinate is null
  static double? getDistanceFromLatLonInMeters(
    double? lat1,
    double? lng1,
    double? lat2,
    double? lng2,
  ) {
    final distanceKm = getDistanceFromLatLonInKm(lat1, lng1, lat2, lng2);
    return distanceKm != null ? distanceKm * 1000 : null;
  }

  // MARK: - Distance Filtering

  /// Check if the distance between two points exceeds a minimum threshold
  ///
  /// Useful for filtering location updates to avoid processing minor movements.
  /// Returns true if the distance is greater than or equal to the filter threshold.
  ///
  /// Parameters:
  /// - [lat1]: Latitude of the first point in degrees
  /// - [lng1]: Longitude of the first point in degrees
  /// - [lat2]: Latitude of the second point in degrees
  /// - [lng2]: Longitude of the second point in degrees
  /// - [distanceFilter]: Minimum distance threshold in meters (default: 10m)
  ///
  /// Returns:
  /// - [bool?]: True if distance >= threshold, false otherwise, null if coordinates invalid
  ///
  /// Example:
  /// ```dart
  /// final shouldUpdate = MapUtils.checkDistanceFilter(
  ///   oldLat, oldLng, newLat, newLng,
  ///   distanceFilter: 50, // Only update if moved 50+ meters
  /// );
  /// ```
  static bool? checkDistanceFilter(
    double? lat1,
    double? lng1,
    double? lat2,
    double? lng2, {
    double distanceFilter = 10.0,
  }) {
    // Validate input coordinates
    if (lat1 == null || lng1 == null || lat2 == null || lng2 == null) {
      return null;
    }

    // Ensure filter is non-negative
    final filter = distanceFilter < 0 ? 0.0 : distanceFilter;

    final distanceMeters =
        getDistanceFromLatLonInMeters(lat1, lng1, lat2, lng2);

    if (distanceMeters != null) {
      return distanceMeters >= filter;
    }

    // If distance calculation failed, assume we should update
    return true;
  }

  // MARK: - Coordinate Validation

  /// Check if a latitude value is valid (between -90 and 90 degrees)
  static bool _isValidLatitude(double latitude) {
    return latitude >= -90.0 && latitude <= 90.0;
  }

  /// Check if a longitude value is valid (between -180 and 180 degrees)
  static bool _isValidLongitude(double longitude) {
    return longitude >= -180.0 && longitude <= 180.0;
  }

  /// Validate if coordinates represent a valid geographic location
  ///
  /// Parameters:
  /// - [latitude]: Latitude in degrees
  /// - [longitude]: Longitude in degrees
  ///
  /// Returns:
  /// - [bool]: True if coordinates are valid, false otherwise
  static bool isValidCoordinate(double? latitude, double? longitude) {
    if (latitude == null || longitude == null) return false;
    return _isValidLatitude(latitude) && _isValidLongitude(longitude);
  }

  // MARK: - Coordinate Utilities

  /// Normalize longitude to be within -180 to 180 degrees
  ///
  /// Handles longitude values that exceed the standard range by wrapping them.
  ///
  /// Parameters:
  /// - [longitude]: Longitude value to normalize
  ///
  /// Returns:
  /// - [double]: Normalized longitude between -180 and 180 degrees
  static double normalizeLongitude(double longitude) {
    double normalized = longitude % 360.0;
    if (normalized > 180.0) {
      normalized -= 360.0;
    } else if (normalized < -180.0) {
      normalized += 360.0;
    }
    return normalized;
  }

  /// Calculate the bearing (direction) from one point to another
  ///
  /// Returns the initial bearing (forward azimuth) from the first point
  /// to the second point in degrees (0-360, where 0 is North).
  ///
  /// Parameters:
  /// - [lat1]: Latitude of the starting point in degrees
  /// - [lng1]: Longitude of the starting point in degrees
  /// - [lat2]: Latitude of the destination point in degrees
  /// - [lng2]: Longitude of the destination point in degrees
  ///
  /// Returns:
  /// - [double?]: Bearing in degrees (0-360), or null if coordinates invalid
  static double? getBearing(
    double? lat1,
    double? lng1,
    double? lat2,
    double? lng2,
  ) {
    if (!isValidCoordinate(lat1, lng1) || !isValidCoordinate(lat2, lng2)) {
      return null;
    }

    final lat1Rad = lat1! * _degreesToRadians;
    final lat2Rad = lat2! * _degreesToRadians;
    final deltaLngRad = (lng2! - lng1!) * _degreesToRadians;

    final y = sin(deltaLngRad) * cos(lat2Rad);
    final x = cos(lat1Rad) * sin(lat2Rad) -
        sin(lat1Rad) * cos(lat2Rad) * cos(deltaLngRad);

    final bearingRad = atan2(y, x);
    final bearingDeg = bearingRad * (180 / pi);

    // Normalize to 0-360 degrees
    return (bearingDeg + 360) % 360;
  }
}
