# Protocolos

# Módulos
Serve para comunicar com um tx espcífico
Consiste em um chip ATMEGA328 e um de frequência de 2.4GHZ


# Transmissor (TX)


# Receptor (RX)
Dispositivo responsável por recebe o sinal proviniente do controle (TX)
* Traduz as informações utilizando um protocolo específico.
* Envia os comando para o controlador de vôo.
Pode ser um dispositivo externo que é conectado ao FC ou imbutido (onboard) ao FC.

## Exemplo
O FC BEECORE F3 EVO que é um brushed flight controller tem a opção de ser comprada com receiver com protocolo para comunicar com FRSKY, FLYSKY ou DMS2.

## Bind
Quando é estabelecida uma comunicação (pareamento)  entre um transmissor e um receptor.

## PWM (Pulse Width Modulation)
É utilizado um fio para cada conector do receiver (canal) para conectar ao respectivo servo. Sendo necessario um fio por conector do receiver.
A modulação é feito pelo tempo em alto.
Geralmente 10000 ms para mínimo, 15000 ms para médio e 20000 ms para máximo.
Mais fios para fazer as conexões, criando um pouco mais de desorganização.

## CPPM/PPM (Pulse Position Modulation)
Todos os servos são conectados por um único fio a um único conector do receiver.  
As informações são enviadas cada momento a um servo específico.
Mais organizado, pois utiliza apenas um fio.

## SBUS (serial bus)
Permite o uso de um único cabo para conectar todos os servos, mas não é igual ao PPM.

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

## Distância de atuação

# Marcas

## FlySky (FS)
TX e RX
Chinesa
Custo baixo a alto
Recomendado para inicicante

### Modelos
FS-i6
FS-i6s (touch screen e mais fácil de configurar)
FS-Nirvana (usa pilhas 18500 ou 18650 dependendo do modelo, touch screen colorido)

## FrSky
TX e RX
Chinesa
Mais funcionalidades
Custo médio a alto
Multiprotocolo (Permite uso de módulos para usar diferentes protocolo)

### Modelos
Taranis Q X7 (firmware de código aberto OPEN TX)
* Tem mais sensibilidade que o FrSky.
* Os que tem o sensor HAL tem mais sensibilidade ainda.
Taranis X-Lite (PRO ou S)
Taranis X9D 
Taranis X9D Plus
* sensor HAL
* Um dos mais utilizados
* Specificado pela Make FPV Drone Course

## Spektrum (DSM, DSM2 ou DSMX)
Protocolo DSM, DSM2 e DSMX
Pouco utilizados

### Modelos
DX6i
JR X9503

## Rádio controle E010
Péssima precisão

