# IMDb Movies Rating Analysis

![IMDb Movies Rating Analysis](https://github.com/user-attachments/assets/200063ae-f835-441f-90a9-c9786da5b8a3)

## **Visão Geral**
Este projeto utiliza dados de filmes do IMDb para realizar análises exploratórias e criar visualizações interativas no Power BI. As análises incluem métricas como avaliações de filmes, principais diretores, e foco no cinema brasileiro e em atrizes específicas.

## **Objetivo**
O objetivo deste projeto é explorar o dataset do IMDb, destacando filmes de 2024, cinema brasileiro em português e análises envolvendo as atrizes renomadas Fernanda Torres e Fernanda Montenegro.

## **Dataset Utilizado**

Os dados foram extraídos do [IMDb Movies Dataset no Kaggle](https://www.kaggle.com/datasets/hetbabariya/imdb-movies-data-collection-5000-records/data), que contém informações detalhadas sobre mais de 5000 filmes, incluindo:

- **Title:** Nome do filme.
- **Average Rating:** Avaliação média no IMDb.
- **Director:** Nome(s) do(s) diretor(es).
- **Writer:** Nome(s) do(s) roteirista(s).
- **Metascore:** Pontuação dos críticos (alguns dados ausentes).
- **Cast:** Principais atores.
- **Release Date:** Data de lançamento do filme.
- **Country of Origin:** País(es) de produção.
- **Languages:** Idiomas utilizados no filme.
- **Budget:** Orçamento de produção (alguns valores não numéricos).
- **Worldwide Gross:** Receita total mundial (com valores ausentes).
- **Runtime:** Tempo de execução do filme em minutos.


## **Tecnologias Utilizadas**
- **SQL**: Para consultas e extração de dados do dataset.
- **Power BI**: Para criar visualizações interativas.

## **Consultas Realizadas**
As seguintes consultas SQL foram utilizadas para extrair os dados:

1. **Melhores Filmes de 2024:**
   ```sql
   SELECT DISTINCT TOP 10 Title, Date, Average_Rating / 10 AS Rating, Director, Cast, Country_of_Origin, Languages, Runtime
   FROM DBO.IMDB_MOVIES
   WHERE YEAR(Date) = 2024
   ORDER BY Rating DESC;
   ```

2. **Melhores Filmes Brasileiros em Português:**
   ```sql
   SELECT DISTINCT TOP 10 Title, Date, Average_Rating / 10 AS Rating, Director, Cast, Country_of_Origin, Languages, Runtime
   FROM DBO.IMDB_MOVIES
   WHERE Country_of_Origin LIKE 'Brazil%' AND Languages LIKE 'Portuguese%'
   ORDER BY Rating DESC;
   ```

3. **Melhores Filmes com Fernanda Torres:**
   ```sql
   SELECT DISTINCT Title, Date, Average_Rating / 10 AS Rating, Director, Cast
   FROM DBO.IMDB_MOVIES
   WHERE Cast LIKE '%FERNANDA TORRES%';
   ```

4. **Melhores Filmes com Fernanda Montenegro:**
   ```sql
   SELECT DISTINCT Title, Date, Average_Rating / 10 AS Rating, Director, Cast
   FROM DBO.IMDB_MOVIES
   WHERE Cast LIKE '%FERNANDA MONTENEGRO%';
   ```

5. **Melhores Filmes com Fernanda Torres e Fernanda Montenegro:**
   ```sql
   SELECT Title, Date, Director, Cast
   FROM DBO.IMDB_MOVIES
   WHERE Cast LIKE '%FERNANDA TORRES%' AND Cast LIKE '%FERNANDA MONTENEGRO%';
   ```

6. **Diretores com Melhores Filmes em Português:**
   ```sql
   SELECT TRIM(value) AS Director, COUNT(Title) AS Total_Filmes
   FROM DBO.IMDB_MOVIES
   CROSS APPLY STRING_SPLIT(Director, ',')
   WHERE Languages LIKE 'Portuguese%'
   GROUP BY TRIM(value)
   ORDER BY Total_Filmes DESC;
   ```

## **Visualizações Criadas no Power BI**

1. **Top 10 Best-Rated Brazilian Movies of All Time:**
   - Gráfico de barras verticais com `Title` no eixo X, `Rating` no eixo Y.
    
2. **Top 10 Most Rated Movies by the Audience in 2024:**
   - Gráfico de barras verticais com títulos no eixo X e avaliações no eixo Y.

3. **Best Movies with Fernandas Torres:**
   - Linha do tempo com os títulos e ano dos filmes onde Fernanda Torres atuou e suas avaliações.

4. **Best Movies with Fernandas Montenegro:**
   - Linha do tempo com os títulos e ano dos filmes onde Fernanda Montenegro atuou e suas avaliações.

5. **Movies with Both Fernandas:**
   - Linha do tempo com os títulos e ano dos filmes onde mãe e filha contracenaram juntas.

4. **Directors with the Best Movies in Portuguese:**
   - Treemap destacando os diretores mais produtivos.

## **Como Executar o Projeto**

### **1. Requisitos**
- Banco de dados SQL Server ou similar com o dataset carregado.
- Power BI Desktop instalado.

### **2. Configuração do Dataset**
Certifique-se de que o dataset está carregado em uma tabela chamada `DBO.IMDB_MOVIES` no seu banco de dados.

### **3. Consultas SQL**
Execute as consultas listadas para gerar arquivos CSV com os resultados.

### **4. Importar Dados no Power BI**
- Importe os arquivos CSV gerados para o Power BI.
- Crie visualizações conforme descrito na seção de visualizações.

## **Insights Obtidos**

- O filme com que Fernanda Torres ganhou o Globo de Ouro ("I'm Still Here") é o filme do Brasil mais bem avaliado pelo público e foi o segundo filme mais bem avaliado de 2024 no mundo, também de acordo com o público.
- Os dois filmes onde Fernanda Torres participou e que tiveram avaliações no IMDb, em ambos, ela contracenou com sua mãe, a atriz Fernanda Montenegro.
- Walter Salles, que é o diretor de "I'm Still Here", é um dos dois diretores com mais filmes em português avaliados pelo público no IMDb.
