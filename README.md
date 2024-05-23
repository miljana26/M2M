# M2M

## GSM PARKING RAMPA i TFT Kalkulator

### Opis projekta

Ovaj projekat je podeljen na dva dela:

1. **Program GSM PARKING RAMPA**
2. **Kalkulator koristeći TFT displej 5"**

#### Prvi deo: Program GSM PARKING RAMPA

Ovaj program simulira broj parking mesta koristeći PORTB za prikaz slobodnih mesta putem LED indikacija. Parking ima kapacitet od 16 mesta, što je prikazano pomoću 16 LED dioda na PORTB. U početku su sva mesta slobodna, i sve LED diode su isključene.

##### Funkcionalnosti

- **Registracija pretplatnika**:
  - Kada modem primi SMS sa sadržinom `+PRETPLATA`, broj mobilnog pretplatnika se automatski memoriše i dodaje u bazu.
  
- **Otvaranje rampe**:
  - Ako registrovani pretplatnik pozove broj, rampa se otvara i uključuje se prva slobodna LED na PORTB.
  - Svaki sledeći poziv registrovanog pretplatnika uključuje narednu slobodnu LED na PORTB, sve dok ima slobodnih mesta.
  
- **Napustanje parking mesta**:
  - Kada korisnik napusti zauzeto mesto, pritisne taster na PORTA (npr. A0) što isključuje jednu LED na PORTB i brojač beleži novo stanje.
  
- **Brisanje pretplatnika iz baze**:
  - Ako korisnik pošalje SMS sa sadržinom `-PRETPLATA`, broj se prepoznaje, briše iz baze, i korisnik više nema mogućnost parkiranja (pozivi se više ne registruju).

#### Drugi deo: Kalkulator koristeći TFT displej 5"

Ovaj deo projekta implementira kalkulator na TFT displeju od 5". Kalkulator omogućava osnovne matematičke operacije i neke dodatne funkcije.

##### Funkcionalnosti

- Sabiranje
- Oduzimanje
- Množenje
- Deljenje
- Koren broja
- Kvadrat broja

Dodatne funkcionalnosti mogu biti implementirane po želji.

#### Beleške i nedostaci

- **Kalkulator**:
  - Ne prepoznaje prioritet operacija i računa redom sleva nadesno.
  - Primer: Ako unesete `16sqrt+22-2`, rezultat će biti tačan. Međutim, ako unesete `22-2+16sqrt`, računaće samo koren broja, a ostatak zanemariti.

