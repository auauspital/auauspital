CREATE TABLE Endereco (
    id_endereco SERIAL PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    complemento VARCHAR(255) NULL
);

CREATE TABLE Pessoa (
    id_pessoa SERIAL PRIMARY KEY,
    id_endereco INT NULL REFERENCES Endereco (id_endereco),
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    tipo INT NOT NULL,
    matricula VARCHAR(20) NULL,
    senha VARCHAR(16) NULL
);

CREATE TABLE Animal (
    id_animal SERIAL PRIMARY KEY,
    id_proprietario INT NOT NULL REFERENCES Pessoa (id_pessoa),
    tipo VARCHAR(255) NOT NULL,
    cor VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL
);

CREATE TABLE Prontuario (
    id_prontuario SERIAL PRIMARY KEY,
    id_animal INT NOT NULL REFERENCES Animal (id_animal),
    id_professor INT NULL REFERENCES Pessoa (id_pessoa), /* pode ser null porque a tabela fica sem id enquanto o professor nao autorizar */
    id_aluno INT NOT NULL REFERENCES Pessoa (id_pessoa),
    dataRetorno DATE NULL, /* pode ser null porque pode ser que nao seja necessaria a volta do animal */
    dataAtendimento DATE NOT NULL
);

CREATE TABLE Motivo (
    id_motivo SERIAL PRIMARY KEY,
    id_prontuario INT NOT NULL REFERENCES Prontuario (id_prontuario),
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Prescricao (
    id_prescricao SERIAL PRIMARY KEY,
    id_prontuario INT NOT NULL REFERENCES Prontuario (id_prontuario),
    descricao VARCHAR(255) NOT NULL
);