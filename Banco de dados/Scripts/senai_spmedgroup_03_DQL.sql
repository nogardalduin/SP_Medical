USE MedicalGroup;
go

SELECT * FROM Endereco;
SELECT * FROM Clinica;
SELECT * FROM TipoUsuario;
SELECT * FROM Especialidade ORDER BY IdEspecialidade asc;
SELECT * FROM Usuario ORDER BY IdUsuario asc;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Situacao;
SELECT * FROM Consulta;
SELECT COUNT(IdUsuario) [Quantidade de usuários] FROM Usuario;


SELECT FORMAT(DataNascimento , 'dd/MM/yyyy')  [Data de nascimento] FROM Paciente;
go

SELECT NomePaciente [Prontuário], NomeMedico [Médico], FORMAT(DataConsulta, 'dd/MM/yyyy hh.mm') [Data da Consulta], Situacao, NomeFantasia [Clinica], Endereco.Rua, Endereco.Numero, Endereco.Cidade
FROM Consulta
INNER JOIN Medico
ON Medico.IdMedico = Consulta.IdMedico
InNER JOIn Clinica
ON Clinica.IdClinica = Medico.IdClinica
INNER JOIN Endereco
On Endereco.IdEndereco = Clinica.IdEndereco
INNER JOIN Paciente
ON Paciente.IdPaciente = Consulta.IdPaciente
INNER JOIN Endereco E
ON E.IdEndereco = Paciente.IdEndereco
INNER JOIN Situacao
ON Situacao.IdSituacao = Consulta.IdSituacao
ORDER BY Consulta.IdConsulta asc;
go



CREATE FUNCTION MedicosEspecialidade()
RETURNS TABLE
AS
RETURN
    SELECT
    NomeMedico
    MedicosEspecialidade

    FROM
    [dbo].[Medico]

    WHERE IdEspecialidade = 17;
go


ALTER FUNCTION MedicosEspecialidade(@ID INT)
RETURNS TABLE
AS
RETURN
    SELECT
    NomeMedico
    MedicosEspecialidade

    FROM
    [dbo].[Medico]

    WHERE IdEspecialidade = @ID;
go


SELECT * FROM MedicosEspecialidade(16);
go


CREATE PROCEDURE Idade
AS 
SELECT NomePaciente [Paciente], DataNascimento [Data de nascimento], DATEDIFF(year, (Datanascimento), getdate()) [Idade do Paciente], Telefone, RG, CPF FROM Paciente;
go

EXEC Idade;
go

