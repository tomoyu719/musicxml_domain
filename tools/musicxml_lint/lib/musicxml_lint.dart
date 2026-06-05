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
        'Only one type declaration (class, mixin, or enum) is allowed per '
        'file. Move this declaration to its own file.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addCompilationUnit((CompilationUnit unit) {
      final typeDecls = unit.declarations
          .whereType<NamedCompilationUnitMember>()
          .where(
            (d) =>
                d is ClassDeclaration ||
                d is MixinDeclaration ||
                d is EnumDeclaration,
          )
          .toList();

      for (final decl in typeDecls.skip(1)) {
        reporter.atToken(decl.name, _code);
      }
    });
  }
}

class AvoidMap extends DartLintRule {
  const AvoidMap() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_map',
    problemMessage: 'Avoid using Map. Consider using a dedicated class instead.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addNamedType((node) {
      if (node.name2.lexeme == 'Map') {
        reporter.atToken(node.name2, _code);
      }
    });

    context.registry.addSetOrMapLiteral((node) {
      if (node.isMap) {
        reporter.atNode(node, _code);
      }
    });
  }
}
