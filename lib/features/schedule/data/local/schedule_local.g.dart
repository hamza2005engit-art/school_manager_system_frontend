// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'schedule_local.dart';

// // **************************************************************************
// // IsarCollectionGenerator
// // **************************************************************************

// // coverage:ignore-file
// // ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

// extension GetScheduleLocalCollection on Isar {
//   IsarCollection<ScheduleLocal> get scheduleLocals => this.collection();
// }

// const ScheduleLocalSchema = CollectionSchema(
//   name: r'ScheduleLocal',
//   id: -5121809827405283677,
//   properties: {
//     r'endTime': PropertySchema(
//       id: 0,
//       name: r'endTime',
//       type: IsarType.string,
//     ),
//     r'material': PropertySchema(
//       id: 1,
//       name: r'material',
//       type: IsarType.string,
//     ),
//     r'period': PropertySchema(
//       id: 2,
//       name: r'period',
//       type: IsarType.long,
//     ),
//     r'scheduleId': PropertySchema(
//       id: 3,
//       name: r'scheduleId',
//       type: IsarType.string,
//     ),
//     r'section': PropertySchema(
//       id: 4,
//       name: r'section',
//       type: IsarType.string,
//     ),
//     r'startTime': PropertySchema(
//       id: 5,
//       name: r'startTime',
//       type: IsarType.string,
//     ),
//     r'studyStage': PropertySchema(
//       id: 6,
//       name: r'studyStage',
//       type: IsarType.string,
//     ),
//     r'teacher': PropertySchema(
//       id: 7,
//       name: r'teacher',
//       type: IsarType.string,
//     )
//   },
//   estimateSize: _scheduleLocalEstimateSize,
//   serialize: _scheduleLocalSerialize,
//   deserialize: _scheduleLocalDeserialize,
//   deserializeProp: _scheduleLocalDeserializeProp,
//   idName: r'id',
//   indexes: {
//     r'scheduleId': IndexSchema(
//       id: 1899306264659753312,
//       name: r'scheduleId',
//       unique: true,
//       replace: false,
//       properties: [
//         IndexPropertySchema(
//           name: r'scheduleId',
//           type: IndexType.hash,
//           caseSensitive: true,
//         )
//       ],
//     )
//   },
//   links: {},
//   embeddedSchemas: {},
//   getId: _scheduleLocalGetId,
//   getLinks: _scheduleLocalGetLinks,
//   attach: _scheduleLocalAttach,
//   version: '3.1.0+1',
// );

// int _scheduleLocalEstimateSize(
//   ScheduleLocal object,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   var bytesCount = offsets.last;
//   bytesCount += 3 + object.endTime.length * 3;
//   bytesCount += 3 + object.material.length * 3;
//   bytesCount += 3 + object.scheduleId.length * 3;
//   {
//     final value = object.section;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   bytesCount += 3 + object.startTime.length * 3;
//   {
//     final value = object.studyStage;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   {
//     final value = object.teacher;
//     if (value != null) {
//       bytesCount += 3 + value.length * 3;
//     }
//   }
//   return bytesCount;
// }

// void _scheduleLocalSerialize(
//   ScheduleLocal object,
//   IsarWriter writer,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   writer.writeString(offsets[0], object.endTime);
//   writer.writeString(offsets[1], object.material);
//   writer.writeLong(offsets[2], object.period);
//   writer.writeString(offsets[3], object.scheduleId);
//   writer.writeString(offsets[4], object.section);
//   writer.writeString(offsets[5], object.startTime);
//   writer.writeString(offsets[6], object.studyStage);
//   writer.writeString(offsets[7], object.teacher);
// }

// ScheduleLocal _scheduleLocalDeserialize(
//   Id id,
//   IsarReader reader,
//   List<int> offsets,
//   Map<Type, List<int>> allOffsets,
// ) {
//   final object = ScheduleLocal();
//   object.endTime = reader.readString(offsets[0]);
//   object.id = id;
//   object.material = reader.readString(offsets[1]);
//   object.period = reader.readLong(offsets[2]);
//   object.scheduleId = reader.readString(offsets[3]);
//   object.section = reader.readStringOrNull(offsets[4]);
//   object.startTime = reader.readString(offsets[5]);
//   object.studyStage = reader.readStringOrNull(offsets[6]);
//   object.teacher = reader.readStringOrNull(offsets[7]);
//   return object;
// }

