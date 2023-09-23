// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$doctorListHash() => r'aa028d5d73eb6d554cb19c88c49ba247ae9ea50a';

///
/// provides list of doctors
///
///
/// Copied from [doctorList].
@ProviderFor(doctorList)
final doctorListProvider = FutureProvider<List<Doctor>>.internal(
  doctorList,
  name: r'doctorListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$doctorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DoctorListRef = FutureProviderRef<List<Doctor>>;

String _$getPackagesHash() => r'fce48451623c5956ed85722377a88757c086b3dc';

///
/// provides available packages
///
///
/// Copied from [getPackages].
@ProviderFor(getPackages)
final getPackagesProvider = AutoDisposeFutureProvider<Package>.internal(
  getPackages,
  name: r'getPackagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getPackagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPackagesRef = AutoDisposeFutureProviderRef<Package>;

String _$getBookingsHash() => r'190970b8ed56ab673daa8636d4e952c6417e7c30';

///
/// provides all bookings
///
///
/// Copied from [getBookings].
@ProviderFor(getBookings)
final getBookingsProvider = AutoDisposeFutureProvider<List<Booking>>.internal(
  getBookings,
  name: r'getBookingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getBookingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetBookingsRef = AutoDisposeFutureProviderRef<List<Booking>>;

String _$bookingConfirmationHash() =>
    r'29b67220af40b6fcdef14f38aaddf77812ccf667';

///
/// get confirmation for booking
///
///
/// Copied from [bookingConfirmation].
@ProviderFor(bookingConfirmation)
final bookingConfirmationProvider = AutoDisposeFutureProvider<Booking>.internal(
  bookingConfirmation,
  name: r'bookingConfirmationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bookingConfirmationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BookingConfirmationRef = AutoDisposeFutureProviderRef<Booking>;

String _$doctorByNameHash() => r'2e24310ab951ecbec2f07b69d19b6ad47b2e2479';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

///
/// get doctor details by name
///
///
/// Copied from [doctorByName].
@ProviderFor(doctorByName)
const doctorByNameProvider = DoctorByNameFamily();

///
/// get doctor details by name
///
///
/// Copied from [doctorByName].
class DoctorByNameFamily extends Family<Doctor> {
  ///
  /// get doctor details by name
  ///
  ///
  /// Copied from [doctorByName].
  const DoctorByNameFamily();

  ///
  /// get doctor details by name
  ///
  ///
  /// Copied from [doctorByName].
  DoctorByNameProvider call({
    required String doctorName,
  }) {
    return DoctorByNameProvider(
      doctorName: doctorName,
    );
  }

  @override
  DoctorByNameProvider getProviderOverride(
    covariant DoctorByNameProvider provider,
  ) {
    return call(
      doctorName: provider.doctorName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'doctorByNameProvider';
}

///
/// get doctor details by name
///
///
/// Copied from [doctorByName].
class DoctorByNameProvider extends AutoDisposeProvider<Doctor> {
  ///
  /// get doctor details by name
  ///
  ///
  /// Copied from [doctorByName].
  DoctorByNameProvider({
    required String doctorName,
  }) : this._internal(
          (ref) => doctorByName(
            ref as DoctorByNameRef,
            doctorName: doctorName,
          ),
          from: doctorByNameProvider,
          name: r'doctorByNameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$doctorByNameHash,
          dependencies: DoctorByNameFamily._dependencies,
          allTransitiveDependencies:
              DoctorByNameFamily._allTransitiveDependencies,
          doctorName: doctorName,
        );

  DoctorByNameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.doctorName,
  }) : super.internal();

  final String doctorName;

  @override
  Override overrideWith(
    Doctor Function(DoctorByNameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DoctorByNameProvider._internal(
        (ref) => create(ref as DoctorByNameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        doctorName: doctorName,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Doctor> createElement() {
    return _DoctorByNameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DoctorByNameProvider && other.doctorName == doctorName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, doctorName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DoctorByNameRef on AutoDisposeProviderRef<Doctor> {
  /// The parameter `doctorName` of this provider.
  String get doctorName;
}

class _DoctorByNameProviderElement extends AutoDisposeProviderElement<Doctor>
    with DoctorByNameRef {
  _DoctorByNameProviderElement(super.provider);

  @override
  String get doctorName => (origin as DoctorByNameProvider).doctorName;
}

String _$currentDoctorHash() => r'4fcf761816b5a51042718a9bc9393da05dc97ca4';

///
/// current doctor provider
/// override at run time to use
///
///
/// Copied from [currentDoctor].
@ProviderFor(currentDoctor)
final currentDoctorProvider = AutoDisposeProvider<Doctor>.internal(
  currentDoctor,
  name: r'currentDoctorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDoctorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentDoctorRef = AutoDisposeProviderRef<Doctor>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
