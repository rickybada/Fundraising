# Fundraising Smart Contract | Start2Impact 🚀  

## Descrizione del Progetto 📋

Questo progetto è uno smart contract scritto in Solidity che gestisce una campagna di raccolta fondi su Ethereum. Permette di raccogliere donazioni, monitorare il progresso verso un obiettivo di raccolta fondi e ritirare i fondi raccolti.

## Caratteristiche Principali 🌟

- **Gestione delle Donazioni**: Permette agli utenti di donare Ether alla campagna.
- **Monitoraggio degli Obiettivi**: Verifica e restituisce lo stato dell'obiettivo di raccolta fondi.
- **Ritiro dei Fondi**: Consente al proprietario di ritirare i fondi raccolti.

## Prerequisiti 🛠️

- Solidity ^0.8.0
- Ethereum Wallet (es. MetaMask)

## Dettagli del Contratto 📜

### Variabili di Stato

- `owner`: L'indirizzo del proprietario del contratto.
- `balance`: Il bilancio corrente dei fondi raccolti.
- `goal`: L'obiettivo di raccolta fondi in Ether.
- `uniqueDonorsCount`: Il conteggio dei donatori unici.
- `currentStatus`: Lo stato corrente della campagna (Aperta o Chiusa).

### Eventi

- `DonationReceived`: Emesso ogni volta che viene ricevuta una donazione, registra l'indirizzo del donatore e l'importo.

### Mapping

- `hasDonated`: Traccia se un indirizzo ha già effettuato una donazione.

### Funzionalità del Contratto

- **Costruttore**
  - Inizializza il contratto con il proprietario, l'obiettivo (`goal`), lo stato (`currentStatus`) e il bilancio (`balance`).

- **Modificatori**
  - `onlyOwner`: Limita l'accesso a determinate funzioni solo al proprietario del contratto.

- **Funzione `makeDonation`**
  - Permette agli utenti di fare una donazione.
  - Verifica che la campagna sia aperta e che l'importo sia almeno di 1 Wei.
  - Aggiorna il bilancio e, se è la prima donazione di un indirizzo, incrementa il conteggio dei donatori unici.
  - Emette l'evento `DonationReceived`.

- **Funzione `makeWithdraw`**
  - Permette al proprietario di ritirare i fondi raccolti.
  - Verifica che ci siano fondi disponibili e trasferisce il bilancio al proprietario, resettando il bilancio del contratto a 0.

- **Funzione `checkTarget`**
  - Verifica lo stato dell'obiettivo di raccolta fondi.
  - Restituisce un messaggio che indica se l'obiettivo è stato raggiunto, superato o non ancora raggiunto.

## Installazione e Utilizzo 🚀

1. **Clona il Repository:**

    ```bash
    git clone https://github.com/rickybada/Fundraising.git
    cd fundraising-smart-contract
    ```

2. **Compila e Distribuisci il Contratto:**
   - Utilizza Remix IDE o Truffle per compilare e distribuire il contratto sulla rete Ethereum.

3. **Interagisci con il Contratto:**
   - Usa un'interfaccia come Remix IDE, Truffle o una dApp personalizzata per interagire con il contratto.

## Contributi 🤝

I contributi sono benvenuti! Sentiti libero di aprire issue o pull request per migliorare questo progetto.

## Licenza 📄

Questo progetto è rilasciato sotto la licenza MIT. Consulta il file LICENSE per ulteriori dettagli.

---
