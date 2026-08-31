# Documentação – Construção das Paredes de Blocos

## 1. Introdução

No jogo Brick Breaker, as paredes de blocos representam os obstáculos que deverão ser destruídos pela bola durante cada nível. Para a construção dessas paredes, será utilizada uma estrutura baseada em **matriz**, na qual cada posição representa um possível bloco da fase.

A utilização de uma matriz facilita a organização dos blocos, permitindo definir quais posições serão ocupadas e quais permanecerão vazias. Dessa forma, é possível criar diferentes formatos de paredes e utilizar a mesma estrutura de dados para representar os diferentes níveis do jogo.

O projeto contará com **pelo menos cinco paredes de blocos diferentes**, sendo cada uma correspondente a um nível do jogo.

---

## 2. Método de construção da parede

A parede de cada nível será construída utilizando uma **matriz bidimensional**, composta por linhas e colunas.

Cada célula da matriz representará uma posição possível para um bloco. A célula poderá assumir, por exemplo, dois estados:

- `1` – existe um bloco na posição;
- `0` – a posição permanece vazia.

Um exemplo simplificado de uma matriz seria:

```text
1 1 1 1 1 1
1 1 0 0 1 1
1 0 1 1 0 1
1 1 1 1 1 1
```

Nesse exemplo, cada número 1 representa um bloco que será exibido na tela, enquanto cada número 0 representa um espaço vazio.
O jogo percorrerá a matriz linha por linha e coluna por coluna. Quando encontrar uma posição com valor 1, será criado um bloco naquela localização.

---

## 3. Posicionamento dos blocos

O posicionamento dos blocos será calculado de acordo com a quantidade de linhas e colunas definida para cada parede.
A largura disponível da tela será utilizada para distribuir os blocos horizontalmente, enquanto a altura destinada à parede será utilizada para definir a posição vertical dos blocos.
Dessa maneira, a parede poderá ocupar uma área significativa da tela do dispositivo, mantendo os blocos organizados e evitando que ultrapassem os limites da área destinada ao jogo.
Cada bloco terá uma largura e uma altura definidas nas configurações do jogo. O espaçamento entre os blocos também poderá ser considerado para melhorar a visualização da parede.

---

## 4. Paredes dos níveis

Serão desenvolvidas pelo menos cinco paredes diferentes, correspondendo aos cinco primeiros níveis do jogo.
Cada nível poderá possuir um padrão específico de organização dos blocos.
Nível 1
O primeiro nível poderá utilizar uma parede preenchida, contendo blocos em todas as posições da matriz.

```text
1 1 1 1 1 1
1 1 1 1 1 1
1 1 1 1 1 1
1 1 1 1 1 1
```

Nível 2
O segundo nível poderá utilizar espaços vazios nas posições centrais:

```text
1 1 1 1 1 1
1 1 0 0 1 1
1 1 0 0 1 1
1 1 1 1 1 1
```

Nível 3
O terceiro nível poderá utilizar um formato semelhante a uma pirâmide:

```text
0 0 1 1 0 0
0 1 1 1 1 0
1 1 1 1 1 1
1 1 1 1 1 1
```

Nível 4
O quarto nível poderá apresentar espaços alternados:

```text
1 0 1 0 1 0
0 1 0 1 0 1
1 0 1 0 1 0
0 1 0 1 0 1
```

Nível 5
O quinto nível poderá utilizar um padrão diferente, combinando regiões preenchidas e vazias:

```text
1 1 0 0 1 1
1 0 1 1 0 1
0 1 1 1 1 0
1 1 0 0 1 1
```

Os padrões apresentados são exemplos de organização. Os formatos definitivos poderão ser ajustados durante o desenvolvimento do aplicativo.

--- 

## 5. Utilização de aleatoriedade

Além das paredes com padrões previamente definidos, o projeto poderá utilizar aleatoriedade para determinar quais posições da matriz receberão blocos.
Nesse método, cada posição da matriz receberá um valor de forma aleatória. Por exemplo, o sistema poderá gerar um valor que determine se a célula deverá conter um bloco ou permanecer vazia.
Um exemplo de resultado gerado aleatoriamente seria:

```text
1 1 0 1 0 1
0 1 1 1 1 0
1 0 1 0 1 1
1 1 1 0 0 1
```

A utilização desse método permite produzir paredes diferentes, aumentando a variedade das fases.
Entretanto, a aleatoriedade deverá ser controlada para evitar a geração de paredes muito vazias ou com padrões que prejudiquem a jogabilidade. Dessa forma, poderão ser estabelecidos limites mínimos e máximos para a quantidade de blocos presentes em uma parede.

---

## 6. Método escolhido para o projeto

Para o desenvolvimento do jogo, será utilizada uma combinação de padrões previamente definidos e geração com aleatoriedade controlada.
Os primeiros níveis poderão utilizar padrões fixos, garantindo que o jogo apresente fases planejadas e testadas. Em níveis que utilizarem aleatoriedade, a matriz será preenchida automaticamente de acordo com regras previamente estabelecidas.
A estrutura em matriz permitirá que o código responsável pela criação dos blocos seja reutilizado em todos os níveis. Assim, para criar uma nova parede, será necessário apenas alterar os valores da matriz ou os parâmetros utilizados na geração aleatória.

---

## 7. Criação dos blocos no jogo

Após a definição da matriz, o sistema percorrerá todas as suas posições.
Para cada célula:
O sistema verifica o valor armazenado na posição.
Se o valor indicar que existe um bloco, um novo bloco será criado.
A posição do bloco será calculada de acordo com sua linha e coluna.
O bloco será adicionado à área de jogo.
Caso a posição esteja vazia, nenhum bloco será criado.
Esse processo permite separar a definição da parede da criação visual dos blocos, tornando o desenvolvimento mais organizado e facilitando futuras alterações nos níveis.

---

## 8. Alteração de tamanho e cores

As configurações definidas para o aplicativo também poderão influenciar a aparência dos blocos.
O tamanho dos blocos poderá ser definido por configurações previamente estabelecidas ou selecionadas pelo usuário, conforme as funcionalidades previstas para o aplicativo.
As cores também poderão ser configuradas, permitindo modificar o padrão visual utilizado na parede.
Independentemente da configuração escolhida, os blocos deverão permanecer organizados dentro dos limites da área de jogo.

---

## 9. Avanço entre os níveis

Cada parede será associada a um nível do jogo. Quando todos os blocos de uma parede forem destruídos, o nível será considerado concluído.
Após a conclusão, o próximo nível deverá ser iniciado automaticamente, apresentando uma nova parede de blocos.
Dessa forma, o fluxo esperado será:

```text
Nível 1
   ↓
Parede 1
   ↓
Todos os blocos destruídos
   ↓
Nível 2
   ↓
Parede 2
   ↓
Todos os blocos destruídos
   ↓
Nível 3
   ↓
...
   ↓
Nível 5
```

---

## 10. Conclusão

A construção das paredes de blocos será realizada principalmente por meio de uma matriz bidimensional, permitindo representar de forma simples e organizada quais posições deverão possuir blocos.
A utilização de padrões fixos possibilita criar níveis planejados, enquanto a utilização de aleatoriedade controlada permite aumentar a variedade das paredes.
Esse método também facilita a manutenção e evolução do projeto, pois a lógica responsável pela criação dos blocos poderá ser reutilizada para diferentes níveis. Com isso, será possível criar pelo menos cinco paredes distintas, mantendo a organização do código e garantindo que os padrões gerados permaneçam adequados à área disponível e à jogabilidade do Brick Breaker.
