# Base oficial de Fedora Bootc Rawhide
FROM quay.io/fedora/fedora-bootc:44

# 1. Instalamos KDE mínimo y distrobox (sin sddm, que ya viene resuelto en el grupo)
RUN dnf group install -y kde-desktop --setopt=install_weak_deps=False && \
    dnf install -y distrobox --setopt=install_weak_deps=False

# 2. ELIMINAMOS a MariaDB server y herramientas extras que no queremos que ensucien el sistema
RUN dnf remove -y mariadb-server mariadb3x-libs

# 3. Limpieza total de cache para ahorrar espacio
RUN dnf clean all
