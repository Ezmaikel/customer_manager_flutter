# Customer Manager – Flutter & SQLite

Aplicación móvil desarrollada en **Flutter** para la gestión de clientes, utilizando **SQLite** como base de datos local y una arquitectura escalable basada en **Repository Pattern + ViewModel (Provider)**.

El objetivo del proyecto es demostrar buenas prácticas en:
- Arquitectura limpia
- Manejo de estado
- Persistencia local
- Reutilización de widgets

---

##  Funcionalidades

- Listado de clientes almacenados localmente
- Creación de nuevos clientes
- Edición de clientes existentes
- Eliminación de clientes
- Persistencia de datos con SQLite
- Actualización reactiva de la interfaz

---

##  Arquitectura y diseño

El proyecto está organizado por capas, separando claramente responsabilidades:

lib/
│── data/
│ ├── local/ # Configuración SQLite (AppDatabase)
│ ├── model/ # Entidades (Cliente)
│ └── repository/ # Acceso a datos
│
│── ui/
│ ├── screens/ # Pantallas principales
│ └── widgets/ # Widgets reutilizables
│
│── viewmodel/ # Lógica de presentación (Provider)
│
└── main.dart

---


### Patrones utilizados
- Repository Pattern
- MVVM (ViewModel + Provider)
- Stateless / Stateful Widgets bien definidos

---

##  Tecnologías

- **Flutter**
- **Dart**
- **SQLite (sqflite)**
- **Provider**
- **Material Design**

---

##  Dependencias principales

```yaml
provider: ^6.0.5
sqflite: ^2.4.2
path: ^1.9.1
