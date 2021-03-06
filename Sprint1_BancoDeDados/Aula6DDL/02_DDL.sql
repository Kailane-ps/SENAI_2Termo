CREATE DATABASE Atividade2;
GO

USE Atividade2;
GO

-- Primeiro criando as tabelas que s� tem as PK's
CREATE TABLE Permissao (

	IdPermissao INT PRIMARY KEY IDENTITY NOT NULL,
	TipoPermissao VARCHAR (15) NOT NULL,

);

CREATE TABLE Estilo (

	IdEstilo INT PRIMARY KEY IDENTITY NOT NULL,
	Estilo VARCHAR (20) NOT NULL,

);

-- Tabelas com FK's agora
CREATE TABLE Usuario (

	IdUsuario INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR (50) NOT NULL,
	Email VARCHAR (60) NOT NULL,
	Senha VARCHAR (30) NOT NULL,
	IdPermissao INT FOREIGN KEY REFERENCES Permissao(IdPermissao), --FK

);

CREATE TABLE Artista (

	IdArtista INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR (30) NOT NULL,
	IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo),

);

CREATE TABLE Album (

	IdAlbum INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR (40),
	QtdMinutos INT,
	DataLancamento DATETIME,
	IdArtista INT FOREIGN KEY REFERENCES Artista(IdArtista),

);

CREATE TABLE EstiloAlbum (

	IdEstiloAlbum INT PRIMARY KEY IDENTITY NOT NULL,
	IdEstilo INT FOREIGN KEY REFERENCES Estilo(IdEstilo),
	IdAlbum	INT FOREIGN KEY REFERENCES Album(IdAlbum),

);