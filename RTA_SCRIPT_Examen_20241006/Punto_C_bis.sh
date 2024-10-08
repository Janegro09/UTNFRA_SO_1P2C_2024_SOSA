#!/bin/bash

RUTA=$1

# Ajustar permisos para las carpetas y su contenido
# Permisos: rwx para el dueño, r-x para el grupo, --- para otros
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 "$RUTA/alumno_1"
sudo chmod -R 750 "$RUTA/alumno_1"

# Permisos: rwx para el dueño, --- para grupo y otros
sudo chown -R p1c2_2024_A2:p1c2_2024_A2 "$RUTA/alumno_2"
sudo chmod -R 700 "$RUTA/alumno_2"

# Permisos: rwx para el dueño y grupo, r-x para otros
sudo chown -R p1c2_2024_A3:p1c2_2024_A3 "$RUTA/alumno_3"
sudo chmod -R 775 "$RUTA/alumno_3"

# Permisos: rwx para el dueño y grupo, r-x para otros
sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores "$RUTA/profesores"
sudo chmod -R 775 "$RUTA/profesores"

sudo -u p1c2_2024_A1 bash -c "echo 'p1c2_2024_A1' > '$RUTA/alumno_1/validar.txt'"
sudo -u p1c2_2024_A2 bash -c "echo 'p1c2_2024_A2' > '$RUTA/alumno_2/validar.txt'"
sudo -u p1c2_2024_A3 bash -c "echo 'p1c2_2024_A3' > '$RUTA/alumno_3/validar.txt'"
sudo -u p1c2_2024_P1 bash -c "echo 'p1c2_2024_P1' > '$RUTA/profesores/validar.txt'"

