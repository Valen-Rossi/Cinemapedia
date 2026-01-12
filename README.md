# Cinemapedia 

<p align="left">
   <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
   <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
   <img src="https://img.shields.io/badge/TMDB_API-01B4E4?style=for-the-badge&logo=themoviedatabase&logoColor=white" />
</p>

## 📝 Descripción
**Cinemapedia** es una aplicación móvil moderna desarrollada en Flutter que permite a los usuarios explorar el vasto mundo del cine. La aplicación consume datos en tiempo real de **The Movie Database (TMDB)** para ofrecer información actualizada sobre películas en cartelera, populares y mejor calificadas.

### Características Principales:
- 🎬 **Exploración de Películas:** Listados categorizados (En cine, Populares, Próximamente, Mejor calificadas).
- 🔍 **Búsqueda Inteligente:** Buscador de películas integrado con sugerencias.
- 🎭 **Detalles Completos:** Información detallada de cada película, incluyendo sinopsis, géneros y el reparto de actores.
-  Favorites **Favoritos:** Posibilidad de marcar películas como favoritas (persistencia local).
- 🌓 **Diseño Adaptativo:** Interfaz fluida con soporte para Material 3.

## 🏗️ Arquitectura y Stack Técnico

El proyecto sigue los principios de **Clean Architecture**, asegurando un código mantenible, testeable y escalable:

- **Domain:** Entidades de negocio, Casos de Uso y definiciones de Repositorios.
- **Infrastructure:** Implementación de Data Sources (TMDB API), Mappers y Repositorios.
- **Presentation:** Gestión de estado con Riverpod, Widgets reutilizables y pantallas.

### Tecnologías utilizadas:
- **Estado:** [Riverpod](https://riverpod.dev/) para una gestión de estado reactiva y desacoplada.
- **Navegación:** [GoRouter](https://pub.dev/packages/go_router) para el manejo de rutas.
- **HTTP Client:** [Dio](https://pub.dev/packages/dio) para las peticiones a la API de TMDB.
- **Variables de Entorno:** [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv).
- **Imágenes:** [Animate Do](https://pub.dev/packages/animate_do) para animaciones fluidas de entrada.

## ✉️ Contacto
Luca Valentino Rossi - [valerossi2004@gmail.com](mailto:valerossi2004@gmail.com) - [LinkedIn](https://www.linkedin.com/in/valentino-rossi-1b2819338/)
