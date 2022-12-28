import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart';
import 'package:landing_annotations/landing_annotations.dart' as landing;
import 'package:logging/logging.dart';
import 'package:source_gen/source_gen.dart';

Builder dataGeneratorFactoryBuilder({String? header}) => PartBuilder(
      [
        WorkProjectDataGenerator(),
        SkillSetDataGenerator(),
      ],
      '.landing.dart',
      header: header,
    );

final Logger logger = Logger('Landing Generator');

class WorkProjectDataGenerator
    extends ListDataGenerator<landing.WorkProjectData> {
  @override
  String get elementType => 'WorkProject';

  @override
  List<Code> _generateOptionalBlocks() {
    return [
      Code('list.sort((a, b) => b.period.compareTo(a.period));'),
    ];
  }

  @override
  Expression _generateItem(Map<String, dynamic> map) {
    final from = DateTime.parse(map["period"]["from"]);
    final to = DateTime.tryParse(map["period"]["to"] ?? '');

    return refer('WorkProject').newInstance(
      [],
      {
        'role': literalString(map['role']),
        'name': literalString(map['name']),
        'nda': literalBool(map['nda']),
        'description': literalString(map['description']),
        'labels': literalList(
          (map["labels"] as List).cast<String>().map(literalString).toList(),
          refer('String'),
        ),
        'period': refer('ProjectWorkingPeriod').newInstance(
          [],
          {
            'from': refer('DateTime').newInstance(
              [
                literalNum(from.year),
                literalNum(from.month),
                literalNum(from.day)
              ],
            ),
            'to': to == null
                ? literalNull
                : refer('DateTime').newInstance(
                    [
                      literalNum(to.year),
                      literalNum(to.month),
                      literalNum(to.day)
                    ],
                  ),
          },
        ),
      },
    );
  }
}

class SkillSetDataGenerator extends ListDataGenerator<landing.SkillSetData> {
  @override
  String get elementType => 'SkillSet';

  @override
  Expression? _generateItem(Map<String, dynamic> map) {
    final code = map["code"];
    final category = landing.SkillCategory.values.firstWhereOrNull(
      (category) => category.jsonCode == code,
    );
    if (category == null) return null;

    return refer('SkillSet').newInstance(
      [],
      {
        'category': refer('SkillCategory').property(category.name),
        'value': literalList(
          (map["value"] as List).cast<String>().map(literalString).toList(),
          refer('String'),
        ),
      },
    );
  }
}

abstract class ListDataGenerator<T> extends GeneratorForAnnotation<T> {
  String get elementType;

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      final String friendlyName = element.displayName;
      throw InvalidGenerationSourceError(
        'Generator cannot target `$friendlyName`.',
        todo: 'Remove the annotation from `$friendlyName`.',
      );
    }

    return _buildImplClass(annotation, element);
  }

  String _buildImplClass(ConstantReader annotation, ClassElement element) {
    final String friendlyName = element.name;
    final String name = '_$friendlyName';
    final String jsonPath = annotation.peek('jsonPath')!.stringValue;

    final resourceProvider = PhysicalResourceProvider();
    final jsonData = resourceProvider.getFile(jsonPath).readAsStringSync();
    final decodedJson = json.decode(jsonData);
    final castedJson = (decodedJson as List).cast<Map<String, dynamic>>();

    final Class classBuilder = Class((builder) {
      builder
        ..name = name
        ..methods.add(
          Method(
            (m) {
              m.name = 'getData';
              m.returns = refer('List<$elementType>');

              final List<Code> blocks = [
                declareFinal('list', type: refer('List<$elementType>'))
                    .assign(
                      literalList(
                        castedJson.map(_generateItem).whereNotNull().toList(),
                        refer(elementType),
                      ),
                    )
                    .statement,
                ..._generateOptionalBlocks(),
                refer('list').returned.statement
              ];
              m.body = Block.of(blocks);
            },
          ),
        );
    });

    final DartEmitter emitter = DartEmitter();

    return DartFormatter().format('${classBuilder.accept(emitter)}');
  }

  List<Code> _generateOptionalBlocks() => [];

  Expression? _generateItem(Map<String, dynamic> map);
}
