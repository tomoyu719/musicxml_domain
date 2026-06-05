import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _MusicxmlLintPlugin();

class _MusicxmlLintPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const OneClassPerFile(),
        const AvoidMap(),
      ];
}

class OneClassPerFile extends DartLintRule {
  const OneClassPerFile() : super(code: _code);

  static const _code = LintCode(
    name: 'one_class_per_file',
    problemMessage:
        'Only one type declaration (class or mixin) is allowed per '
        'file. Move this declaration to its own file.',
    errorSeverity: DiagnosticSeverity.WARNING,
  );

  static const _sealedSubclassCode = LintCode(
    name: 'one_class_per_file',
    problemMessage:
        'Only one type declaration (class or mixin) is allowed per file. '
        'Since this class extends a sealed class, use `part`/`part of` to '
        'keep it in the same library while moving it to its own file.',
    errorSeverity: DiagnosticSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit((CompilationUnit unit) {
      final typeDecls = unit.declarations
          .whereType<NamedCompilationUnitMember>()
          .where(
            (d) => d is ClassDeclaration || d is MixinDeclaration,
          )
          .toList();

      for (final decl in typeDecls.skip(1)) {
        if (decl is ClassDeclaration &&
            _extendsSealedClassInUnit(decl, unit)) {
          reporter.atToken(decl.name, _sealedSubclassCode);
        } else {
          reporter.atToken(decl.name, _code);
        }
      }
    });
  }

  /// Returns true if [decl] extends a sealed class declared in [unit].
  static bool _extendsSealedClassInUnit(
    ClassDeclaration decl,
    CompilationUnit unit,
  ) {
    final superclassName = decl.extendsClause?.superclass.name.lexeme;
    if (superclassName == null) return false;

    return unit.declarations.whereType<ClassDeclaration>().any(
          (d) =>
              d.name.lexeme == superclassName && d.sealedKeyword != null,
        );
  }
}

class AvoidMap extends DartLintRule {
  const AvoidMap() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_map',
    problemMessage:
        'Avoid using Map. Consider using a dedicated class instead.',
    errorSeverity: DiagnosticSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addNamedType((node) {
      if (node.name.lexeme == 'Map') {
        reporter.atToken(node.name, _code);
      }
    });

    context.registry.addSetOrMapLiteral((node) {
      if (node.isMap) {
        reporter.atNode(node, _code);
      }
    });
  }
}
