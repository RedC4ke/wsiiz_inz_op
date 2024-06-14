// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bucket_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bucketListControllerHash() =>
    r'd3b18f59c4740c6098aaace241d2a8386695b188';

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

abstract class _$BucketListController
    extends BuildlessAutoDisposeNotifier<LoadableState<List<BucketListItem>>> {
  late final BucketList list;

  LoadableState<List<BucketListItem>> build(
    BucketList list,
  );
}

/// See also [BucketListController].
@ProviderFor(BucketListController)
const bucketListControllerProvider = BucketListControllerFamily();

/// See also [BucketListController].
class BucketListControllerFamily
    extends Family<LoadableState<List<BucketListItem>>> {
  /// See also [BucketListController].
  const BucketListControllerFamily();

  /// See also [BucketListController].
  BucketListControllerProvider call(
    BucketList list,
  ) {
    return BucketListControllerProvider(
      list,
    );
  }

  @override
  BucketListControllerProvider getProviderOverride(
    covariant BucketListControllerProvider provider,
  ) {
    return call(
      provider.list,
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
  String? get name => r'bucketListControllerProvider';
}

/// See also [BucketListController].
class BucketListControllerProvider extends AutoDisposeNotifierProviderImpl<
    BucketListController, LoadableState<List<BucketListItem>>> {
  /// See also [BucketListController].
  BucketListControllerProvider(
    BucketList list,
  ) : this._internal(
          () => BucketListController()..list = list,
          from: bucketListControllerProvider,
          name: r'bucketListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bucketListControllerHash,
          dependencies: BucketListControllerFamily._dependencies,
          allTransitiveDependencies:
              BucketListControllerFamily._allTransitiveDependencies,
          list: list,
        );

  BucketListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.list,
  }) : super.internal();

  final BucketList list;

  @override
  LoadableState<List<BucketListItem>> runNotifierBuild(
    covariant BucketListController notifier,
  ) {
    return notifier.build(
      list,
    );
  }

  @override
  Override overrideWith(BucketListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BucketListControllerProvider._internal(
        () => create()..list = list,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        list: list,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BucketListController,
      LoadableState<List<BucketListItem>>> createElement() {
    return _BucketListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BucketListControllerProvider && other.list == list;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, list.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BucketListControllerRef
    on AutoDisposeNotifierProviderRef<LoadableState<List<BucketListItem>>> {
  /// The parameter `list` of this provider.
  BucketList get list;
}

class _BucketListControllerProviderElement
    extends AutoDisposeNotifierProviderElement<BucketListController,
        LoadableState<List<BucketListItem>>> with BucketListControllerRef {
  _BucketListControllerProviderElement(super.provider);

  @override
  BucketList get list => (origin as BucketListControllerProvider).list;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
