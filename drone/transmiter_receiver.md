# Protocolos

# Módulos
Serve para comunicar com um TX espcífico
Consiste em um chip ATMEGA328 e um de frequência de 2.4GHZ


# Receptor (RX)
Dispositivo responsável por recebe o sinal proviniente do controle (TX)
* Traduz as informações utilizando um protocolo específico.
* Envia os comando para o controlador de vôo.
Pode ser um dispositivo externo que é conectado ao FC ou imbutido (onboard) ao FC.

## Modelos

### TBS Crossfire
CSRF Crossfire
Muito bom, Que muitos profissionais usam.
Um módulo (TBS Module Micro TX) deve ser colocado atrás de um rádio multi-protocolo.

### FlySky 
IBUS
AFHDS, AFHDS 2A
* Automatic Frequency Hopping Digital System (AFHDS) spread spectrum technology

### FrSky
SBUS
Fport, D8, D16, LR12

### Spektrum
DSM, DSM2, DSMX


## Protocolos universais

### PCM

### PWM (Pulse Width Modulation)
É utilizado um fio para cada conector do receiver (canal) para conectar ao respectivo servo. Sendo necessario um fio por conector do receiver.
A modulação é feito pelo tempo em alto.
Geralmente 10000 ms para mínimo, 15000 ms para médio e 20000 ms para máximo.
Mais fios para fazer as conexões, criando um pouco mais de desorganização.

### CPPM/PPM - Pulse Position Modulation - Analog
Todos os servos são conectados por um único fio a um único conector do receiver.  
As informações são enviadas cada momento a um servo específico.
Mais organizado, pois utiliza apenas um fio.

### SBUS or IBUS - Serial BUS - Digital
Permite o uso de um único cabo para conectar todos os servos, mas não é igual ao PPM.
SBUS inverted signaling (1=low, 0=high)
IBUS standard signaling (1=high, 0=low)
Some flight controllers can automatically configure inversion when you set the serial receiver type, other can't.
If a manufacturer indicates that a certain UART should be used for a certain protocol, it's best to follow that recommendation.
    * Especially true on F4 boards.


## Exemplo
O FC BEECORE F3 EVO que é um brushed flight controller tem a opção de ser comprada com receiver com protocolo para comunicar com FRSKY, FLYSKY ou DMS2.

## Bind
Quando é estabelecida uma comunicação (pareamento)  entre um transmissor e um receptor.



## Canais
Utilizado para enviar as informações, cada canal permite uma informação específica.
* Subir / descer
* Direita /esquera
* Frente /trás
* Girar
* Troca do vôo
* Disponível

## Receptores nano e micro
Utilizados nos Tiny Whoops
Utiliza PPM
Alcance em torno de 300 a 400 metros


# Transmissor (TX)

## Distância de atuação

## Modo de uso
Thumb vs Pitching

## Marcas

### FlySky (FS)
TX e RX
Chinesa
Custo baixo a alto
Recomendado para inicicante

#### Modelos
FS-i6 (sem telemetria)
FS-i6s (touch screen e mais fácil de configurar)
FS-Nirvana (usa pilhas 18500 ou 18650 dependendo do modelo, touch screen colorido)

### FrSky
TX e RX
Chinesa
Mais funcionalidades
Custo médio a alto
Multiprotocolo (Permite uso de módulos para usar diferentes protocolo)

#### Modelos
Taranis Q X7 (firmware de código aberto OPEN TX)
* Tem mais sensibilidade que o FrSky.
* Os que tem o sensor HAL tem mais sensibilidade ainda.
Taranis X-Lite (PRO ou S)
Taranis X9D 
Taranis X9D Plus
* sensor HAL
* Um dos mais utilizados
* Specificado pela Make FPV Drone Course

### Spektrum (DSM, DSM2 ou DSMX)
Protocolo DSM, DSM2 e DSMX
Pouco utilizados

#### Modelos
DX6i
JR X9503


### Radiomaster
Multi-protocolo

#### Modelos
T16


### Jumper
Multi-protocolo

#### Modelos
T16
T16 Plus
T16 Pro
* Built-in (internal) Multi-protocol module (freeing the external JR port for TBS CRSF module)
* T16 Pro Exclusive Hall Sensor Gimbals



### TBS Crossfire


### Rádio controle E010
Péssima precisão


## Power
Almost all receiver use 5v power.
Spektrum satellite receivers use 3V3 power.
