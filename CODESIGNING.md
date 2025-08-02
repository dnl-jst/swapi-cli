# Code Signing für macOS 🔐

## Aktueller Status

**Ad-hoc Signing:** ✅ Implementiert (kostenlos)
- Reduziert Gatekeeper-Warnungen
- Executable ist lokal signiert
- Benutzer müssen trotzdem "Öffnen" bestätigen

## Vollständiges Apple Code Signing (Optional)

Für eine vollständig vertrauenswürdige Anwendung benötigst du:

### 1. Apple Developer Account (99$/Jahr)
- Registriere dich bei https://developer.apple.com
- Erstelle ein Developer Certificate

### 2. GitHub Secrets konfigurieren

Füge diese Secrets zu deinem GitHub Repository hinzu:

```
APPLE_CERTIFICATE_BASE64     # Base64-encoded .p12 certificate
APPLE_CERTIFICATE_PASSWORD   # Password für das Certificate
APPLE_TEAM_ID               # Deine Apple Team ID
```

### 3. Workflow erweitern

```yaml
- name: Import Code Signing Certificate
  if: runner.os == 'macOS'
  run: |
    # Certificate aus Base64 dekodieren
    echo "${{ secrets.APPLE_CERTIFICATE_BASE64 }}" | base64 --decode > certificate.p12

    # Keychain erstellen
    security create-keychain -p "temp" build.keychain
    security default-keychain -s build.keychain
    security unlock-keychain -p "temp" build.keychain

    # Certificate importieren
    security import certificate.p12 -k build.keychain -P "${{ secrets.APPLE_CERTIFICATE_PASSWORD }}" -T /usr/bin/codesign
    security set-key-partition-list -S apple-tool:,apple: -s -k "temp" build.keychain

- name: Sign macOS executable (Apple Certificate)
  if: runner.os == 'macOS'
  run: |
    # Mit Apple Certificate signieren
    codesign --force --deep --sign "${{ secrets.APPLE_TEAM_ID }}" --timestamp ${{ matrix.asset_name }}${{ matrix.executable_extension }}

    # Überprüfe die Signatur
    codesign --verify --verbose ${{ matrix.asset_name }}${{ matrix.executable_extension }}

    # Optionally: Notarization für macOS 10.15+
    # xcrun altool --notarize-app --primary-bundle-id "com.example.swapi-cli" --file ${{ matrix.asset_name }}${{ matrix.executable_extension }}
```

### 4. Certificate vorbereiten

```bash
# .p12 Certificate zu Base64 konvertieren
base64 -i certificate.p12 -o certificate_base64.txt

# Den Inhalt von certificate_base64.txt als APPLE_CERTIFICATE_BASE64 Secret hinzufügen
```

## Vorteile von Apple Code Signing

✅ **Keine Gatekeeper-Warnungen**
✅ **Benutzer können App direkt starten**
✅ **Vertrauenswürdige Quelle**
✅ **Automatische Updates möglich**
✅ **Distribution über Mac App Store möglich**

## Alternative: Homebrew Distribution

Eine weitere Option ist die Distribution über Homebrew:

```bash
# Homebrew Formula erstellen
brew create https://github.com/dnl-jst/swapi-cli/releases/download/v1.0.1/swapi-cli-macos

# Dann können Nutzer installieren mit:
brew install dnl-jst/tap/swapi-cli
```

## Empfehlung

1. **Aktuell:** Ad-hoc Signing (bereits implementiert)
2. **Später:** Apple Developer Account + vollständiges Signing
3. **Alternative:** Homebrew Tap für einfache Installation

Das Ad-hoc Signing reduziert bereits die Sicherheitswarnungen erheblich!
