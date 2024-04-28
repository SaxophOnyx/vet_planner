// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MedicationTableTable extends MedicationTable
    with TableInfo<$MedicationTableTable, MedicationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _medicationTypeIdMeta =
      const VerificationMeta('medicationTypeId');
  @override
  late final GeneratedColumn<int> medicationTypeId = GeneratedColumn<int>(
      'medication_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _concentrationPerUnitMeta =
      const VerificationMeta('concentrationPerUnit');
  @override
  late final GeneratedColumn<int> concentrationPerUnit = GeneratedColumn<int>(
      'concentration_per_unit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, medicationTypeId, concentrationPerUnit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medication_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MedicationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('medication_type_id')) {
      context.handle(
          _medicationTypeIdMeta,
          medicationTypeId.isAcceptableOrUnknown(
              data['medication_type_id']!, _medicationTypeIdMeta));
    } else if (isInserting) {
      context.missing(_medicationTypeIdMeta);
    }
    if (data.containsKey('concentration_per_unit')) {
      context.handle(
          _concentrationPerUnitMeta,
          concentrationPerUnit.isAcceptableOrUnknown(
              data['concentration_per_unit']!, _concentrationPerUnitMeta));
    } else if (isInserting) {
      context.missing(_concentrationPerUnitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MedicationTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      medicationTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}medication_type_id'])!,
      concentrationPerUnit: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}concentration_per_unit'])!,
    );
  }

  @override
  $MedicationTableTable createAlias(String alias) {
    return $MedicationTableTable(attachedDatabase, alias);
  }
}

class MedicationTableData extends DataClass
    implements Insertable<MedicationTableData> {
  final int id;
  final String name;
  final int medicationTypeId;
  final int concentrationPerUnit;
  const MedicationTableData(
      {required this.id,
      required this.name,
      required this.medicationTypeId,
      required this.concentrationPerUnit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['medication_type_id'] = Variable<int>(medicationTypeId);
    map['concentration_per_unit'] = Variable<int>(concentrationPerUnit);
    return map;
  }

  MedicationTableCompanion toCompanion(bool nullToAbsent) {
    return MedicationTableCompanion(
      id: Value(id),
      name: Value(name),
      medicationTypeId: Value(medicationTypeId),
      concentrationPerUnit: Value(concentrationPerUnit),
    );
  }

  factory MedicationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MedicationTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      medicationTypeId: serializer.fromJson<int>(json['medicationTypeId']),
      concentrationPerUnit:
          serializer.fromJson<int>(json['concentrationPerUnit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'medicationTypeId': serializer.toJson<int>(medicationTypeId),
      'concentrationPerUnit': serializer.toJson<int>(concentrationPerUnit),
    };
  }

  MedicationTableData copyWith(
          {int? id,
          String? name,
          int? medicationTypeId,
          int? concentrationPerUnit}) =>
      MedicationTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        medicationTypeId: medicationTypeId ?? this.medicationTypeId,
        concentrationPerUnit: concentrationPerUnit ?? this.concentrationPerUnit,
      );
  @override
  String toString() {
    return (StringBuffer('MedicationTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('medicationTypeId: $medicationTypeId, ')
          ..write('concentrationPerUnit: $concentrationPerUnit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, medicationTypeId, concentrationPerUnit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MedicationTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.medicationTypeId == this.medicationTypeId &&
          other.concentrationPerUnit == this.concentrationPerUnit);
}

class MedicationTableCompanion extends UpdateCompanion<MedicationTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> medicationTypeId;
  final Value<int> concentrationPerUnit;
  const MedicationTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.medicationTypeId = const Value.absent(),
    this.concentrationPerUnit = const Value.absent(),
  });
  MedicationTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int medicationTypeId,
    required int concentrationPerUnit,
  })  : name = Value(name),
        medicationTypeId = Value(medicationTypeId),
        concentrationPerUnit = Value(concentrationPerUnit);
  static Insertable<MedicationTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? medicationTypeId,
    Expression<int>? concentrationPerUnit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (medicationTypeId != null) 'medication_type_id': medicationTypeId,
      if (concentrationPerUnit != null)
        'concentration_per_unit': concentrationPerUnit,
    });
  }

  MedicationTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? medicationTypeId,
      Value<int>? concentrationPerUnit}) {
    return MedicationTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      medicationTypeId: medicationTypeId ?? this.medicationTypeId,
      concentrationPerUnit: concentrationPerUnit ?? this.concentrationPerUnit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (medicationTypeId.present) {
      map['medication_type_id'] = Variable<int>(medicationTypeId.value);
    }
    if (concentrationPerUnit.present) {
      map['concentration_per_unit'] = Variable<int>(concentrationPerUnit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('medicationTypeId: $medicationTypeId, ')
          ..write('concentrationPerUnit: $concentrationPerUnit')
          ..write(')'))
        .toString();
  }
}

