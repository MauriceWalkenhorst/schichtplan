# 🎬 Sneak Prognose | UCI Ruhr Park

**Die ultimative Sneak Preview App für das UCI Ruhr Park**

[![Live Demo](https://img.shields.io/badge/Live-Demo-brightgreen?style=for-the-badge)](https://mauricewalkenhorst.github.io/Walter_Projekte/sneak_prognose_v3.html)

## ✨ Features

### 🎨 Design
- **Glassmorphism UI** - Moderne, durchsichtige Karten mit Blur-Effekt
- **Aurora Background** - Dynamische Farbverläufe
- **Responsive** - Perfekt für Mobile & Desktop
- **Dark Mode** - Optimiert für Kino-Atmosphäre

### 📱 PWA (Progressive Web App)
- ✅ **Installierbar** - Auf Homescreen hinzufügen
- ✅ **Offline-fähig** - Funktioniert ohne Internet
- ✅ **App-like Experience** - Native App Feel

### 🎯 Funktionen
- **⭐ Bewertungssystem** - 1-5 Sterne mit Animationen
- **💬 Reviews** - Kommentare zu Filmen speichern
- **📊 Statistiken** - Filme gesehen, Ø Bewertung, Streak
- **🔮 Prognosen** - Wahrscheinlichkeitsanzeige für nächste Woche
- **📤 Sharing** - Teile Filme & Prognosen
- **💾 Backup** - Exportiere deine Daten

### 🛠️ Technologien
- Tailwind CSS
- Alpine.js
- TMDB API (Poster)
- LocalStorage (Datenspeicherung)

## 🚀 Schnellstart

### Online nutzen
Einfach öffnen: `https://mauricewalkenhorst.github.io/Walter_Projekte/sneak_prognose_v3.html`

### Als App installieren
1. Im Browser öffnen (Chrome/Edge/Safari)
2. "Zum Startbildschirm hinzufügen" wählen
3. Fertig! 🎉

### Lokal nutzen
```bash
git clone https://github.com/MauriceWalkenhorst/Walter_Projekte.git
cd Walter_Projekte
# Öffne sneak_prognose_v3.html im Browser
```

## 📁 Dateien

| Datei | Beschreibung |
|-------|--------------|
| `sneak_prognose_v3.html` | **Hauptdatei** - Launch Ready Version |
| `sneak_prognose_modern.html` | Alternative moderne Version |
| `sneak_prognose_v2.html` | Legacy Version |

## 🔐 Admin Zugang

Zum Bearbeiten der Filmdaten:
- **Password:** `Lesterw45`
- Auf das Zahnrad-Icon klicken → Admin → Login

## 📝 Datenformat

Filmdaten werden im LocalStorage gespeichert:

```json
{
  "hero": {
    "title": "Film Titel",
    "poster": "/tmdb-poster-path.jpg",
    "meta": "2026 · Genre",
    "id": "unique-id"
  },
  "prediction": {
    "title": "Nächster Film",
    "poster": "/path.jpg",
    "meta": "2026 · Genre",
    "prob": 92
  },
  "history": [...]
}
```

## 🎨 Screenshots

*(Hier Screenshots einfügen)*

## 🤝 Mitmachen

1. Fork das Repository
2. Erstelle einen Branch (`git checkout -b feature/AmazingFeature`)
3. Committe deine Änderungen (`git commit -m 'Add some AmazingFeature'`)
4. Pushe zum Branch (`git push origin feature/AmazingFeature`)
5. Öffne einen Pull Request

## 📄 Lizenz

MIT License - Siehe [LICENSE](LICENSE) für Details

---

**Made with 🍿 for UCI Ruhr Park Sneak Fans**