// P _scheduleLocalDeserializeProp<P>(
//   IsarReader reader,
//   int propertyId,
//   int offset,
//   Map<Type, List<int>> allOffsets,
// ) {
//   switch (propertyId) {
//     case 0:
//       return (reader.readString(offset)) as P;
//     case 1:
//       return (reader.readString(offset)) as P;
//     case 2:
//       return (reader.readLong(offset)) as P;
//     case 3:
//       return (reader.readString(offset)) as P;
//     case 4:
//       return (reader.readStringOrNull(offset)) as P;
//     case 5:
//       return (reader.readString(offset)) as P;
//     case 6:
//       return (reader.readStringOrNull(offset)) as P;
//     case 7:
//       return (reader.readStringOrNull(offset)) as P;
//     default:
//       throw IsarError('Unknown property with id $propertyId');
//   }
// }

// Id _scheduleLocalGetId(ScheduleLocal object) {
//   return object.id;
// }

// List<IsarLinkBase<dynamic>> _scheduleLocalGetLinks(ScheduleLocal object) {
//   return [];
// }

// void _scheduleLocalAttach(
//     IsarCollection<dynamic> col, Id id, ScheduleLocal object) {
//   object.id = id;
// }

// extension ScheduleLocalByIndex on IsarCollection<ScheduleLocal> {
//   Future<ScheduleLocal?> getByScheduleId(String scheduleId) {
//     return getByIndex(r'scheduleId', [scheduleId]);
//   }

//   ScheduleLocal? getByScheduleIdSync(String scheduleId) {
//     return getByIndexSync(r'scheduleId', [scheduleId]);
//   }

//   Future<bool> deleteByScheduleId(String scheduleId) {
//     return deleteByIndex(r'scheduleId', [scheduleId]);
//   }

//   bool deleteByScheduleIdSync(String scheduleId) {
//     return deleteByIndexSync(r'scheduleId', [scheduleId]);
//   }

//   Future<List<ScheduleLocal?>> getAllByScheduleId(
//       List<String> scheduleIdValues) {
//     final values = scheduleIdValues.map((e) => [e]).toList();
//     return getAllByIndex(r'scheduleId', values);
//   }

//   List<ScheduleLocal?> getAllByScheduleIdSync(List<String> scheduleIdValues) {
//     final values = scheduleIdValues.map((e) => [e]).toList();
//     return getAllByIndexSync(r'scheduleId', values);
//   }

//   Future<int> deleteAllByScheduleId(List<String> scheduleIdValues) {
//     final values = scheduleIdValues.map((e) => [e]).toList();
//     return deleteAllByIndex(r'scheduleId', values);
//   }

//   int deleteAllByScheduleIdSync(List<String> scheduleIdValues) {
//     final values = scheduleIdValues.map((e) => [e]).toList();
//     return deleteAllByIndexSync(r'scheduleId', values);
//   }

//   Future<Id> putByScheduleId(ScheduleLocal object) {
//     return putByIndex(r'scheduleId', object);
//   }

//   Id putByScheduleIdSync(ScheduleLocal object, {bool saveLinks = true}) {
//     return putByIndexSync(r'scheduleId', object, saveLinks: saveLinks);
//   }

//   Future<List<Id>> putAllByScheduleId(List<ScheduleLocal> objects) {
//     return putAllByIndex(r'scheduleId', objects);
//   }

//   List<Id> putAllByScheduleIdSync(List<ScheduleLocal> objects,
//       {bool saveLinks = true}) {
//     return putAllByIndexSync(r'scheduleId', objects, saveLinks: saveLinks);
//   }
// }