class $StoredMedicationsTableTable extends StoredMedicationsTable
    with TableInfo<$StoredMedicationsTableTable, StoredMedicationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoredMedicationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _medicationIdMeta =
      const VerificationMeta('medicationId');
  @override
  late final GeneratedColumn<int> medicationId = GeneratedColumn<int>(
      'medication_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _initialQuantityMeta =
      const VerificationMeta('initialQuantity');
  @override
  late final GeneratedColumn<int> initialQuantity = GeneratedColumn<int>(
      'initial_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _freeQuantityMeta =
      const VerificationMeta('freeQuantity');
  @override
  late final GeneratedColumn<int> freeQuantity = GeneratedColumn<int>(
      'free_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reservedQuantityMeta =
      const VerificationMeta('reservedQuantity');
  @override
  late final GeneratedColumn<int> reservedQuantity = GeneratedColumn<int>(
      'reserved_quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expirationDateMsSinceEpochMeta =
      const VerificationMeta('expirationDateMsSinceEpoch');
  @override
  late final GeneratedColumn<int> expirationDateMsSinceEpoch =
      GeneratedColumn<int>('expiration_date_ms_since_epoch', aliasedName, false,
          type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _manualTitleMeta =
      const VerificationMeta('manualTitle');
  @override
  late final GeneratedColumn<String> manualTitle = GeneratedColumn<String>(
      'manual_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        medicationId,
        initialQuantity,
        freeQuantity,
        reservedQuantity,
        expirationDateMsSinceEpoch,
        manualTitle
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stored_medications_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StoredMedicationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('medication_id')) {
      context.handle(
          _medicationIdMeta,
          medicationId.isAcceptableOrUnknown(
              data['medication_id']!, _medicationIdMeta));
    } else if (isInserting) {
      context.missing(_medicationIdMeta);
    }
    if (data.containsKey('initial_quantity')) {
      context.handle(
          _initialQuantityMeta,
          initialQuantity.isAcceptableOrUnknown(
              data['initial_quantity']!, _initialQuantityMeta));
    } else if (isInserting) {
      context.missing(_initialQuantityMeta);
    }
    if (data.containsKey('free_quantity')) {
      context.handle(
          _freeQuantityMeta,
          freeQuantity.isAcceptableOrUnknown(
              data['free_quantity']!, _freeQuantityMeta));
    } else if (isInserting) {
      context.missing(_freeQuantityMeta);
    }
    if (data.containsKey('reserved_quantity')) {
      context.handle(
          _reservedQuantityMeta,
          reservedQuantity.isAcceptableOrUnknown(
              data['reserved_quantity']!, _reservedQuantityMeta));
    } else if (isInserting) {
      context.missing(_reservedQuantityMeta);
    }
    if (data.containsKey('expiration_date_ms_since_epoch')) {
      context.handle(
          _expirationDateMsSinceEpochMeta,
          expirationDateMsSinceEpoch.isAcceptableOrUnknown(
              data['expiration_date_ms_since_epoch']!,
              _expirationDateMsSinceEpochMeta));
    } else if (isInserting) {
      context.missing(_expirationDateMsSinceEpochMeta);
    }
    if (data.containsKey('manual_title')) {
      context.handle(
          _manualTitleMeta,
          manualTitle.isAcceptableOrUnknown(
              data['manual_title']!, _manualTitleMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoredMedicationsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredMedicationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      medicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}medication_id'])!,
      initialQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}initial_quantity'])!,
      freeQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}free_quantity'])!,
      reservedQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reserved_quantity'])!,
      expirationDateMsSinceEpoch: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}expiration_date_ms_since_epoch'])!,
      manualTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}manual_title']),
    );
  }

  @override
  $StoredMedicationsTableTable createAlias(String alias) {
    return $StoredMedicationsTableTable(attachedDatabase, alias);
  }
}

