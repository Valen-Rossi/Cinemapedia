# Cinemapedia

<p align="left">
   <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
   <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
   <img src="https://img.shields.io/badge/TMDB_API-01B4E4?style=for-the-badge&logo=themoviedatabase&logoColor=white" />
</p>

## 📝 Descripción / Description
**Cinemapedia** es una aplicación móvil moderna desarrollada en Flutter que permite a los usuarios explorar el vasto mundo del cine. La aplicación consume datos en tiempo real de **The Movie Database (TMDB)** para ofrecer información actualizada sobre películas en cartelera, populares y mejor calificadas.

**Cinemapedia** is a modern mobile application developed with Flutter that allows users to explore the vast world of cinema. The app consumes real-time data from **The Movie Database (TMDB)** to provide up-to-date information on now playing, popular, and top-rated movies.

### Características Principales / Key Features:
- 🎬 **Exploración de Películas / Movie Exploration:** Listados categorizados (En cine, Populares, Próximamente, Mejor calificadas). / Categorized listings (Now playing, Popular, Upcoming, Top rated).
- 🔍 **Búsqueda Inteligente / Smart Search:** Buscador de películas integrado con sugerencias. / Integrated movie search with suggestions.
- 🎭 **Detalles Completos / Full Details:** Información detallada de cada película, incluyendo sinopsis, géneros y el reparto de actores. / Detailed information for each movie, including synopsis, genres, and cast.
- ⭐ **Favoritos / Favorites:** Posibilidad de marcar películas como favoritas (persistencia local). / Ability to mark movies as favorites (local persistence).
- 🌓 **Diseño Adaptativo / Adaptive Design:** Interfaz fluida con soporte para Material 3. / Fluid interface with Material 3 support.

## 🏗️ Arquitectura y Stack Técnico / Architecture and Technical Stack

**ES:** El proyecto sigue los principios de **Clean Architecture**, asegurando un código mantenible, testeable y escalable:
**EN:** The project follows **Clean Architecture** principles, ensuring maintainable, testable, and scalable code:

- **Domain:** Entidades de negocio, Casos de Uso y definiciones de Repositorios. / Business entities, Use Cases, and Repository definitions.
- **Infrastructure:** Implementación de Data Sources (TMDB API), Mappers y Repositorios. / Implementation of Data Sources (TMDB API), Mappers, and Repositories.
- **Presentation:** Gestión de estado con Riverpod, Widgets reutilizables y pantallas. / State management with Riverpod, reusable widgets, and screens.

### Tecnologías utilizadas / Technologies used:
- **Estado / State:** [Riverpod](https://riverpod.dev/) para una gestión de estado reactiva y desacoplada. / For reactive and decoupled state management.
- **Navegación / Navigation:** [GoRouter](https://pub.dev/packages/go_router) para el manejo de rutas. / For route management.
- **HTTP Client:** [Dio](https://pub.dev/packages/dio) para las peticiones a la API de TMDB. / For TMDB API requests.
- **Variables de Entorno / Environment Variables:** [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv).
- **Animaciones / Animations:** [Animate Do](https://pub.dev/packages/animate_do) para animaciones fluidas de entrada. / For fluid entrance animations.

## ✉️ Contacto / Contact
Luca Valentino Rossi - [valerossi2004@gmail.com](mailto:valerossi2004@gmail.com) - [LinkedIn](https://www.linkedin.com/in/lucavalentinorossi/)
