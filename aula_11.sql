USE clinica_medica;
-- EXIBIR TODOS OS PACIENTES CADASTRADOS NO BD
SELECT  count(id) as "Total de Pacientes" from pacientes;

DESC medicos;
-- CADASTRANDO UM NOVO MÉDICO
INSERT INTO medicos (nome, especialidade, crm, email)
VALUES ("Crispiano Orispildo","pediatria","CRM 55667",
       "crispildo@gmail.com");

-- EXIBIR A QUANTIDADE DE MÉDICOS PEDIATRAS
SELECT especialidade,count(id) from medicos 
where especialidade = "pediatria";
-- EXIBIR A QUANTIDADE DE MÉDICOS POR ESPECIALIDADE
SELECT especialidade,count(id) as "Quantidade" from medicos 
group by especialidade;

desc agendamentos;

-- Idade dos pacientes
SELECT nome, YEAR(CURDAT()) - YEAR(data_nascimento) as "idade"
from  pacientes;

-- EXIBIR A IDADE MÉDIA DOS PACIENTES
SELECT AVG(YEAR(CURDATE()) - YEAR(data_nascimento)) "idade média"
from pacientes;

-- QUANTIDADE DE CONSULTAS POR MÉDICO
SELECT medicos.nome, count(agendamentos.id) from
medicos left join agendamentos on medicos.id = agendamentos.medico_id
group by medicos.nome;

-- CADASTRANDO NOVA CONSULTA (AGENDAMENTO) PARA UM MÉDICO
INSERT INTO agendamentos(paciente_id,medico_id, data_hora, 
	tipo_consulta, status)
VALUES (1,1,"2025-05-05 10:00", "consulta de rotina","realizada");

-- EXIBIR MÉDICOS COM MAIS CONSULTAS
SELECT medicos.nome, COUNT(agendamento.id) from
medicos join agendametos on medicos.id = agendamentos.medico_id
and  tot_consultas = max(tot_consultas)
group by medicos.nome;


