# Cuarteo V 1.6

Software para la caracterización de residuos sólidos: guía el proceso por etapas (planificación, fuentes, muestreo y cuarteo, clasificación, laboratorio, resultados e informe) y genera el informe en PDF, Excel, CSV y JSON.

Esta versión se publica con GitHub Pages y guarda los datos en Supabase.

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `index.html` | La aplicación completa. |
| `config.js` | Datos de conexión a tu proyecto de Supabase. Se edita una sola vez. |
| `supabase-cuarteo.sql` | Crea las tablas, la seguridad y el espacio para fotos en Supabase. |

## Puesta en marcha (una sola vez)

1. **Base de datos.** En Supabase abre *SQL Editor*, crea una consulta nueva, pega el contenido de `supabase-cuarteo.sql` y pulsa *Run*.
2. **Datos de conexión.** En Supabase abre *Project Settings > API* y copia la *Project URL* y la clave *anon public* (o *publishable*). Edita `config.js` en GitHub y pégalos. Nunca uses la clave *service_role* ni la *secret*.
3. **Publicación.** En el repositorio de GitHub abre *Settings > Pages*, elige la rama `main` y la carpeta `/ (root)` y guarda. La app quedará en `https://TU-USUARIO.github.io/NOMBRE-DEL-REPOSITORIO/`.
4. **Inicio de sesión.** En Supabase abre *Authentication > URL Configuration* y pon esa dirección en *Site URL* y en *Redirect URLs*. Así funcionan los correos de confirmación y de cambio de contraseña.
5. **Primera cuenta.** Abre la app, pulsa *Crear cuenta*, confirma el correo y entra.

## Pasar los datos desde la versión de Claude

1. En la versión de Claude: *Ajustes > Descargar respaldo > Con fotos*.
2. En esta versión, con sesión iniciada: *Ajustes > Restaurar o importar* y elige el archivo.

## Actualizar a una versión nueva

Reemplaza solo `index.html`. No toques `config.js`: ahí está tu conexión.

## Seguridad

- La clave *anon public* puede estar en un repositorio público: las reglas de seguridad de la base de datos (RLS) hacen que cada usuario solo vea sus propios estudios y fotos.
- El repositorio contiene el código, no los datos. Los estudios y las fotos están en Supabase.
