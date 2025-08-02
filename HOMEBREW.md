# Homebrew Distribution für Star Wars CLI 🍺

## Setup-Anleitung

### 1. Homebrew Tap Repository erstellen

```bash
# Erstelle neues GitHub Repository namens "homebrew-tap"
# URL: https://github.com/dnl-jst/homebrew-tap
```

### 2. Formula hochladen

```bash
# Klone das homebrew-tap Repository
git clone https://github.com/dnl-jst/homebrew-tap.git
cd homebrew-tap

# Kopiere die Formula
mkdir -p Formula
cp ../swapi-cli/Formula/swapi-cli.rb Formula/

# Committe und pushe
git add Formula/swapi-cli.rb
git commit -m "Add swapi-cli formula"
git push origin main
```

### 3. GitHub Secret konfigurieren

Erstelle einen GitHub Personal Access Token:
1. GitHub → Settings → Developer settings → Personal access tokens
2. "Generate new token" → Scopes: `public_repo`
3. Füge als Secret `HOMEBREW_TAP_TOKEN` zu deinem swapi-cli Repository hinzu

### 4. Installation testen

```bash
# Nutzer können dann installieren mit:
brew tap dnl-jst/tap
brew install swapi-cli

# Oder in einem Schritt:
brew install dnl-jst/tap/swapi-cli
```

## Verwendung nach Installation

```bash
# Direkt verfügbar als:
swapi --help
swapi people
swapi films

# Oder als:
swapi-cli --help
```

## Automatische Updates

Die GitHub Action `homebrew.yml` aktualisiert automatisch die Homebrew Formula bei neuen Releases.

## Vorteile von Homebrew

✅ **Einfache Installation:** `brew install dnl-jst/tap/swapi-cli`
✅ **Automatische Updates:** `brew upgrade swapi-cli`
✅ **Keine Gatekeeper-Probleme:** Homebrew wird vertraut
✅ **Dependency Management:** Homebrew verwaltet alles
✅ **Saubere Deinstallation:** `brew uninstall swapi-cli`
✅ **Vertraute macOS-Lösung:** Die meisten Entwickler nutzen Homebrew

## Formula-Updates

Bei jedem neuen Release:
1. GitHub Action läuft automatisch
2. Berechnet neuen SHA256 Hash
3. Aktualisiert Formula in homebrew-tap
4. Nutzer erhalten Update via `brew upgrade`
