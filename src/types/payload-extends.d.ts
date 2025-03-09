import '@payloadcms/plugin-form-builder/types'

// Extender los tipos del plugin de form-builder
declare module '@payloadcms/plugin-form-builder/types' {
  export interface FormFieldBlock {
    blockType:
      | 'text'
      | 'textarea'
      | 'select'
      | 'email'
      | 'state'
      | 'country'
      | 'checkbox'
      | 'number'
      | 'message'
      | 'ceoSelection' // Añadir nuestro tipo personalizado
  }
}
