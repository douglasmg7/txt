# Controladora de Vôo (Flight controller (FC))
A vibração dos motores pode prejudicar o correto funcionamento dos sensores presentes no flight controller. Por isso a montagem do flight controller no frame deve ser bem feita de modo a minimizar as vibrações na mesma.  
A presença de uma entrada USB no flight controller é uma indicação que a mesma permite um firmware que possa ser configurada pelo computador.  
A presença de uma antena indica que pode existir um receiver ou/e um VTX imbutido. Se tiver duas fileiras de leds (para informar o canal e a frequencia) provavelmente é um VTX.
Placas PNP não têm nem receptor nem transmissor.

## Conector de alimentação
Por onde o flight controller recebe a energia proviniente da bateria.
Deve ser corretamente dimensionado para que não se aqueça.
Pitch é a distância entre os pinos do conector.

## Pinout diagram
Indica cada função de um pino ou pad.
Pode ser pesquisado por imagens google.

## PDB - Power Distribution Board
É um regulador de tensão que fornece a tensão necessária pelo FC e ESC.
Geralmete o FC não tem regulador de tensão.

## VBAT/VCC - Voltage fo the battery
VBAT is just the raw LiPo voltage, not regulated. So it is whatever voltage the connected LiPo is.
NOT regulated which means the voltage changes as the battery discharges.
If a device takes VBAT as input, then it probably has a voltage regulator to step it down to what it needs internally,
or is simply monitoring the voltage (to display on an OSD for instance).

## RAM pin
Provide dedicated power for VTX and camera.
Sometimes filtered for cleaner video.

### JST
Pinos clipados  

#### JST PH1.25
Usado inicialmete
Uso em Tiny whoop
Mais antigo

#### JST PH2.0
Usado atualmente
Uso em Tiny whoop
2A contínuo
3.5A pico

### BT2.0
Pareceido com XT30 e XT60 para baterias maiores
Pinos sólidos  
9A contínuo
10A pico

### XT30
Pinos sólidos


## Receptor - RX
Dispositivo responsável por recebe o sinal proviniente do controle (TX)
* Traduz as informações utilizando um protocolo específico.
* Envia os comando para o controlador de vôo.

### Canais
Utilizado para enviar as informações, cada canal permite uma informação específica.

### PWM
Sistema utilizado para enviar os comandos




## Acelerometro

## Giroscópio


