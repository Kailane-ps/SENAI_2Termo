CREATE TABLE Usuario(
IdUsuario INT PRIMARY KEY IDENTITY NOT NULL,
Email VARCHAR(150) NOT NULL,
Senha VARCHAR(150) NOT NULL,
);

CREATE TABLE Categoria(
IdCategoria INT PRIMARY KEY IDENTITY NOT NULL,
TipoCategoria VARCHAR(20) NOT NULL,
);

CREATE TABLE Turma(
IdTurma INT PRIMARY KEY IDENTITY NOT NULL,
Serie VARCHAR(10) NOT NULL,
);

CREATE TABLE Aluno (
 IdAluno INT PRIMARY KEY IDENTITY NOT NULL,
 Nome VARCHAR(100) NOT NULL,
 RM VARCHAR(20) NOT NULL,
 DataNascimento DATE NOT NULL,
 RG VARCHAR(10) NOT NULL,

 --FK
 IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
 IdTurma INT FOREIGN KEY REFERENCES Turma(IdTurma) NOT NULL
 );

CREATE TABLE Professor(
 IdProfessor INT PRIMARY KEY IDENTITY NOT NULL,
 Nome VARCHAR(100) NOT NULL,
 RM VARCHAR(20) NOT NULL,
 DataNascimento DATE NOT NULL,
 RG VARCHAR(10) NOT NULL,
 UF CHAR(2) NOT NULL ,
 Logradouro VARCHAR(100) NOT NULL,
 Cidade VARCHAR(50) NOT NULL,
 Complemento VARCHAR(50) NOT NULL,
 Bairro VARCHAR(50) NOT NULL,
 Numero VARCHAR(10) NOT NULL,

--FK
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL
);

CREATE TABLE Dicas(
IdDicas INT PRIMARY KEY IDENTITY NOT NULL,
TextoDica VARCHAR(255) NOT NULL,

--FK
IdProfessor INT FOREIGN KEY REFERENCES Professor(IdProfessor) NOT NULL
);

CREATE TABLE Post(
IdPost INT PRIMARY KEY IDENTITY NOT NULL,
Texto VARCHAR(255) NOT NULL,
Imagem VARCHAR(150) NOT NULL,
Curtidas INT DEFAULT(0) NOT NULL,

--FK
 Turma INT FOREIGN KEY REFERENCES Turma(IdTurma) NOT NULL,
 Aluno INT FOREIGN KEY REFERENCES Aluno(IdAluno) NOT NULL,
);


CREATE TABLE Disciplina(
IdDisciplina INT PRIMARY KEY IDENTITY NOT NULL,
Nome VARCHAR(30) NOT NULL,
ConteudoProg VARCHAR(255) NOT NULL,
CargaHoraria INT DEFAULT(0) NOT NULL,
);

CREATE TABLE Objetivo(
IdObjetivo INT PRIMARY KEY IDENTITY NOT NULL,
Descricao VARCHAR(255),

--FK
Professor INT FOREIGN KEY REFERENCES Professor(IdProfessor) NOT NULL,
Categoria INT FOREIGN KEY REFERENCES Categoria(IdCategoria) NOT NULL,
Disciplina INT FOREIGN KEY REFERENCES Disciplina(IdDisciplina) NOT NULL,
);

CREATE TABLE Aluno_Obj(
IdAluno_Obj INT PRIMARY KEY IDENTITY NOT NULL,
Nota INT NOT NULL,
DataEntrega datetime NOT NULL,

--FK
Objetivo INT FOREIGN KEY REFERENCES Objetivo(IdObjetivo) NOT NULL,
Aluno INT FOREIGN KEY REFERENCES Aluno(IdAluno) NOT NULL,
);
 
CREATE TABLE Professor_Turma(
IdProfessor_Turma INT PRIMARY KEY IDENTITY NOT NULL,

--FK
Professor INT FOREIGN KEY REFERENCES Professor(IdProfessor) NOT NULL,
Turma INT FOREIGN KEY REFERENCES Turma(IdTurma) NOT NULL,
);