class StoredMedicationsTableData extends DataClass
    implements Insertable<StoredMedicationsTableData> {
  final int id;
  final int medicationId;
  final int initialQuantity;
  final int freeQuantity;
  final int reservedQuantity;
  final int expirationDateMsSinceEpoch;
  final String? manualTitle;
  const StoredMedicationsTableData(
      {required this.id,
      required this.medicationId,
      required this.initialQuantity,
      required this.freeQuantity,
      required this.reservedQuantity,
      required this.expirationDateMsSinceEpoch,
      this.manualTitle});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['medication_id'] = Variable<int>(medicationId);
    map['initial_quantity'] = Variable<int>(initialQuantity);
    map['free_quantity'] = Variable<int>(freeQuantity);
    map['reserved_quantity'] = Variable<int>(reservedQuantity);
    map['expiration_date_ms_since_epoch'] =
        Variable<int>(expirationDateMsSinceEpoch);
    if (!nullToAbsent || manualTitle != null) {
      map['manual_title'] = Variable<String>(manualTitle);
    }
    return map;
  }

  StoredMedicationsTableCompanion toCompanion(bool nullToAbsent) {
    return StoredMedicationsTableCompanion(
      id: Value(id),
      medicationId: Value(medicationId),
      initialQuantity: Value(initialQuantity),
      freeQuantity: Value(freeQuantity),
      reservedQuantity: Value(reservedQuantity),
      expirationDateMsSinceEpoch: Value(expirationDateMsSinceEpoch),
      manualTitle: manualTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(manualTitle),
    );
  }

  factory StoredMedicationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredMedicationsTableData(
      id: serializer.fromJson<int>(json['id']),
      medicationId: serializer.fromJson<int>(json['medicationId']),
      initialQuantity: serializer.fromJson<int>(json['initialQuantity']),
      freeQuantity: serializer.fromJson<int>(json['freeQuantity']),
      reservedQuantity: serializer.fromJson<int>(json['reservedQuantity']),
      expirationDateMsSinceEpoch:
          serializer.fromJson<int>(json['expirationDateMsSinceEpoch']),
      manualTitle: serializer.fromJson<String?>(json['manualTitle']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicationId': serializer.toJson<int>(medicationId),
      'initialQuantity': serializer.toJson<int>(initialQuantity),
      'freeQuantity': serializer.toJson<int>(freeQuantity),
      'reservedQuantity': serializer.toJson<int>(reservedQuantity),
      'expirationDateMsSinceEpoch':
          serializer.toJson<int>(expirationDateMsSinceEpoch),
      'manualTitle': serializer.toJson<String?>(manualTitle),
    };
  }

  StoredMedicationsTableData copyWith(
          {int? id,
          int? medicationId,
          int? initialQuantity,
          int? freeQuantity,
          int? reservedQuantity,
          int? expirationDateMsSinceEpoch,
          Value<String?> manualTitle = const Value.absent()}) =>
      StoredMedicationsTableData(
        id: id ?? this.id,
        medicationId: medicationId ?? this.medicationId,
        initialQuantity: initialQuantity ?? this.initialQuantity,
        freeQuantity: freeQuantity ?? this.freeQuantity,
        reservedQuantity: reservedQuantity ?? this.reservedQuantity,
        expirationDateMsSinceEpoch:
            expirationDateMsSinceEpoch ?? this.expirationDateMsSinceEpoch,
        manualTitle: manualTitle.present ? manualTitle.value : this.manualTitle,
      );
  @override
  String toString() {
    return (StringBuffer('StoredMedicationsTableData(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('initialQuantity: $initialQuantity, ')
          ..write('freeQuantity: $freeQuantity, ')
          ..write('reservedQuantity: $reservedQuantity, ')
          ..write('expirationDateMsSinceEpoch: $expirationDateMsSinceEpoch, ')
          ..write('manualTitle: $manualTitle')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, medicationId, initialQuantity,
      freeQuantity, reservedQuantity, expirationDateMsSinceEpoch, manualTitle);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredMedicationsTableData &&
          other.id == this.id &&
          other.medicationId == this.medicationId &&
          other.initialQuantity == this.initialQuantity &&
          other.freeQuantity == this.freeQuantity &&
          other.reservedQuantity == this.reservedQuantity &&
          other.expirationDateMsSinceEpoch == this.expirationDateMsSinceEpoch &&
          other.manualTitle == this.manualTitle);
}

