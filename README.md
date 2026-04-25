# Traffic Light FSM

Semafor cu buton de pieton, scris in SystemVerilog. Proiect din CID lab 11 (Automate finite), ETTI UPB.

## Stari

| Stare | Cod | Durata (cicluri) |
|---|---|---|
| ROSU | `00` | 8 |
| ROSU + GALBEN | `01` | 2 |
| VERDE | `10` | 8 |
| GALBEN | `11` | 2 |

Daca `pedestrian == 1` cand e VERDE, trece imediat la GALBEN.

## Iesiri

- `led_rosu` aprins in starile ROSU si ROSU_GALBEN
- `led_galben` aprins in starile ROSU_GALBEN si GALBEN
- `led_verde` aprins in starea VERDE

## Fisiere

- `src/traffic_light.sv`
- `sim/traffic_light_tb.sv`

## Simulare in Vivado

1. Create New Project, RTL
2. Add Sources, `src/` si `sim/`
3. Set `traffic_light_TB` ca top
4. Run Behavioral Simulation

## Waveform

![Traffic Light Waveform](screenshots/traffic_light_waveform.png)

Tranzitiile FSM: `00` -> `01` -> `10` -> `11` -> `00`. La 40ns, `pedestrian_t` devine 1 in VERDE si forteaza tranzitia la GALBEN.
