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

class $PrescriptionTableTable extends PrescriptionTable
    with TableInfo<$PrescriptionTableTable, PrescriptionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrescriptionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<int> patientId = GeneratedColumn<int>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, patientId, comment];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prescription_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PrescriptionTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrescriptionTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrescriptionTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}patient_id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
    );
  }

  @override
  $PrescriptionTableTable createAlias(String alias) {
    return $PrescriptionTableTable(attachedDatabase, alias);
  }
}

class PrescriptionTableData extends DataClass
    implements Insertable<PrescriptionTableData> {
  final int id;
  final int patientId;
  final String? comment;
  const PrescriptionTableData(
      {required this.id, required this.patientId, this.comment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['patient_id'] = Variable<int>(patientId);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  PrescriptionTableCompanion toCompanion(bool nullToAbsent) {
    return PrescriptionTableCompanion(
      id: Value(id),
      patientId: Value(patientId),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory PrescriptionTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrescriptionTableData(
      id: serializer.fromJson<int>(json['id']),
      patientId: serializer.fromJson<int>(json['patientId']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'patientId': serializer.toJson<int>(patientId),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  PrescriptionTableData copyWith(
          {int? id,
          int? patientId,
          Value<String?> comment = const Value.absent()}) =>
      PrescriptionTableData(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        comment: comment.present ? comment.value : this.comment,
      );
  @override
  String toString() {
    return (StringBuffer('PrescriptionTableData(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patientId, comment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescriptionTableData &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.comment == this.comment);
}

class PrescriptionTableCompanion
    extends UpdateCompanion<PrescriptionTableData> {
  final Value<int> id;
  final Value<int> patientId;
  final Value<String?> comment;
  const PrescriptionTableCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.comment = const Value.absent(),
  });
  PrescriptionTableCompanion.insert({
    this.id = const Value.absent(),
    required int patientId,
    this.comment = const Value.absent(),
  }) : patientId = Value(patientId);
  static Insertable<PrescriptionTableData> custom({
    Expression<int>? id,
    Expression<int>? patientId,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (comment != null) 'comment': comment,
    });
  }

  PrescriptionTableCompanion copyWith(
      {Value<int>? id, Value<int>? patientId, Value<String?>? comment}) {
    return PrescriptionTableCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<int>(patientId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrescriptionTableCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $PrescriptionEntryTableTable extends PrescriptionEntryTable
    with TableInfo<$PrescriptionEntryTableTable, PrescriptionEntryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PrescriptionEntryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _prescriptionIdMeta =
      const VerificationMeta('prescriptionId');
  @override
  late final GeneratedColumn<int> prescriptionId = GeneratedColumn<int>(
      'prescription_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storedMedicationIdMeta =
      const VerificationMeta('storedMedicationId');
  @override
  late final GeneratedColumn<int> storedMedicationId = GeneratedColumn<int>(
      'stored_medication_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<int> dosage = GeneratedColumn<int>(
      'dosage', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _datetimeMsSinceEpochMeta =
      const VerificationMeta('datetimeMsSinceEpoch');
  @override
  late final GeneratedColumn<int> datetimeMsSinceEpoch = GeneratedColumn<int>(
      'datetime_ms_since_epoch', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, prescriptionId, storedMedicationId, dosage, datetimeMsSinceEpoch];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prescription_entry_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PrescriptionEntryTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('prescription_id')) {
      context.handle(
          _prescriptionIdMeta,
          prescriptionId.isAcceptableOrUnknown(
              data['prescription_id']!, _prescriptionIdMeta));
    } else if (isInserting) {
      context.missing(_prescriptionIdMeta);
    }
    if (data.containsKey('stored_medication_id')) {
      context.handle(
          _storedMedicationIdMeta,
          storedMedicationId.isAcceptableOrUnknown(
              data['stored_medication_id']!, _storedMedicationIdMeta));
    } else if (isInserting) {
      context.missing(_storedMedicationIdMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(_dosageMeta,
          dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta));
    } else if (isInserting) {
      context.missing(_dosageMeta);
    }
    if (data.containsKey('datetime_ms_since_epoch')) {
      context.handle(
          _datetimeMsSinceEpochMeta,
          datetimeMsSinceEpoch.isAcceptableOrUnknown(
              data['datetime_ms_since_epoch']!, _datetimeMsSinceEpochMeta));
    } else if (isInserting) {
      context.missing(_datetimeMsSinceEpochMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PrescriptionEntryTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PrescriptionEntryTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      prescriptionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}prescription_id'])!,
      storedMedicationId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}stored_medication_id'])!,
      dosage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dosage'])!,
      datetimeMsSinceEpoch: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}datetime_ms_since_epoch'])!,
    );
  }

  @override
  $PrescriptionEntryTableTable createAlias(String alias) {
    return $PrescriptionEntryTableTable(attachedDatabase, alias);
  }
}

class PrescriptionEntryTableData extends DataClass
    implements Insertable<PrescriptionEntryTableData> {
  final int id;
  final int prescriptionId;
  final int storedMedicationId;
  final int dosage;
  final int datetimeMsSinceEpoch;
  const PrescriptionEntryTableData(
      {required this.id,
      required this.prescriptionId,
      required this.storedMedicationId,
      required this.dosage,
      required this.datetimeMsSinceEpoch});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['prescription_id'] = Variable<int>(prescriptionId);
    map['stored_medication_id'] = Variable<int>(storedMedicationId);
    map['dosage'] = Variable<int>(dosage);
    map['datetime_ms_since_epoch'] = Variable<int>(datetimeMsSinceEpoch);
    return map;
  }

  PrescriptionEntryTableCompanion toCompanion(bool nullToAbsent) {
    return PrescriptionEntryTableCompanion(
      id: Value(id),
      prescriptionId: Value(prescriptionId),
      storedMedicationId: Value(storedMedicationId),
      dosage: Value(dosage),
      datetimeMsSinceEpoch: Value(datetimeMsSinceEpoch),
    );
  }

  factory PrescriptionEntryTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PrescriptionEntryTableData(
      id: serializer.fromJson<int>(json['id']),
      prescriptionId: serializer.fromJson<int>(json['prescriptionId']),
      storedMedicationId: serializer.fromJson<int>(json['storedMedicationId']),
      dosage: serializer.fromJson<int>(json['dosage']),
      datetimeMsSinceEpoch:
          serializer.fromJson<int>(json['datetimeMsSinceEpoch']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'prescriptionId': serializer.toJson<int>(prescriptionId),
      'storedMedicationId': serializer.toJson<int>(storedMedicationId),
      'dosage': serializer.toJson<int>(dosage),
      'datetimeMsSinceEpoch': serializer.toJson<int>(datetimeMsSinceEpoch),
    };
  }

  PrescriptionEntryTableData copyWith(
          {int? id,
          int? prescriptionId,
          int? storedMedicationId,
          int? dosage,
          int? datetimeMsSinceEpoch}) =>
      PrescriptionEntryTableData(
        id: id ?? this.id,
        prescriptionId: prescriptionId ?? this.prescriptionId,
        storedMedicationId: storedMedicationId ?? this.storedMedicationId,
        dosage: dosage ?? this.dosage,
        datetimeMsSinceEpoch: datetimeMsSinceEpoch ?? this.datetimeMsSinceEpoch,
      );
  @override
  String toString() {
    return (StringBuffer('PrescriptionEntryTableData(')
          ..write('id: $id, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('storedMedicationId: $storedMedicationId, ')
          ..write('dosage: $dosage, ')
          ..write('datetimeMsSinceEpoch: $datetimeMsSinceEpoch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, prescriptionId, storedMedicationId, dosage, datetimeMsSinceEpoch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PrescriptionEntryTableData &&
          other.id == this.id &&
          other.prescriptionId == this.prescriptionId &&
          other.storedMedicationId == this.storedMedicationId &&
          other.dosage == this.dosage &&
          other.datetimeMsSinceEpoch == this.datetimeMsSinceEpoch);
}

class PrescriptionEntryTableCompanion
    extends UpdateCompanion<PrescriptionEntryTableData> {
  final Value<int> id;
  final Value<int> prescriptionId;
  final Value<int> storedMedicationId;
  final Value<int> dosage;
  final Value<int> datetimeMsSinceEpoch;
  const PrescriptionEntryTableCompanion({
    this.id = const Value.absent(),
    this.prescriptionId = const Value.absent(),
    this.storedMedicationId = const Value.absent(),
    this.dosage = const Value.absent(),
    this.datetimeMsSinceEpoch = const Value.absent(),
  });
  PrescriptionEntryTableCompanion.insert({
    this.id = const Value.absent(),
    required int prescriptionId,
    required int storedMedicationId,
    required int dosage,
    required int datetimeMsSinceEpoch,
  })  : prescriptionId = Value(prescriptionId),
        storedMedicationId = Value(storedMedicationId),
        dosage = Value(dosage),
        datetimeMsSinceEpoch = Value(datetimeMsSinceEpoch);
  static Insertable<PrescriptionEntryTableData> custom({
    Expression<int>? id,
    Expression<int>? prescriptionId,
    Expression<int>? storedMedicationId,
    Expression<int>? dosage,
    Expression<int>? datetimeMsSinceEpoch,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (prescriptionId != null) 'prescription_id': prescriptionId,
      if (storedMedicationId != null)
        'stored_medication_id': storedMedicationId,
      if (dosage != null) 'dosage': dosage,
      if (datetimeMsSinceEpoch != null)
        'datetime_ms_since_epoch': datetimeMsSinceEpoch,
    });
  }

  PrescriptionEntryTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? prescriptionId,
      Value<int>? storedMedicationId,
      Value<int>? dosage,
      Value<int>? datetimeMsSinceEpoch}) {
    return PrescriptionEntryTableCompanion(
      id: id ?? this.id,
      prescriptionId: prescriptionId ?? this.prescriptionId,
      storedMedicationId: storedMedicationId ?? this.storedMedicationId,
      dosage: dosage ?? this.dosage,
      datetimeMsSinceEpoch: datetimeMsSinceEpoch ?? this.datetimeMsSinceEpoch,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (prescriptionId.present) {
      map['prescription_id'] = Variable<int>(prescriptionId.value);
    }
    if (storedMedicationId.present) {
      map['stored_medication_id'] = Variable<int>(storedMedicationId.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<int>(dosage.value);
    }
    if (datetimeMsSinceEpoch.present) {
      map['datetime_ms_since_epoch'] =
          Variable<int>(datetimeMsSinceEpoch.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PrescriptionEntryTableCompanion(')
          ..write('id: $id, ')
          ..write('prescriptionId: $prescriptionId, ')
          ..write('storedMedicationId: $storedMedicationId, ')
          ..write('dosage: $dosage, ')
          ..write('datetimeMsSinceEpoch: $datetimeMsSinceEpoch')
          ..write(')'))
        .toString();
  }
}

class $PatientTableTable extends PatientTable
    with TableInfo<$PatientTableTable, PatientTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientTableTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patient_table';
  @override
  VerificationContext validateIntegrity(Insertable<PatientTableData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PatientTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $PatientTableTable createAlias(String alias) {
    return $PatientTableTable(attachedDatabase, alias);
  }
}

class PatientTableData extends DataClass
    implements Insertable<PatientTableData> {
  final int id;
  final String name;
  const PatientTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PatientTableCompanion toCompanion(bool nullToAbsent) {
    return PatientTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory PatientTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  PatientTableData copyWith({int? id, String? name}) => PatientTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('PatientTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class PatientTableCompanion extends UpdateCompanion<PatientTableData> {
  final Value<int> id;
  final Value<String> name;
  const PatientTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PatientTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<PatientTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PatientTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return PatientTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $MedicationTableTable medicationTable =
      $MedicationTableTable(this);
  late final $StoredMedicationsTableTable storedMedicationsTable =
      $StoredMedicationsTableTable(this);
  late final $PrescriptionTableTable prescriptionTable =
      $PrescriptionTableTable(this);
  late final $PrescriptionEntryTableTable prescriptionEntryTable =
      $PrescriptionEntryTableTable(this);
  late final $PatientTableTable patientTable = $PatientTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        medicationTable,
        storedMedicationsTable,
        prescriptionTable,
        prescriptionEntryTable,
        patientTable
      ];
}

typedef $$MedicationTableTableInsertCompanionBuilder = MedicationTableCompanion
    Function({
  Value<int> id,
  required String name,
  required int medicationTypeId,
  required int concentrationPerUnit,
});
typedef $$MedicationTableTableUpdateCompanionBuilder = MedicationTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> medicationTypeId,
  Value<int> concentrationPerUnit,
});

class $$MedicationTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MedicationTableTable,
    MedicationTableData,
    $$MedicationTableTableFilterComposer,
    $$MedicationTableTableOrderingComposer,
    $$MedicationTableTableProcessedTableManager,
    $$MedicationTableTableInsertCompanionBuilder,
    $$MedicationTableTableUpdateCompanionBuilder> {
  $$MedicationTableTableTableManager(
      _$AppDatabase db, $MedicationTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MedicationTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MedicationTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MedicationTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> medicationTypeId = const Value.absent(),
            Value<int> concentrationPerUnit = const Value.absent(),
          }) =>
              MedicationTableCompanion(
            id: id,
            name: name,
            medicationTypeId: medicationTypeId,
            concentrationPerUnit: concentrationPerUnit,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int medicationTypeId,
            required int concentrationPerUnit,
          }) =>
              MedicationTableCompanion.insert(
            id: id,
            name: name,
            medicationTypeId: medicationTypeId,
            concentrationPerUnit: concentrationPerUnit,
          ),
        ));
}

class $$MedicationTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MedicationTableTable,
    MedicationTableData,
    $$MedicationTableTableFilterComposer,
    $$MedicationTableTableOrderingComposer,
    $$MedicationTableTableProcessedTableManager,
    $$MedicationTableTableInsertCompanionBuilder,
    $$MedicationTableTableUpdateCompanionBuilder> {
  $$MedicationTableTableProcessedTableManager(super.$state);
}

class $$MedicationTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MedicationTableTable> {
  $$MedicationTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get medicationTypeId => $state.composableBuilder(
      column: $state.table.medicationTypeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get concentrationPerUnit => $state.composableBuilder(
      column: $state.table.concentrationPerUnit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MedicationTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MedicationTableTable> {
  $$MedicationTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get medicationTypeId => $state.composableBuilder(
      column: $state.table.medicationTypeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get concentrationPerUnit => $state.composableBuilder(
      column: $state.table.concentrationPerUnit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$StoredMedicationsTableTableInsertCompanionBuilder
    = StoredMedicationsTableCompanion Function({
  Value<int> id,
  required int medicationId,
  required int initialQuantity,
  required int freeQuantity,
  required int reservedQuantity,
  required int expirationDateMsSinceEpoch,
  Value<String?> manualTitle,
});
typedef $$StoredMedicationsTableTableUpdateCompanionBuilder
    = StoredMedicationsTableCompanion Function({
  Value<int> id,
  Value<int> medicationId,
  Value<int> initialQuantity,
  Value<int> freeQuantity,
  Value<int> reservedQuantity,
  Value<int> expirationDateMsSinceEpoch,
  Value<String?> manualTitle,
});

class $$StoredMedicationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StoredMedicationsTableTable,
    StoredMedicationsTableData,
    $$StoredMedicationsTableTableFilterComposer,
    $$StoredMedicationsTableTableOrderingComposer,
    $$StoredMedicationsTableTableProcessedTableManager,
    $$StoredMedicationsTableTableInsertCompanionBuilder,
    $$StoredMedicationsTableTableUpdateCompanionBuilder> {
  $$StoredMedicationsTableTableTableManager(
      _$AppDatabase db, $StoredMedicationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$StoredMedicationsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$StoredMedicationsTableTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$StoredMedicationsTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> medicationId = const Value.absent(),
            Value<int> initialQuantity = const Value.absent(),
            Value<int> freeQuantity = const Value.absent(),
            Value<int> reservedQuantity = const Value.absent(),
            Value<int> expirationDateMsSinceEpoch = const Value.absent(),
            Value<String?> manualTitle = const Value.absent(),
          }) =>
              StoredMedicationsTableCompanion(
            id: id,
            medicationId: medicationId,
            initialQuantity: initialQuantity,
            freeQuantity: freeQuantity,
            reservedQuantity: reservedQuantity,
            expirationDateMsSinceEpoch: expirationDateMsSinceEpoch,
            manualTitle: manualTitle,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int medicationId,
            required int initialQuantity,
            required int freeQuantity,
            required int reservedQuantity,
            required int expirationDateMsSinceEpoch,
            Value<String?> manualTitle = const Value.absent(),
          }) =>
              StoredMedicationsTableCompanion.insert(
            id: id,
            medicationId: medicationId,
            initialQuantity: initialQuantity,
            freeQuantity: freeQuantity,
            reservedQuantity: reservedQuantity,
            expirationDateMsSinceEpoch: expirationDateMsSinceEpoch,
            manualTitle: manualTitle,
          ),
        ));
}

class $$StoredMedicationsTableTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $StoredMedicationsTableTable,
        StoredMedicationsTableData,
        $$StoredMedicationsTableTableFilterComposer,
        $$StoredMedicationsTableTableOrderingComposer,
        $$StoredMedicationsTableTableProcessedTableManager,
        $$StoredMedicationsTableTableInsertCompanionBuilder,
        $$StoredMedicationsTableTableUpdateCompanionBuilder> {
  $$StoredMedicationsTableTableProcessedTableManager(super.$state);
}

class $$StoredMedicationsTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StoredMedicationsTableTable> {
  $$StoredMedicationsTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get medicationId => $state.composableBuilder(
      column: $state.table.medicationId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get initialQuantity => $state.composableBuilder(
      column: $state.table.initialQuantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get freeQuantity => $state.composableBuilder(
      column: $state.table.freeQuantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get reservedQuantity => $state.composableBuilder(
      column: $state.table.reservedQuantity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get expirationDateMsSinceEpoch => $state.composableBuilder(
      column: $state.table.expirationDateMsSinceEpoch,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get manualTitle => $state.composableBuilder(
      column: $state.table.manualTitle,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StoredMedicationsTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StoredMedicationsTableTable> {
  $$StoredMedicationsTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get medicationId => $state.composableBuilder(
      column: $state.table.medicationId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get initialQuantity => $state.composableBuilder(
      column: $state.table.initialQuantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get freeQuantity => $state.composableBuilder(
      column: $state.table.freeQuantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get reservedQuantity => $state.composableBuilder(
      column: $state.table.reservedQuantity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get expirationDateMsSinceEpoch =>
      $state.composableBuilder(
          column: $state.table.expirationDateMsSinceEpoch,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get manualTitle => $state.composableBuilder(
      column: $state.table.manualTitle,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PrescriptionTableTableInsertCompanionBuilder
    = PrescriptionTableCompanion Function({
  Value<int> id,
  required int patientId,
  Value<String?> comment,
});
typedef $$PrescriptionTableTableUpdateCompanionBuilder
    = PrescriptionTableCompanion Function({
  Value<int> id,
  Value<int> patientId,
  Value<String?> comment,
});

class $$PrescriptionTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PrescriptionTableTable,
    PrescriptionTableData,
    $$PrescriptionTableTableFilterComposer,
    $$PrescriptionTableTableOrderingComposer,
    $$PrescriptionTableTableProcessedTableManager,
    $$PrescriptionTableTableInsertCompanionBuilder,
    $$PrescriptionTableTableUpdateCompanionBuilder> {
  $$PrescriptionTableTableTableManager(
      _$AppDatabase db, $PrescriptionTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PrescriptionTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$PrescriptionTableTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PrescriptionTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> patientId = const Value.absent(),
            Value<String?> comment = const Value.absent(),
          }) =>
              PrescriptionTableCompanion(
            id: id,
            patientId: patientId,
            comment: comment,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int patientId,
            Value<String?> comment = const Value.absent(),
          }) =>
              PrescriptionTableCompanion.insert(
            id: id,
            patientId: patientId,
            comment: comment,
          ),
        ));
}

class $$PrescriptionTableTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $PrescriptionTableTable,
        PrescriptionTableData,
        $$PrescriptionTableTableFilterComposer,
        $$PrescriptionTableTableOrderingComposer,
        $$PrescriptionTableTableProcessedTableManager,
        $$PrescriptionTableTableInsertCompanionBuilder,
        $$PrescriptionTableTableUpdateCompanionBuilder> {
  $$PrescriptionTableTableProcessedTableManager(super.$state);
}

class $$PrescriptionTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PrescriptionTableTable> {
  $$PrescriptionTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get patientId => $state.composableBuilder(
      column: $state.table.patientId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PrescriptionTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PrescriptionTableTable> {
  $$PrescriptionTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get patientId => $state.composableBuilder(
      column: $state.table.patientId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PrescriptionEntryTableTableInsertCompanionBuilder
    = PrescriptionEntryTableCompanion Function({
  Value<int> id,
  required int prescriptionId,
  required int storedMedicationId,
  required int dosage,
  required int datetimeMsSinceEpoch,
});
typedef $$PrescriptionEntryTableTableUpdateCompanionBuilder
    = PrescriptionEntryTableCompanion Function({
  Value<int> id,
  Value<int> prescriptionId,
  Value<int> storedMedicationId,
  Value<int> dosage,
  Value<int> datetimeMsSinceEpoch,
});

class $$PrescriptionEntryTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PrescriptionEntryTableTable,
    PrescriptionEntryTableData,
    $$PrescriptionEntryTableTableFilterComposer,
    $$PrescriptionEntryTableTableOrderingComposer,
    $$PrescriptionEntryTableTableProcessedTableManager,
    $$PrescriptionEntryTableTableInsertCompanionBuilder,
    $$PrescriptionEntryTableTableUpdateCompanionBuilder> {
  $$PrescriptionEntryTableTableTableManager(
      _$AppDatabase db, $PrescriptionEntryTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$PrescriptionEntryTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$PrescriptionEntryTableTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PrescriptionEntryTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> prescriptionId = const Value.absent(),
            Value<int> storedMedicationId = const Value.absent(),
            Value<int> dosage = const Value.absent(),
            Value<int> datetimeMsSinceEpoch = const Value.absent(),
          }) =>
              PrescriptionEntryTableCompanion(
            id: id,
            prescriptionId: prescriptionId,
            storedMedicationId: storedMedicationId,
            dosage: dosage,
            datetimeMsSinceEpoch: datetimeMsSinceEpoch,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int prescriptionId,
            required int storedMedicationId,
            required int dosage,
            required int datetimeMsSinceEpoch,
          }) =>
              PrescriptionEntryTableCompanion.insert(
            id: id,
            prescriptionId: prescriptionId,
            storedMedicationId: storedMedicationId,
            dosage: dosage,
            datetimeMsSinceEpoch: datetimeMsSinceEpoch,
          ),
        ));
}

class $$PrescriptionEntryTableTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $PrescriptionEntryTableTable,
        PrescriptionEntryTableData,
        $$PrescriptionEntryTableTableFilterComposer,
        $$PrescriptionEntryTableTableOrderingComposer,
        $$PrescriptionEntryTableTableProcessedTableManager,
        $$PrescriptionEntryTableTableInsertCompanionBuilder,
        $$PrescriptionEntryTableTableUpdateCompanionBuilder> {
  $$PrescriptionEntryTableTableProcessedTableManager(super.$state);
}

class $$PrescriptionEntryTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PrescriptionEntryTableTable> {
  $$PrescriptionEntryTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get prescriptionId => $state.composableBuilder(
      column: $state.table.prescriptionId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get storedMedicationId => $state.composableBuilder(
      column: $state.table.storedMedicationId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dosage => $state.composableBuilder(
      column: $state.table.dosage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get datetimeMsSinceEpoch => $state.composableBuilder(
      column: $state.table.datetimeMsSinceEpoch,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PrescriptionEntryTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PrescriptionEntryTableTable> {
  $$PrescriptionEntryTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get prescriptionId => $state.composableBuilder(
      column: $state.table.prescriptionId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get storedMedicationId => $state.composableBuilder(
      column: $state.table.storedMedicationId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dosage => $state.composableBuilder(
      column: $state.table.dosage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get datetimeMsSinceEpoch => $state.composableBuilder(
      column: $state.table.datetimeMsSinceEpoch,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PatientTableTableInsertCompanionBuilder = PatientTableCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$PatientTableTableUpdateCompanionBuilder = PatientTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$PatientTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PatientTableTable,
    PatientTableData,
    $$PatientTableTableFilterComposer,
    $$PatientTableTableOrderingComposer,
    $$PatientTableTableProcessedTableManager,
    $$PatientTableTableInsertCompanionBuilder,
    $$PatientTableTableUpdateCompanionBuilder> {
  $$PatientTableTableTableManager(_$AppDatabase db, $PatientTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PatientTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PatientTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$PatientTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              PatientTableCompanion(
            id: id,
            name: name,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              PatientTableCompanion.insert(
            id: id,
            name: name,
          ),
        ));
}

class $$PatientTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $PatientTableTable,
    PatientTableData,
    $$PatientTableTableFilterComposer,
    $$PatientTableTableOrderingComposer,
    $$PatientTableTableProcessedTableManager,
    $$PatientTableTableInsertCompanionBuilder,
    $$PatientTableTableUpdateCompanionBuilder> {
  $$PatientTableTableProcessedTableManager(super.$state);
}

class $$PatientTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PatientTableTable> {
  $$PatientTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$PatientTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PatientTableTable> {
  $$PatientTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$MedicationTableTableTableManager get medicationTable =>
      $$MedicationTableTableTableManager(_db, _db.medicationTable);
  $$StoredMedicationsTableTableTableManager get storedMedicationsTable =>
      $$StoredMedicationsTableTableTableManager(
          _db, _db.storedMedicationsTable);
  $$PrescriptionTableTableTableManager get prescriptionTable =>
      $$PrescriptionTableTableTableManager(_db, _db.prescriptionTable);
  $$PrescriptionEntryTableTableTableManager get prescriptionEntryTable =>
      $$PrescriptionEntryTableTableTableManager(
          _db, _db.prescriptionEntryTable);
  $$PatientTableTableTableManager get patientTable =>
      $$PatientTableTableTableManager(_db, _db.patientTable);
}
