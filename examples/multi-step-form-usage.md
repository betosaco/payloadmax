# Multi-Step Form Configuration Guide

Este documento proporciona una guía para configurar formularios multi-step en el CMS utilizando la nueva funcionalidad añadida al bloque de formulario.

## Estructura de Configuración

La configuración de multi-step se encuentra dentro del bloque de formulario (`FormBlock`) y consiste en dos partes principales:

1. **Habilitación de la funcionalidad**: Un checkbox para activar/desactivar la funcionalidad multi-step.
2. **Configuración de Pasos**: Un array de pasos donde cada paso define:
   - Un título para el paso
   - Una lista de campos que se mostrarán en ese paso

## Ejemplo de Uso

Cuando estés configurando un bloque de formulario en una página, podrás habilitar la funcionalidad multi-step de la siguiente manera:

### 1. Crea un Formulario

Primero, asegúrate de tener un formulario creado en la colección "forms" con todos los campos necesarios.

### 2. Agrega un Bloque de Formulario a una Página

En el editor de páginas, añade un bloque de tipo "Form Block" y selecciona el formulario que deseas utilizar.

### 3. Configura el Multi-Step

En la sección "Multi-Step Form Configuration":

1. Activa la casilla "Enable Multi-Step Form"
2. Añade los pasos necesarios utilizando el botón "Add Step"
3. Para cada paso:
   - Proporciona un título descriptivo (ej. "Información Personal")
   - Añade los nombres de los campos que deseas mostrar en ese paso

### Ejemplo de Configuración

```json
{
  "blockType": "formBlock",
  "form": "645f3c5b687d2e0b3c9d1234", // ID del formulario a utilizar
  "enableIntro": true,
  "introContent": "...", // Contenido rich text
  
  // Configuración multi-step
  "multiStep": {
    "enabled": true,
    "steps": [
      {
        "title": "Información Personal",
        "fields": [
          { "fieldName": "firstName" },
          { "fieldName": "lastName" },
          { "fieldName": "email" }
        ]
      },
      {
        "title": "Dirección",
        "fields": [
          { "fieldName": "streetAddress" },
          { "fieldName": "city" },
          { "fieldName": "state" },
          { "fieldName": "zipCode" }
        ]
      },
      {
        "title": "Revisar y Enviar",
        "fields": [
          { "fieldName": "acceptTerms" }
        ]
      }
    ]
  }
}
```

## Consideraciones Importantes

1. **Nombres de Campos**: Asegúrate de usar exactamente los mismos nombres de campo que existen en tu formulario.
2. **Orden de los Pasos**: El orden de los pasos en la configuración determinará el orden en que se presentan al usuario.
3. **Validación**: Cada paso se validará individualmente antes de permitir al usuario avanzar al siguiente paso.
4. **Campos Requeridos**: Los campos marcados como requeridos seguirán siendo obligatorios en el paso en que aparecen.
5. **Navegación**: Los usuarios podrán navegar hacia atrás para revisar o modificar información en pasos anteriores.

## Implementación en el Frontend

El componente FormBlock ha sido actualizado para manejar formularios multi-step automáticamente. Cuando la configuración multi-step está habilitada:

1. Se muestra un indicador del paso actual y el total de pasos
2. Se agrega un botón "Atrás" para navegar a pasos anteriores
3. El botón de envío muestra "Siguiente" en todos los pasos excepto el último
4. Solo se muestran los campos definidos para el paso actual

No se requiere configuración adicional en el frontend para utilizar esta funcionalidad. 