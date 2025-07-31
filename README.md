# Curso de fundamentos de Azure

Este repositorio contiene scripts y comandos de Azure CLI para aprender los fundamentos de Microsoft Azure. Cada carpeta representa un área específica de Azure con ejemplos prácticos de implementación.

## 📁 Estructura del Proyecto

### 🔧 **azureCLI/**
Comandos básicos de Azure CLI para crear recursos fundamentales.
- **Contenido**: Scripts para crear grupos de recursos y cuentas de almacenamiento básicas
- **Aprendizaje**: Introducción a la interfaz de línea de comandos de Azure

### ☁️ **azureIaaS/** (Infrastructure as a Service)
Implementación de infraestructura como servicio en Azure.
- **Contenido**: 
  - Creación de máquinas virtuales
  - Configuración de redes virtuales
  - Cuentas de almacenamiento
  - Gestión de recursos IaaS
- **Aprendizaje**: Conceptos fundamentales de infraestructura en la nube

### 🚀 **azurePaaS/** (Platform as a Service)
Desarrollo y despliegue de aplicaciones usando servicios de plataforma.
- **Contenido**:
  - Cosmos DB (base de datos NoSQL)
  - SQL Server
  - Web Apps con App Service
  - Planes de servicio
- **Aprendizaje**: Desarrollo de aplicaciones sin gestión de infraestructura

### 💻 **computo/**
Servicios de computación en Azure.
- **Contenido**:
  - Máquinas virtuales
  - Container Apps
  - Function Apps
  - Storage para funciones
- **Aprendizaje**: Diferentes opciones de computación en la nube

### 💾 **almacenamiento/**
Servicios de almacenamiento de Azure.
- **Contenido**:
  - Cuentas de almacenamiento
  - Contenedores de blob
  - Subida de archivos
  - Gestión de claves de acceso
- **Aprendizaje**: Almacenamiento de datos en la nube

### 🌐 **redes/**
Servicios de red y conectividad en Azure.
- **Contenido**:
  - Zonas DNS
  - Registros DNS (A, NS)
  - Gestión de dominios
- **Aprendizaje**: Configuración de redes y DNS en Azure

### 🔐 **rbac/** (Role-Based Access Control)
Control de acceso basado en roles.
- **Contenido**:
  - Creación de service principals
  - Asignación de roles (Contributor, Reader)
  - Gestión de permisos por grupo de recursos
  - Autenticación con service principals
- **Aprendizaje**: Seguridad y control de acceso en Azure

### 📈 **escalabilidad/**
Servicios escalables en Azure.
- **Contenido**:
  - App Service Plans
  - Web Apps
  - Configuración de escalabilidad
- **Aprendizaje**: Diseño de aplicaciones escalables

### 🛡️ **zeroTrust/**
Implementación de seguridad Zero Trust.
- **Contenido**:
  - Cuentas de almacenamiento seguras
  - Configuración de HTTPS obligatorio
  - Deshabilitación de acceso público
  - Configuración de TLS
- **Aprendizaje**: Principios de seguridad Zero Trust

### 🖥️ **vms/**
Máquinas virtuales avanzadas con escalabilidad.
- **Contenido**:
  - Virtual Machine Scale Sets
  - Application Gateway
  - Auto-scaling rules
  - Configuración de redes complejas
  - Instalación automática de software
- **Aprendizaje**: Gestión de cargas de trabajo escalables

### 🌍 **vmPublica/**
Máquinas virtuales públicas con servicios web.
- **Contenido**:
  - VMs con IP pública
  - Network Security Groups (NSG)
  - Instalación de IIS
  - Configuración de puertos
- **Aprendizaje**: Despliegue de servicios web en la nube

### ⚡ **funciones/**
Azure Functions para computación serverless.
- **Contenido**:
  - Function Apps con múltiples runtimes (.NET, Python, Node.js)
  - Consumption Plan (serverless)
  - Configuración de variables de entorno
  - Storage accounts para Functions
- **Aprendizaje**: Desarrollo de aplicaciones serverless sin servidor

### 🐍 **appService/**
Azure App Service para aplicaciones web con Python, FastAPI, Docker y GitHub Actions CI/CD.
- **Contenido**:
  - Aplicación FastAPI completa con CRUD
  - Containerización con Docker multi-stage
  - GitHub Actions CI/CD pipeline
  - Deployment automático a staging y producción
  - Pruebas automatizadas (unitarias y en contenedor)
  - Autoscaling y monitoreo
  - Documentación automática (Swagger/ReDoc)
  - Escaneo de seguridad con Trivy
- **Aprendizaje**: DevOps completo con Docker, CI/CD y Azure

## 🚀 Cómo usar este repositorio

1. **Prerrequisitos**:
   - Tener Azure CLI instalado
   - Tener una suscripción de Azure activa
   - Estar autenticado en Azure CLI (`az login`)

2. **Ejecutar scripts**:
   ```bash
   cd [nombre-carpeta]
   chmod +x comandos.sh
   ./comandos.sh
   ```

3. **Limpieza de recursos**:
   - Algunos scripts incluyen comandos de limpieza
   - Usar `az group delete` para eliminar grupos de recursos

## 📚 Conceptos clave de Azure

### Modelos de Servicio
- **IaaS**: Infraestructura como servicio (máquinas virtuales, redes)
- **PaaS**: Plataforma como servicio (bases de datos, aplicaciones)
- **SaaS**: Software como servicio (aplicaciones completas)

### Servicios Principales
- **Compute**: VMs, Container Apps, Functions, App Service
- **Storage**: Blob Storage, File Storage, Disk Storage
- **Networking**: VNets, Load Balancers, Application Gateway
- **Databases**: SQL Database, Cosmos DB, Redis Cache
- **Security**: RBAC, NSGs, Azure AD
- **Serverless**: Azure Functions, App Service (Consumption Plan)

### Mejores Prácticas
- Usar grupos de recursos para organizar recursos
- Implementar el principio de menor privilegio
- Configurar monitoreo y alertas
- Diseñar para escalabilidad desde el inicio
- Implementar seguridad Zero Trust

## 🔗 Recursos Adicionales

- [Documentación oficial de Azure](https://docs.microsoft.com/azure/)
- [Azure CLI Documentation](https://docs.microsoft.com/cli/azure/)
- [Azure Architecture Center](https://docs.microsoft.com/azure/architecture/)
- [Azure Security Center](https://docs.microsoft.com/azure/security-center/)

## 📝 Notas

- Los scripts están diseñados para fines educativos
- Siempre revisar los costos antes de ejecutar en producción
- Los nombres de recursos incluyen identificadores únicos para evitar conflictos
- Algunos scripts requieren permisos específicos en la suscripción

---

**Autor**: Curso de fundamentos de Azure  
**Última actualización**: 2024

