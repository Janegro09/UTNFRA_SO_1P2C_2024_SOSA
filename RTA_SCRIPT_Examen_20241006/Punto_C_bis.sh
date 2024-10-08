#!/bin/bash

RUTA=$1

# Ajustar permisos para las carpetas y su contenido
# Permisos: rwx para el dueño, r-x para el grupo, --- para otros
chown -R p1c2_2024_A1:p1c2_2024_A1 $RUTA/alumno_1
chmod -R 750 /Examenes-UTN/alumno_1

# Permisos: rwx para el dueño, --- para grupo y otros
chown -R p1c2_2024_A2:p1c2_2024_A2 $RUTA/alumno_2
chmod -R 700 /Examenes-UTN/alumno_2

# Permisos: rwx para el dueño y grupo, r-x para otros
chown -R p1c2_2024_A3:p1c2_2024_A3 $RUTA/alumno_3
chmod -R 775 /Examenes-UTN/alumno_3

# Permisos: rwx para el dueño y grupo, r-x para otros
chown -R p1c2_2024_P1:p1c2_2024_gProfesores $RUTA/profesores
chmod -R 775 /Examenes-UTN/profesores
