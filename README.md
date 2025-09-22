# Noppanalys - Interaktiv Textilanalys

<<<<<<< HEAD
En avancerad applikation för analys av textila material med fokus på noppdetektering och ytstrukturanalys. Utvecklad med moderna bildanalysmetoder och maskininlärningstekniker.

## Om Applikationen

Noppanalys är ett verktyg för kvalitetsbedömning av textila material genom automatisk bildanalys. Applikationen kombinerar flera avancerade analysmetoder för att identifiera och klassificera noppar (pills) och andra ytdefekter i textiler.

## Huvudfunktioner

### 🔬 Analysmetoder

**Grundläggande Metoder:**
- **LBP + Varians**: Local Binary Pattern med variansanalys för texturdetektering
- **Fourier + Gauss**: Frekvensdomänanalys med gaussisk filtrering
- **Morfologisk**: Matematisk morfologi för strukturdetektering

**Experimentella Metoder:** *(Aktiveras i experimentellt läge)*
- **Wavelet Transform**: Flerskalig wavelet-analys för detaljrik texturanalys
- **Kombinerad**: Hybridmetod som kombinerar flera tekniker
- **DPCA + ML**: Dimensionalitetsreduktion med maskininlärning

### 🖼️ Bildhantering & UI-funktioner

- **Bildladdning**: Stöd för PNG, JPG, JPEG, BMP, TIFF format
- **Interaktiv Zoom**: Klicka och dra för att välja analysområde (ROI)
- **Realtidsuppdatering**: Parametrar uppdateras direkt i visualiseringen
- **Laddningsindikatorer**: Animerad aktivitetsindikator under processer
- **Jämförelseläge**: Kör alla metoder samtidigt för komparativ analys

### 📊 Visualisering & Analys

- **Färganalys**: Automatisk färgviktsberäkning baserat på bildinnehåll
- **Statistisk analys**: Detaljerad statistik över identifierade noppar
- **Parameterinställningar**: Justerbara inställningar för varje analysmetod
- **Resultatexport**: Spara analyser och parametrar

## Teknisk Beskrivning av Analysmetoder

### LBP + Varians (Local Binary Pattern)
Använder lokala binära mönster för att karakterisera texturer i bilden. Metoden:
- Beräknar LBP för varje pixel med konfigurerbar radie och antal punkter
- Kombinerar med variansanalys för att identifiera områden med ojämn textur
- Optimal för att detektera småskaliga texturvariationer som noppar

### Fourier + Gauss (Frekvensdomänanalys)
Analyserar bilden i frekvensdomänen för att identifiera periodiska strukturer:
- Tillämpar Fourier-transform för att identifiera frekvenskomponenter
- Använder gaussisk filtrering för brusreducering
- Detekterar avvikelser från den förväntade textila strukturen

### Morfologisk Analys
Använder matematisk morfologi för strukturell bildanalys:
- Tillämpar erosions- och dilationsoperationer
- Identifierar sammanhängande strukturer och defekter
- Effektiv för att separera noppar från bakgrundstextur

### Wavelet Transform *(Experimentell)*
Flerskalig analys med wavelet-transformation:
- Dekomponerar bilden i olika skalor och orientationer
- Identifierar lokala diskontinuiteter och texturavvikelser
- Särskilt användbar för komplexa textilstrukturer

### DPCA + ML *(Experimentell)*
Avancerad maskininlärningsmetod:
- Dimensionalitetsreduktion med Principal Component Analysis
- Klassificering med Neural Networks, SVM och Random Forest
- Automatisk gradindelning av noppning enligt textilstandarder
- Statistiska mått inklusive skewness och kurtosis

## Installation och Användning

### Nedladdning
Ladda ner den senaste versionen från [Releases](https://github.com/DoTankCenter/Pilling_method_evaluation/releases)

### Körning av Applikationen
1. Ladda ner och kör `Noppanalys.exe`
2. Ingen installation krävs - applikationen är självständig

### Från Källkod
```bash
cd src
python noppanalys_gui.py
```

## Användargränssnitt och Funktioner

### 🖼️ Bildhantering
- **Ladda Bild**: Klicka på "Ladda Bild" eller använd menyn Fil → Öppna
- **Zoomfunktion**:
  - Aktivera "Zoom Mode" för att välja analysområde
  - Klicka och dra för att skapa rektangulärt ROI (Region of Interest)
  - "Reset Zoom" återgår till hela bilden

### ⚙️ Analysparametrar
- **Metod**: Välj mellan grundläggande och experimentella analysmetoder
- **Reglage**: Justera metodspecifika parametrar med realtidsuppdatering
- **Färgvikter**: Justera RGB-vikter för färganalys
- **Experimentellt läge**: Aktivera för tillgång till avancerade metoder

### 🔄 Analys och Resultat
- **Enkel Analys**: Kör vald metod med "Analysera"
- **Jämförelse**: "Jämför Alla Metoder" visar resultat från alla tillgängliga metoder
- **Laddningsindikatorer**:
  - Animerad aktivitetsindikator visar pågående processer
  - Statusmeddelanden informerar om aktuell operation
- **Realtidsuppdatering**: Parameterjusteringar uppdaterar automatiskt resultatet

### 💾 Export och Spara
- **Spara Analys**: Exportera resultat och inställningar till fil
- **Funktionsbeskrivning**: Generera teknisk dokumentation av analysmetoder

## Systemkrav och Beroenden

### Systemkrav
- Windows 10/11 (64-bit)
- Minst 4GB RAM
- 500MB ledigt diskutrymme

### Python-beroenden (för utvecklare)
**Kärnbibliotek:**
- `numpy >= 1.21.0` - Numeriska beräkningar
- `opencv-python >= 4.5.0` - Bildbehandling
- `matplotlib >= 3.5.0` - Visualisering
- `scipy >= 1.7.0` - Vetenskapliga beräkningar
- `scikit-image >= 0.18.0` - Bildanalys
- `Pillow >= 8.0.0` - Bildhantering

**Avancerade funktioner:**
- `scikit-learn >= 1.0.0` - Maskininlärning
- `PyWavelets >= 1.1.0` - Wavelet-analys

### Utvecklingsbygge
För att bygga applikationen från källkod:
```bash
pip install -r requirements.txt
pyinstaller noppanalys.spec
```

## Teknisk Support och Utveckling

### Bidrag
Välkomna bidrag till projektet! Se till att:
- Dokumentera nya analysmetoder
- Inkludera tester för nya funktioner
- Följ befintliga kodkonventioner

### Buggrapporter
Rapportera problem via GitHub Issues med:
- Detaljerad beskrivning av problemet
- Steg för att återskapa
- Systemkonfiguration

---

<img width="1270" height="270" alt="EU_logga" src="https://github.com/user-attachments/assets/6ab1b8af-ac04-4de5-bcd0-b52f819a3b0a" />
<img width="625" height="351" alt="wargon_logo" src="https://github.com/user-attachments/assets/cd6e26c3-23d8-4fa5-961d-511b7f4010b2" />
**Utvecklad i projektet "Innovationsmiljö för hållbar produktion och cirkulära flöden" på Wargön Innovation som är medfinansierat av Europeiska Unionen.**
=======
This is the standalone Noppanalys application to discover analyze methods for Pilling.
>>>>>>> 833646a925633f663065574b0506334363c0a24f

