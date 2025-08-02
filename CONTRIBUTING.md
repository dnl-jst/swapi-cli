# Contributing to Star Wars CLI

First off, thank you for considering contributing to Star Wars CLI! 🌟 

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue, assessing changes, and helping you finalize your pull requests.

## 🚀 Quick Start

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/swapi-cli.git`
3. Create a feature branch: `git checkout -b feature/amazing-feature`
4. Install dependencies: `dart pub get`
5. Make your changes
6. Run tests: `dart test`
7. Commit your changes: `git commit -m "Add amazing feature"`
8. Push to your fork: `git push origin feature/amazing-feature`
9. Open a Pull Request

## 📋 Development Setup

### Prerequisites
- Dart SDK >= 3.0.0
- Git

### Environment Setup
```bash
# Clone the repository
git clone https://github.com/dnl-jst/swapi-cli.git
cd swapi-cli

# Install dependencies
dart pub get

# Run tests to verify setup
dart test

# Run the CLI locally
dart run bin/swapi_cli.dart --help
```

## 🧪 Testing

We maintain high test coverage and all contributions should include appropriate tests.

```bash
# Run all tests
dart test

# Run specific test suites
dart test test/models/
dart test test/services/
dart test test/utils/

# Run with coverage (requires global activation)
dart pub global activate coverage
dart test --coverage=coverage
```

### Test Guidelines
- Write tests for all new features
- Maintain or improve test coverage
- Follow existing test patterns
- Include both positive and negative test cases
- Test edge cases and error conditions

## 🎨 Code Style

We follow Dart's official style guide with some project-specific conventions:

```bash
# Format code
dart format .

# Analyze code
dart analyze

# Check for linting issues
dart analyze --fatal-infos
```

### Code Conventions
- Use descriptive variable and function names
- Add documentation comments for public APIs
- Keep functions small and focused
- Use German strings for user-facing messages
- Include emojis in user output for better UX

## 📚 Documentation

- Update the README.md if you change functionality
- Add or update code comments for complex logic
- Update the TEST_README.md for test-related changes
- Include examples in documentation

## 🐛 Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates.

When you create a bug report, please include:
- A clear and descriptive title
- Steps to reproduce the issue
- Expected vs actual behavior
- Your environment (OS, Dart version, etc.)
- Error messages or logs
- Screenshots if applicable

Use the bug report template when creating issues.

## 💡 Suggesting Features

We welcome feature suggestions! Please:
- Check existing issues and discussions first
- Use the feature request template
- Provide clear use cases and examples
- Consider backward compatibility
- Think about how it fits with the project's goals

## 🔄 Pull Request Process

1. **Fork & Branch**: Create a feature branch from `main`
2. **Code**: Make your changes following our guidelines
3. **Test**: Ensure all tests pass and add new tests
4. **Document**: Update documentation as needed
5. **Commit**: Use clear, descriptive commit messages
6. **Push**: Push to your fork and create a pull request
7. **Review**: Address feedback from maintainers

### Pull Request Guidelines
- Fill out the pull request template completely
- Keep changes focused and atomic
- Include tests for new functionality
- Update documentation as needed
- Ensure CI passes before requesting review

## 🏷️ Commit Message Format

We use conventional commits to maintain a clean git history:

```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or modifying tests
- `chore`: Maintenance tasks

Examples:
```
feat(cli): add support for filtering by species classification
fix(api): handle network timeout errors gracefully
docs(readme): update installation instructions
test(models): add tests for null value handling
```

## 🌟 Recognition

Contributors will be recognized in:
- The project README
- Release notes for significant contributions
- GitHub's contributor graph

## 📞 Getting Help

- 💬 **Discussions**: Use GitHub Discussions for general questions
- 🐛 **Issues**: Use GitHub Issues for bugs and feature requests
- 📧 **Direct Contact**: For security issues or sensitive matters

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project.

## 🙏 Thank You

Your contributions make the Star Wars CLI better for everyone. May the Force be with you! ⭐

---

> "Do or do not, there is no try." - Yoda
