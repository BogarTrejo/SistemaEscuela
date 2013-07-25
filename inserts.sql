-- Alta de idiomas

INSERT INTO `multilingual`.`idiomas` (`Nombre`, `Nivel`) VALUES ('Ingles', 'Básico');
INSERT INTO `multilingual`.`idiomas` (`Nombre`, `Nivel`) VALUES ('Ingles', 'Intermedio');
INSERT INTO `multilingual`.`idiomas` (`Nombre`, `Nivel`) VALUES ('Ingles', 'Avanzado');
INSERT INTO `multilingual`.`idiomas` (`Nombre`, `Nivel`) VALUES ('Frances', 'Básico');
INSERT INTO `multilingual`.`idiomas` (`Nombre`, `Nivel`) VALUES ('Frances', 'Intermedio');
INSERT INTO `multilingual`.`idiomas` (`Nombre`, `Nivel`) VALUES ('Frances', 'Avanzado');


-- Alta de organización, asesores,subgerentes, supervisor
INSERT INTO `multilingual`.`organizacion` (`idOrganizacion`, `Nombre`, `Gerente`) VALUES ('1', 'Pegaso', 'Balu Ojeda');
INSERT INTO `multilingual`.`asesor` (`idAsesor`, `Nombre`, `Organizacion_idOrganizacion`) VALUES ('1', 'Bogar Mil', '1');
INSERT INTO `multilingual`.`subgerente` (`idSubgerente`, `Nombre`, `Organizacion_idOrganizacion`) VALUES ('1', 'Isaac Ojeda', '1');
INSERT INTO `multilingual`.`supervisor` (`idSupervisor`, `Nombre`, `Organizacion_idOrganizacion`) VALUES ('1', 'Max Payne', '1');
