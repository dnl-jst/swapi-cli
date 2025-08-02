# GitHub Actions CI/CD Pipeline

Diese Dokumentation beschreibt die umfassende CI/CD Pipeline für das Star Wars CLI Projekt.

## 📋 Übersicht

Das Projekt verwendet GitHub Actions für:
- ✅ **Kontinuierliche Integration (CI)** - Automatisches Testen und Linting
- 🚀 **Kontinuierliche Bereitstellung (CD)** - Automatische Releases und Builds
- 🔄 **Dependency Management** - Automatische Updates mit Dependabot
- 📋 **Issue & PR Management** - Templates für strukturierte Beiträge

## 🏗️ Pipeline-Jobs

### CI Pipeline (`.github/workflows/ci.yml`)

#### 1. **Analyze & Lint**
- Code-Formatierung prüfen (`dart format`)
- Statische Code-Analyse (`dart analyze`)
- Dependency-Updates überprüfen (`dart pub outdated`)

#### 2. **Test** (Matrix: stable + beta Dart)
- Unit Tests ausführen (`dart test`)
- Code Coverage generieren
- Coverage zu Codecov hochladen

#### 3. **Integration Test**
- End-to-End Tests ausführen
- CLI-Funktionalität testen
- Executable-Build testen

#### 4. **Build** (Matrix: Linux, Windows, macOS)
- Plattform-spezifische Executables erstellen
- Build-Artefakte hochladen

#### 5. **Security**
- Sicherheits-Audit durchführen
- Sensible Dateien überprüfen

#### 6. **Documentation**
- API-Dokumentation generieren
- README und Dokumentations-Vollständigkeit prüfen

#### 7. **Notification**
- Zusammenfassung aller Job-Ergebnisse
- Status-Benachrichtigung

### Release Pipeline (`.github/workflows/release.yml`)

#### Auslöser:
- **Git Tags**: `v*.*.*` (z.B. v1.2.3)
- **Manual Dispatch**: Manuelle Auslösung über GitHub UI

#### Release-Jobs:

1. **Create Release**
   - GitHub Release erstellen
   - Changelog generieren
   - Release-Notizen mit Features und Usage

2. **Build Release Assets** (Matrix: Linux, Windows, macOS)
   - Plattform-spezifische Executables
   - Assets zu GitHub Release hochladen

3. **Publish to Pub.dev** (Optional)
   - Dry-run für pub.dev Publishing
   - (Actual publishing auskommentiert)

4. **Notify Release Success**
   - Erfolgs-Benachrichtigung
   - Download-Links bereitstellen

## 🤖 Dependabot (`.github/dependabot.yml`)

### Automatische Updates für:
- **Dart Dependencies** (wöchentlich montags 09:00)
- **GitHub Actions** (wöchentlich montags 10:00)

### Features:
- Gruppierte Updates für Test-Dependencies
- Automatic Labels und Assignees
- Ignore-Regeln für Major-Updates
- Deutsche Zeitzone (Europe/Berlin)

## 📝 Issue & PR Templates

### Issue Templates:
1. **Bug Report** (`.github/ISSUE_TEMPLATE/bug_report.yml`)
   - Strukturiertes Formular für Bug-Reports
   - Umgebungs-Informationen
   - Repro-Steps und Expected/Actual Behavior

2. **Feature Request** (`.github/ISSUE_TEMPLATE/feature_request.yml`)
   - Feature-Vorschläge mit Priorität
   - Implementation-Bereitschaft
   - Alternative Lösungen

### Pull Request Template:
- **PR Template** (`.github/pull_request_template.md`)
- Change-Type Kategorisierung
- Testing Checklist
- Code Review Guidelines

## 🚀 Verwendung

### Automatische CI-Ausführung:
```bash
# Pushen auf main oder develop Branch
git push origin main

# Pull Request erstellen
# -> Automatisch CI Pipeline ausgelöst
```

### Release erstellen:
```bash
# Tag erstellen und pushen
git tag v1.2.3
git push origin v1.2.3

# -> Automatisch Release Pipeline ausgelöst
```

### Manueller Release:
1. Gehe zu GitHub Actions
2. Wähle "Release" Workflow
3. Klicke "Run workflow"
4. Gib Version ein (z.B. v1.2.3)
5. -> Release wird erstellt

## 📊 Status Badges

Die README enthält folgende Status Badges:
- CI/CD Pipeline Status
- Release Status
- Dart Version Support
- License Information
- Code Coverage

## 🔧 Setup für neue Repositories

### 1. Secrets konfigurieren:
```
# Optional: Für pub.dev Publishing
PUB_DEV_TOKEN=your_pub_dev_token

# Automatisch verfügbar:
GITHUB_TOKEN (automatisch von GitHub bereitgestellt)
```

### 2. Repository Settings:
- Branch Protection für `main` aktivieren
- Require status checks before merging
- Require branches to be up to date
- Include administrators in restrictions

### 3. Dependabot aktivieren:
- Security alerts aktivieren
- Dependabot alerts aktivieren
- Dependabot security updates aktivieren

## 🛡️ Sicherheit

### Integrierte Sicherheitsmaßnahmen:
- **Dependency Scanning** - Automatische Vulnerability-Checks
- **Code Analysis** - Statische Code-Analyse mit `dart analyze`
- **Sensitive File Detection** - Erkennung von Schlüsseldateien
- **Branch Protection** - Schutz wichtiger Branches
- **Security Audit** - Regelmäßige Dependency-Audits

### Best Practices:
- Keine Secrets in Code committen
- Use Personal Access Tokens für externe Services
- Regular Dependency Updates mit Dependabot
- Code Reviews für alle Changes

## 📈 Monitoring & Metriken

### Verfügbare Metriken:
- **Test Coverage** - Über Codecov Integration
- **Build Times** - GitHub Actions Timing
- **Dependency Freshness** - Dependabot Reports
- **Security Alerts** - GitHub Security Tab

### Monitoring:
- GitHub Actions Workflow Status
- Dependabot Pull Request Reviews
- Security Advisory Notifications
- Release Download Statistics

## 🎯 Erweiterungen

### Mögliche Zukunftserweiterungen:
- **Performance Testing** - Benchmark Tests
- **Docker Images** - Containerized Releases
- **Package Registry** - Eigenes Package Repository
- **Notifications** - Slack/Discord Integration
- **Deployment** - Automatisches Deployment zu Package Managern

Die CI/CD Pipeline ist vollständig konfiguriert und produktionsbereit! 🚀
