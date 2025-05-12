use clinica_medica;
select pacientes.nome,SUM(medicamentos.preco) as "gastos com medicamentos"
from pacientes JOIN historicomedico
ON pacientes.id= historicomedico.paciente_id JOIN prescricoes
ON historicomedico.id = prescricoes.historico_medico_id JOIN medicamentos
ON medicamentos.id = prescricoes.medicamento_id
GROUP BY pacientes.nome;


-- MOSTRAR O TOTAL DE PRESCRIÇÕES  POR PACIENTE
select pacientes.nome,COUNT(prescricoes.id)
from pacientes JOIN historicomedico
ON pacientes.id= historicomedico.paciente_id JOIN prescricoes
ON historicomedico.id = prescricoes.historico_medico_id JOIN medicamentos
GROUP BY  pacientes.nome;

-- MOSTRAR OS MEDICAMENTOS DE CADA PRESCRIÇÃO"

   
