# Ambiente de Desenvolvimento, Tecnologias e Geração do APK

## 1. Introdução

Para o desenvolvimento do aplicativo **Brick Breaker**, proposto na disciplina de Projeto Integrador VI-A, será utilizado o framework **Flutter**, juntamente com a linguagem **Dart** e a **Flame Engine**, utilizada para o desenvolvimento das mecânicas do jogo.

O projeto será desenvolvido para dispositivos móveis com sistema operacional Android, utilizando o GitHub como plataforma de hospedagem do código-fonte, documentação e colaboração entre os integrantes da equipe.

---

## 2. Ambiente de Desenvolvimento

O desenvolvimento será realizado utilizando as seguintes ferramentas:

| Ferramenta | Utilização |
|------------|------------|
| **Flutter SDK** | Desenvolvimento da aplicação móvel |
| **FVM** | Gerenciamento e padronização da versão do Flutter utilizada no projeto |
| **Dart** | Linguagem de programação do projeto |
| **Flame Engine** | Desenvolvimento das mecânicas do jogo 2D |
| **Android Studio** | Android SDK, emulador e ferramentas de desenvolvimento |
| **Visual Studio Code** | Edição e manutenção do código |
| **Git** | Controle de versão |
| **GitHub** | Hospedagem do projeto e trabalho colaborativo |
| **Figma** | Criação dos wireframes |

O **Android Studio** será utilizado principalmente para configuração do ambiente Android, incluindo o Android SDK e os emuladores necessários para os testes.

O **Visual Studio Code** será utilizado como editor de código durante o desenvolvimento do aplicativo.

---

## 3. Flutter

O **Flutter** será utilizado como framework principal para o desenvolvimento do aplicativo.

A escolha do Flutter ocorre devido à possibilidade de desenvolver aplicações para dispositivos móveis utilizando uma única base de código, além de oferecer recursos para construção de interfaces e navegação entre telas.

No projeto, o Flutter será responsável principalmente por:

- Tela inicial;
- Tela de integrantes;
- Tela de configurações;
- Navegação entre as telas;
- Interface geral da aplicação;
- Integração das configurações do jogo;
- Geração do aplicativo Android.

---

## 4. FVM (Flutter Version Management)

O **FVM (Flutter Version Management)** será utilizado para gerenciar e padronizar a versão do Flutter utilizada no desenvolvimento do projeto.

Como o projeto será desenvolvido de forma colaborativa por seis integrantes, é importante que todos utilizem uma versão compatível do Flutter. O FVM permitirá definir uma versão específica do Flutter para o projeto, reduzindo possíveis problemas de compatibilidade entre os diferentes ambientes de desenvolvimento.

A versão do Flutter utilizada pelo projeto será definida e registrada no repositório, permitindo que os integrantes configurem seus ambientes de desenvolvimento de maneira padronizada.

Entre as principais funções do FVM no projeto estão:

- Padronização da versão do Flutter entre os integrantes;
- Gerenciamento da versão do Flutter utilizada pelo projeto;
- Redução de problemas de compatibilidade;
- Facilitação da configuração do ambiente de desenvolvimento;
- Maior consistência entre os ambientes de desenvolvimento.

Os comandos relacionados ao Flutter serão executados utilizando o FVM. Dessa forma, o projeto utilizará a versão do Flutter definida para o repositório, evitando que diferentes versões instaladas nos computadores dos integrantes causem problemas de compatibilidade.

---

## 5. Linguagem Dart

A linguagem utilizada no projeto será a **Dart**, linguagem oficial do Flutter.

A Dart será utilizada para implementar a lógica da aplicação e do jogo, incluindo:

- Movimentação da plataforma;
- Movimentação da bola;
- Detecção de colisões;
- Destruição dos blocos;
- Sistema de pontuação;
- Controle dos níveis;
- Geração das paredes de blocos;
- Controle do estado do jogo;
- Configurações selecionadas pelo usuário;
- Navegação entre telas;
- Reprodução de efeitos sonoros.

---

## 6. Flame Engine

A **Flame Engine** será utilizada para implementar as principais mecânicas do Brick Breaker.

A Flame é uma engine para desenvolvimento de jogos 2D integrada ao Flutter, sendo adequada para o desenvolvimento dos elementos presentes no projeto.

Ela será utilizada principalmente para:

- Bola;
- Plataforma (paddle);
- Tijolos;
- Movimentação dos objetos;
- Detecção de colisões;
- Atualização do estado do jogo;
- Gerenciamento dos níveis;
- Renderização dos elementos;
- Efeitos sonoros.

Dessa forma, o **Flutter** ficará responsável principalmente pela estrutura da aplicação e suas telas, enquanto a **Flame** será utilizada na implementação da partida e de suas mecânicas.

---

## 7. Tecnologias do Projeto