class StoredMedicationsTableCompanion
    extends UpdateCompanion<StoredMedicationsTableData> {
  final Value<int> id;
  final Value<int> medicationId;
  final Value<int> initialQuantity;
  final Value<int> freeQuantity;
  final Value<int> reservedQuantity;
  final Value<int> expirationDateMsSinceEpoch;
  final Value<String?> manualTitle;
  const StoredMedicationsTableCompanion({
    this.id = const Value.absent(),
    this.medicationId = const Value.absent(),
    this.initialQuantity = const Value.absent(),
    this.freeQuantity = const Value.absent(),
    this.reservedQuantity = const Value.absent(),
    this.expirationDateMsSinceEpoch = const Value.absent(),
    this.manualTitle = const Value.absent(),
  });
  StoredMedicationsTableCompanion.insert({
    this.id = const Value.absent(),
    required int medicationId,
    required int initialQuantity,
    required int freeQuantity,
    required int reservedQuantity,
    required int expirationDateMsSinceEpoch,
    this.manualTitle = const Value.absent(),
  })  : medicationId = Value(medicationId),
        initialQuantity = Value(initialQuantity),
        freeQuantity = Value(freeQuantity),
        reservedQuantity = Value(reservedQuantity),
        expirationDateMsSinceEpoch = Value(expirationDateMsSinceEpoch);
  static Insertable<StoredMedicationsTableData> custom({
    Expression<int>? id,
    Expression<int>? medicationId,
    Expression<int>? initialQuantity,
    Expression<int>? freeQuantity,
    Expression<int>? reservedQuantity,
    Expression<int>? expirationDateMsSinceEpoch,
    Expression<String>? manualTitle,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicationId != null) 'medication_id': medicationId,
      if (initialQuantity != null) 'initial_quantity': initialQuantity,
      if (freeQuantity != null) 'free_quantity': freeQuantity,
      if (reservedQuantity != null) 'reserved_quantity': reservedQuantity,
      if (expirationDateMsSinceEpoch != null)
        'expiration_date_ms_since_epoch': expirationDateMsSinceEpoch,
      if (manualTitle != null) 'manual_title': manualTitle,
    });
  }

  StoredMedicationsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? medicationId,
      Value<int>? initialQuantity,
      Value<int>? freeQuantity,
      Value<int>? reservedQuantity,
      Value<int>? expirationDateMsSinceEpoch,
      Value<String?>? manualTitle}) {
    return StoredMedicationsTableCompanion(
      id: id ?? this.id,
      medicationId: medicationId ?? this.medicationId,
      initialQuantity: initialQuantity ?? this.initialQuantity,
      freeQuantity: freeQuantity ?? this.freeQuantity,
      reservedQuantity: reservedQuantity ?? this.reservedQuantity,
      expirationDateMsSinceEpoch:
          expirationDateMsSinceEpoch ?? this.expirationDateMsSinceEpoch,
      manualTitle: manualTitle ?? this.manualTitle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicationId.present) {
      map['medication_id'] = Variable<int>(medicationId.value);
    }
    if (initialQuantity.present) {
      map['initial_quantity'] = Variable<int>(initialQuantity.value);
    }
    if (freeQuantity.present) {
      map['free_quantity'] = Variable<int>(freeQuantity.value);
    }
    if (reservedQuantity.present) {
      map['reserved_quantity'] = Variable<int>(reservedQuantity.value);
    }
    if (expirationDateMsSinceEpoch.present) {
      map['expiration_date_ms_since_epoch'] =
          Variable<int>(expirationDateMsSinceEpoch.value);
    }
    if (manualTitle.present) {
      map['manual_title'] = Variable<String>(manualTitle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoredMedicationsTableCompanion(')
          ..write('id: $id, ')
          ..write('medicationId: $medicationId, ')
          ..write('initialQuantity: $initialQuantity, ')
          ..write('freeQuantity: $freeQuantity, ')
          ..write('reservedQuantity: $reservedQuantity, ')
          ..write('expirationDateMsSinceEpoch: $expirationDateMsSinceEpoch, ')
          ..write('manualTitle: $manualTitle')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MedicationTableTable medicationTable =
      $MedicationTableTable(this);
  late final $StoredMedicationsTableTable storedMedicationsTable =
      $StoredMedicationsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [medicationTable, storedMedicationsTable];
}
