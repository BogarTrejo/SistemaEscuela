SELECT M.No_Consecutivo, M.No_Puntos,M.Numero_Contrato,M.Fecha_Matricula,
	M.No_RP,T.Nombre AS Titular,AL.Nombre AS Beneficiario,T.RFC,ORG.Nombre AS Organizacion,
	A.Nombre AS Asesor, SV.Nombre AS Supervisor, SG.Nombre AS Subgerente,ORG.Gerente, M.Tiempo_Servicio,M.Tipo_Programa,
	M.Cuota,M.Importe_Mensual,M.Estrategia,M.Estatus,M.Observaciones,M.Fecha_Validacion AS Fecha_Verificacion, DT.Calle,DT.Colonia,T.Compania,T.Telefono_Oficina,T.Profesion
FROM matricula M
INNER JOIN titular T
ON M.Titular_idTitular = T.idTitular
INNER JOIN alumno AL
ON M.idMatricula = AL.Matricula_idMatricula
INNER JOIN asesor A
ON M.Asesor_idAsesor = A.idAsesor
INNER JOIN subgerente SG
ON M.Subgerente_idSubgerente = SG.idSubgerente
INNER JOIN supervisor SV
ON M.Supervisor_idSupervisor = SV.idSupervisor
INNER JOIN organizacion ORG
ON M.Organizacion_idOrganizacion = ORG.idOrganizacion
INNER JOIN dom_titular DT
ON T.Dom_Titular_idDom_Titular1 = DT.idDom_Titular
WHERE M.Fecha_Matricula between '2013-07-03' AND '2013-09-03'
AND M.Tipo_Programa = 'Mes'
#WHERE ORG.idOrganizacion=1
#WHERE A.idAsesor = 1
#WHERE SV.idSupervisor = 1
#WHERE SG.idSubgerente = 1
#WHERE M.Estrategia like 'Internet'
#WHERE M.Estatus like 'Pendiente'
#WHERE 

#SELECT * FROM pagos P
#WHERE P.Tipo_Pago = "Inscripción" AND P.Titular_idTitular = 1226858260;