A estrutura tecnológica planejada pode ser representada da seguinte maneira:

```text
                 BRICK BREAKER
                       |
             +---------+---------+
             |                   |
          Flutter              Flame
             |                   |
      +------+-------+      +----+------+
      |              |      |           |
   Interface      Navegação  Bola      Colisões
      |                     Paddle      |
      |                     Tijolos     |
      +----------+-------------+--------+
                 |
                Dart
                 |
          Lógica do jogo
                 |
                 v
             Android
                 |
                 v
                APK
```

---

## 8. Controle de Versão

O desenvolvimento será realizado de forma colaborativa utilizando **Git e GitHub**.

Todos os integrantes do grupo serão adicionados ao repositório e deverão contribuir para o desenvolvimento e documentação do projeto.

Será utilizado o padrão **Conventional Commits**, mantendo o histórico de alterações organizado.

Exemplos:

```text
feat: cria tela inicial
feat: implementa tela de configuracoes
feat: adiciona movimentacao da bola
feat: implementa colisao com blocos
feat: adiciona sistema de niveis
fix: corrige colisao da bola com paddle
docs: adiciona documentacao das tecnologias
docs: atualiza wireframes
refactor: reorganiza componentes do jogo
```

Também serão utilizados **commits incrementais**, evitando concentrar todas as alterações em um único commit.

---

## 9. Execução do Projeto

Após clonar o repositório, será necessário configurar o FVM e instalar as dependências do projeto.

A versão do Flutter definida para o projeto será utilizada por meio do FVM.

Os comandos básicos para execução serão:

```bash
git clone URL_DO_REPOSITORIO
cd brick-breaker
fvm install
fvm use
fvm flutter pub get
fvm flutter run
```

O comando `fvm install` instala a versão do Flutter configurada para o projeto.

O comando `fvm use` define a versão do Flutter que será utilizada pelo projeto.

O comando `fvm flutter pub get` instala as dependências utilizadas pelo projeto utilizando a versão do Flutter gerenciada pelo FVM.

O comando `fvm flutter run` permite executar o aplicativo em um dispositivo Android conectado ou em um emulador.

---

## 10. Verificação do Ambiente

Antes da execução e geração do aplicativo, o ambiente poderá ser verificado utilizando o comando:

```bash
fvm flutter doctor
```

Esse comando permite verificar se as ferramentas necessárias para o desenvolvimento estão corretamente configuradas.

Também será possível verificar a versão do Flutter utilizada pelo projeto através de:

```bash
fvm flutter --version
```

Dessa forma, os integrantes poderão confirmar que estão utilizando a versão definida para o projeto.

---

## 11. Geração do APK

Ao finalizar o desenvolvimento e realizar os testes do aplicativo, será gerado o arquivo **APK**, formato utilizado para instalação de aplicativos Android.

A geração do APK será realizada utilizando o Flutter gerenciado pelo FVM.

O comando utilizado será:

```bash
fvm flutter build apk --release
```

A opção `--release` gera uma versão otimizada do aplicativo para distribuição e entrega.

O arquivo gerado estará localizado em:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Esse arquivo será utilizado para a entrega do aplicativo conforme as orientações da disciplina.

---

## 12. Processo de Geração

O processo de geração do APK será realizado seguindo as seguintes etapas:

```text
Código-fonte
     ↓
Configuração do FVM
     ↓
Versão padronizada do Flutter
     ↓
fvm flutter pub get
     ↓
Testes
     ↓
Correção de erros
     ↓
fvm flutter doctor
     ↓
fvm flutter build apk --release
     ↓
app-release.apk
     ↓
Teste em dispositivo Android
     ↓
Entrega
```

Antes da entrega, o APK será instalado em um dispositivo Android ou emulador para verificar o funcionamento das principais funcionalidades.

---

## 13. Conclusão

A utilização de **Flutter, Dart, Flame Engine e FVM** atende aos requisitos do projeto e possibilita o desenvolvimento de uma aplicação móvel contendo as interfaces e as mecânicas necessárias para o jogo Brick Breaker.

O Flutter será utilizado na estrutura e nas interfaces da aplicação, enquanto a Flame Engine será utilizada principalmente para as mecânicas do jogo, como movimentação, colisões e gerenciamento dos elementos.

O **FVM** será utilizado para padronizar a versão do Flutter entre os integrantes da equipe, contribuindo para um ambiente de desenvolvimento mais consistente e reduzindo possíveis problemas de compatibilidade.

O Git e o GitHub permitirão o desenvolvimento colaborativo entre os integrantes da equipe, utilizando commits incrementais e o padrão Conventional Commits.

Ao final do desenvolvimento, o aplicativo será compilado em modo **Release** utilizando o comando `fvm flutter build apk --release`, gerando o arquivo APK para instalação e entrega.