// extension ScheduleLocalQueryWhereSort
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QWhere> {
//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhere> anyId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(const IdWhereClause.any());
//     });
//   }
// }

// extension ScheduleLocalQueryWhere
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QWhereClause> {
//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause> idEqualTo(
//       Id id) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IdWhereClause.between(
//         lower: id,
//         upper: id,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause> idNotEqualTo(
//       Id id) {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(
//               IdWhereClause.lessThan(upper: id, includeUpper: false),
//             )
//             .addWhereClause(
//               IdWhereClause.greaterThan(lower: id, includeLower: false),
//             );
//       } else {
//         return query
//             .addWhereClause(
//               IdWhereClause.greaterThan(lower: id, includeLower: false),
//             )
//             .addWhereClause(
//               IdWhereClause.lessThan(upper: id, includeUpper: false),
//             );
//       }
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause> idGreaterThan(
//       Id id,
//       {bool include = false}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         IdWhereClause.greaterThan(lower: id, includeLower: include),
//       );
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause> idLessThan(
//       Id id,
//       {bool include = false}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(
//         IdWhereClause.lessThan(upper: id, includeUpper: include),
//       );
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause> idBetween(
//     Id lowerId,
//     Id upperId, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IdWhereClause.between(
//         lower: lowerId,
//         includeLower: includeLower,
//         upper: upperId,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause>
//       scheduleIdEqualTo(String scheduleId) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addWhereClause(IndexWhereClause.equalTo(
//         indexName: r'scheduleId',
//         value: [scheduleId],
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterWhereClause>
//       scheduleIdNotEqualTo(String scheduleId) {
//     return QueryBuilder.apply(this, (query) {
//       if (query.whereSort == Sort.asc) {
//         return query
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'scheduleId',
//               lower: [],
//               upper: [scheduleId],
//               includeUpper: false,
//             ))
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'scheduleId',
//               lower: [scheduleId],
//               includeLower: false,
//               upper: [],
//             ));
//       } else {
//         return query
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'scheduleId',
//               lower: [scheduleId],
//               includeLower: false,
//               upper: [],
//             ))
//             .addWhereClause(IndexWhereClause.between(
//               indexName: r'scheduleId',
//               lower: [],
//               upper: [scheduleId],
//               includeUpper: false,
//             ));
//       }
//     });
//   }
// }

// extension ScheduleLocalQueryFilter
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QFilterCondition> {
//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'endTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'endTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'endTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'endTime',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'endTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'endTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'endTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'endTime',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'endTime',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       endTimeIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'endTime',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition> idEqualTo(
//       Id value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'id',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       idGreaterThan(
//     Id value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'id',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition> idLessThan(
//     Id value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'id',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition> idBetween(
//     Id lower,
//     Id upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'id',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'material',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'material',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'material',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'material',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'material',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'material',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'material',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'material',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'material',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       materialIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'material',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       periodEqualTo(int value) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'period',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       periodGreaterThan(
//     int value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'period',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       periodLessThan(
//     int value, {
//     bool include = false,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'period',
//         value: value,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       periodBetween(
//     int lower,
//     int upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'period',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'scheduleId',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'scheduleId',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'scheduleId',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'scheduleId',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'scheduleId',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'scheduleId',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'scheduleId',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'scheduleId',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'scheduleId',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       scheduleIdIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'scheduleId',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'section',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'section',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'section',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'section',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'section',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'section',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'section',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'section',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'section',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'section',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'section',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       sectionIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'section',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeEqualTo(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'startTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeGreaterThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'startTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeLessThan(
//     String value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'startTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeBetween(
//     String lower,
//     String upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'startTime',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'startTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'startTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'startTime',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'startTime',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'startTime',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       startTimeIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'startTime',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'studyStage',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'studyStage',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'studyStage',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'studyStage',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'studyStage',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'studyStage',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'studyStage',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'studyStage',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'studyStage',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'studyStage',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'studyStage',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       studyStageIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'studyStage',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherIsNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNull(
//         property: r'teacher',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherIsNotNull() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(const FilterCondition.isNotNull(
//         property: r'teacher',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherEqualTo(
//     String? value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'teacher',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherGreaterThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         include: include,
//         property: r'teacher',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherLessThan(
//     String? value, {
//     bool include = false,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.lessThan(
//         include: include,
//         property: r'teacher',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherBetween(
//     String? lower,
//     String? upper, {
//     bool includeLower = true,
//     bool includeUpper = true,
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.between(
//         property: r'teacher',
//         lower: lower,
//         includeLower: includeLower,
//         upper: upper,
//         includeUpper: includeUpper,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherStartsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.startsWith(
//         property: r'teacher',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherEndsWith(
//     String value, {
//     bool caseSensitive = true,
//   }) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.endsWith(
//         property: r'teacher',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherContains(String value, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.contains(
//         property: r'teacher',
//         value: value,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherMatches(String pattern, {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.matches(
//         property: r'teacher',
//         wildcard: pattern,
//         caseSensitive: caseSensitive,
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherIsEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.equalTo(
//         property: r'teacher',
//         value: '',
//       ));
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterFilterCondition>
//       teacherIsNotEmpty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addFilterCondition(FilterCondition.greaterThan(
//         property: r'teacher',
//         value: '',
//       ));
//     });
//   }
// }

// extension ScheduleLocalQueryObject
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QFilterCondition> {}

// extension ScheduleLocalQueryLinks
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QFilterCondition> {}

// extension ScheduleLocalQuerySortBy
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QSortBy> {
//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByEndTime() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'endTime', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByEndTimeDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'endTime', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByMaterial() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'material', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       sortByMaterialDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'material', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByPeriod() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'period', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByPeriodDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'period', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByScheduleId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'scheduleId', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       sortByScheduleIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'scheduleId', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortBySection() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'section', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortBySectionDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'section', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByStartTime() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'startTime', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       sortByStartTimeDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'startTime', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByStudyStage() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'studyStage', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       sortByStudyStageDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'studyStage', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByTeacher() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'teacher', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> sortByTeacherDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'teacher', Sort.desc);
//     });
//   }
// }

// extension ScheduleLocalQuerySortThenBy
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QSortThenBy> {
//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByEndTime() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'endTime', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByEndTimeDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'endTime', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenById() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'id', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'id', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByMaterial() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'material', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       thenByMaterialDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'material', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByPeriod() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'period', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByPeriodDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'period', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByScheduleId() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'scheduleId', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       thenByScheduleIdDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'scheduleId', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenBySection() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'section', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenBySectionDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'section', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByStartTime() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'startTime', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       thenByStartTimeDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'startTime', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByStudyStage() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'studyStage', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy>
//       thenByStudyStageDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'studyStage', Sort.desc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByTeacher() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'teacher', Sort.asc);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QAfterSortBy> thenByTeacherDesc() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addSortBy(r'teacher', Sort.desc);
//     });
//   }
// }

// extension ScheduleLocalQueryWhereDistinct
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> {
//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByEndTime(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'endTime', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByMaterial(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'material', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByPeriod() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'period');
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByScheduleId(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'scheduleId', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctBySection(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'section', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByStartTime(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'startTime', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByStudyStage(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'studyStage', caseSensitive: caseSensitive);
//     });
//   }

//   QueryBuilder<ScheduleLocal, ScheduleLocal, QDistinct> distinctByTeacher(
//       {bool caseSensitive = true}) {
//     return QueryBuilder.apply(this, (query) {
//       return query.addDistinctBy(r'teacher', caseSensitive: caseSensitive);
//     });
//   }
// }

// extension ScheduleLocalQueryProperty
//     on QueryBuilder<ScheduleLocal, ScheduleLocal, QQueryProperty> {
//   QueryBuilder<ScheduleLocal, int, QQueryOperations> idProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'id');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String, QQueryOperations> endTimeProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'endTime');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String, QQueryOperations> materialProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'material');
//     });
//   }

//   QueryBuilder<ScheduleLocal, int, QQueryOperations> periodProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'period');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String, QQueryOperations> scheduleIdProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'scheduleId');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String?, QQueryOperations> sectionProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'section');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String, QQueryOperations> startTimeProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'startTime');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String?, QQueryOperations> studyStageProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'studyStage');
//     });
//   }

//   QueryBuilder<ScheduleLocal, String?, QQueryOperations> teacherProperty() {
//     return QueryBuilder.apply(this, (query) {
//       return query.addPropertyName(r'teacher');
//     });
//   }
// }
