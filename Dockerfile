# Usa la imagen base de Odoo 17
FROM odoo:17.0

# Instala dependencias adicionales si las necesitas
USER root
RUN apt-get update && apt-get install -y \
    nano \
    wkhtmltopdf \
    && rm -rf /var/lib/apt/lists/*

# Configura permisos
RUN chown -R odoo:odoo /var/lib/odoo /mnt/extra-addons

# Cambia al usuario de Odoo
USER odoo

# Copia addons personalizados si tienes (opcional)
# COPY ./custom-addons /mnt/extra-addons

# Define la variable para addons personalizados (opcional)
ENV ADDONS_PATH="/mnt/extra-addons,/usr/lib/python3/dist-packages/odoo/addons"

# Expon el puerto de Odoo
EXPOSE 8069

# Ejecuta Odoo
CMD ["odoo"]
