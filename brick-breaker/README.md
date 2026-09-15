# Brick Breaker

Aplicativo móvel em **Dart + Flutter + Flame**, baseado no clássico Brick Breaker.

Projeto Integrador VI-A — Grupo 5.

## Como rodar depois de baixar

1. Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install).
2. Na pasta do projeto:

```bash
flutter pub get
flutter run
```

Para gerar o APK Android:

```bash
flutter build apk --release
```

Se o grupo usar FVM:

```bash
fvm install
fvm use
fvm flutter pub get
fvm flutter run
```

## O que já está no código (Dart)

- Telas: menu, integrantes, configurações, seleção de nível, preview, gameplay, transição, game over e vitória
- Flame: bola, paddle, colisão e paredes em matriz
- 5 fases com padrões diferentes de tijolos
- Configuração de dificuldade, velocidade, cor e tamanho dos tijolos
- Sons de efeito e pontuação

## Integrantes

- Cristian Morés Dalcin
- Eduardo dos Santos
- Gustavo Henrique Rajab
- Kédyna Lagni
- Paula Cristina da Rocha Paim
- William Miguel Santos Pereira
