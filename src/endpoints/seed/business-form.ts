import { RequiredDataFromCollectionSlug } from 'payload'

export const businessForm: RequiredDataFromCollectionSlug<'forms'> = {
  confirmationMessage: {
    root: {
      type: 'root',
      children: [
        {
          type: 'heading',
          children: [
            {
              type: 'text',
              detail: 0,
              format: 0,
              mode: 'normal',
              style: '',
              text: 'Su solicitud de registro de empresa ha sido enviada exitosamente.',
              version: 1,
            },
          ],
          direction: 'ltr',
          format: '',
          indent: 0,
          tag: 'h2',
          version: 1,
        },
      ],
      direction: 'ltr',
      format: '',
      indent: 0,
      version: 1,
    },
  },
  confirmationType: 'message',
  createdAt: '2023-01-12T21:47:41.374Z',
  emails: [
    {
      emailFrom: '"Nuolat" <info@nuolat.com>',
      emailTo: '{{email}}',
      message: {
        root: {
          type: 'root',
          children: [
            {
              type: 'paragraph',
              children: [
                {
                  type: 'text',
                  detail: 0,
                  format: 0,
                  mode: 'normal',
                  style: '',
                  text: 'Hemos recibido su solicitud de registro de empresa. Un representante se pondrá en contacto con usted pronto.',
                  version: 1,
                },
              ],
              direction: 'ltr',
              format: '',
              indent: 0,
              textFormat: 0,
              version: 1,
            },
          ],
          direction: 'ltr',
          format: '',
          indent: 0,
          version: 1,
        },
      },
      subject: 'Solicitud de Registro de Empresa Recibida',
    },
  ],
  fields: [
    // Paso 1: Selección de Residencia
    {
      name: 'residenceType',
      blockName: 'residenceType',
      blockType: 'select',
      label: 'Residencia',
      required: true,
      options: [
        {
          label: 'Perú',
          value: 'peru',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },

    // Paso 2: Información del Solicitante
    {
      name: 'firstName',
      blockName: 'firstName',
      blockType: 'text',
      label: 'Nombre',
      required: true,
      width: 50,
    },
    {
      name: 'lastName',
      blockName: 'lastName',
      blockType: 'text',
      label: 'Apellidos',
      required: true,
      width: 50,
    },
    {
      name: 'documentType',
      blockName: 'documentType',
      blockType: 'select',
      label: 'Tipo de Documento',
      required: true,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'documentNumber',
      blockName: 'documentNumber',
      blockType: 'text',
      label: 'Número de Documento',
      required: true,
      width: 50,
    },
    {
      name: 'email',
      blockName: 'email',
      blockType: 'email',
      label: 'Correo Electrónico',
      required: true,
      width: 100,
    },
    {
      name: 'countryCode',
      blockName: 'countryCode',
      blockType: 'select',
      label: 'Código de País',
      required: true,
      options: [
        {
          label: 'Perú (+51)',
          value: '+51',
        },
        {
          label: 'España (+34)',
          value: '+34',
        },
        {
          label: 'Estados Unidos (+1)',
          value: '+1',
        },
      ],
      width: 30,
    },
    {
      name: 'phone',
      blockName: 'phone',
      blockType: 'text',
      label: 'Teléfono',
      required: true,
      width: 70,
    },

    // Paso 3: Selección de Tipo de Empresa
    {
      name: 'companyType',
      blockName: 'companyType',
      blockType: 'select',
      label: 'Tipo de Empresa',
      required: true,
      options: [
        {
          label: 'SAC - Sociedad Anónima Cerrada',
          value: 'sac',
        },
        {
          label: 'SA - Sociedad Anónima',
          value: 'sa',
        },
      ],
      width: 100,
    },

    // Paso 4: Propósito Corporativo
    {
      name: 'corporatePurpose',
      blockName: 'corporatePurpose',
      blockType: 'textarea',
      label: 'Propósito Corporativo',
      required: true,
      width: 100,
    },
    {
      name: 'suggestedName1',
      blockName: 'suggestedName1',
      blockType: 'text',
      label: 'Sugerencia de Nombre 1',
      required: true,
      width: 100,
    },
    {
      name: 'suggestedName2',
      blockName: 'suggestedName2',
      blockType: 'text',
      label: 'Sugerencia de Nombre 2',
      required: false,
      width: 100,
    },
    {
      name: 'suggestedName3',
      blockName: 'suggestedName3',
      blockType: 'text',
      label: 'Sugerencia de Nombre 3',
      required: false,
      width: 100,
    },

    // Paso 5: Información de Socios - Primera parte: Selección de número de socios
    {
      name: 'numberOfPartners',
      blockName: 'numberOfPartners',
      blockType: 'select',
      label: 'Número de Socios',
      required: true,
      options: [
        {
          label: '2 socios',
          value: '2',
        },
        {
          label: '3 socios',
          value: '3',
        },
        {
          label: '4 socios',
          value: '4',
        },
        {
          label: '5 socios',
          value: '5',
        },
      ],
      width: 100,
    },

    // Socio 1 (siempre presente)
    {
      name: 'partner1FirstName',
      blockName: 'partner1FirstName',
      blockType: 'text',
      label: 'Socio 1: Nombre',
      required: true,
      width: 50,
    },
    {
      name: 'partner1LastName',
      blockName: 'partner1LastName',
      blockType: 'text',
      label: 'Socio 1: Apellidos',
      required: true,
      width: 50,
    },
    {
      name: 'partner1Nationality',
      blockName: 'partner1Nationality',
      blockType: 'select',
      label: 'Socio 1: Nacionalidad',
      required: true,
      options: [
        {
          label: 'Peruano',
          value: 'peruano',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },
    {
      name: 'partner1DocumentType',
      blockName: 'partner1DocumentType',
      blockType: 'select',
      label: 'Socio 1: Tipo de Documento',
      required: true,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'partner1DocumentNumber',
      blockName: 'partner1DocumentNumber',
      blockType: 'text',
      label: 'Socio 1: Número de Documento',
      required: true,
      width: 50,
    },
    {
      name: 'partner1Email',
      blockName: 'partner1Email',
      blockType: 'email',
      label: 'Socio 1: Correo Electrónico',
      required: true,
      width: 50,
    },
    {
      name: 'partner1Phone',
      blockName: 'partner1Phone',
      blockType: 'text',
      label: 'Socio 1: Teléfono',
      required: true,
      width: 50,
    },

    // Socio 2 (siempre presente)
    {
      name: 'partner2FirstName',
      blockName: 'partner2FirstName',
      blockType: 'text',
      label: 'Socio 2: Nombre',
      required: true,
      width: 50,
    },
    {
      name: 'partner2LastName',
      blockName: 'partner2LastName',
      blockType: 'text',
      label: 'Socio 2: Apellidos',
      required: true,
      width: 50,
    },
    {
      name: 'partner2Nationality',
      blockName: 'partner2Nationality',
      blockType: 'select',
      label: 'Socio 2: Nacionalidad',
      required: true,
      options: [
        {
          label: 'Peruano',
          value: 'peruano',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },
    {
      name: 'partner2DocumentType',
      blockName: 'partner2DocumentType',
      blockType: 'select',
      label: 'Socio 2: Tipo de Documento',
      required: true,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'partner2DocumentNumber',
      blockName: 'partner2DocumentNumber',
      blockType: 'text',
      label: 'Socio 2: Número de Documento',
      required: true,
      width: 50,
    },
    {
      name: 'partner2Email',
      blockName: 'partner2Email',
      blockType: 'email',
      label: 'Socio 2: Correo Electrónico',
      required: true,
      width: 50,
    },
    {
      name: 'partner2Phone',
      blockName: 'partner2Phone',
      blockType: 'text',
      label: 'Socio 2: Teléfono',
      required: true,
      width: 50,
    },

    // Socio 3 (condicional)
    {
      name: 'partner3FirstName',
      blockName: 'partner3FirstName',
      blockType: 'text',
      label: 'Socio 3: Nombre',
      required: false,
      width: 50,
    },
    {
      name: 'partner3LastName',
      blockName: 'partner3LastName',
      blockType: 'text',
      label: 'Socio 3: Apellidos',
      required: false,
      width: 50,
    },
    {
      name: 'partner3Nationality',
      blockName: 'partner3Nationality',
      blockType: 'select',
      label: 'Socio 3: Nacionalidad',
      required: false,
      options: [
        {
          label: 'Peruano',
          value: 'peruano',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },
    {
      name: 'partner3DocumentType',
      blockName: 'partner3DocumentType',
      blockType: 'select',
      label: 'Socio 3: Tipo de Documento',
      required: false,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'partner3DocumentNumber',
      blockName: 'partner3DocumentNumber',
      blockType: 'text',
      label: 'Socio 3: Número de Documento',
      required: false,
      width: 50,
    },
    {
      name: 'partner3Email',
      blockName: 'partner3Email',
      blockType: 'email',
      label: 'Socio 3: Correo Electrónico',
      required: false,
      width: 50,
    },
    {
      name: 'partner3Phone',
      blockName: 'partner3Phone',
      blockType: 'text',
      label: 'Socio 3: Teléfono',
      required: false,
      width: 50,
    },

    // Socio 4 (condicional)
    {
      name: 'partner4FirstName',
      blockName: 'partner4FirstName',
      blockType: 'text',
      label: 'Socio 4: Nombre',
      required: false,
      width: 50,
    },
    {
      name: 'partner4LastName',
      blockName: 'partner4LastName',
      blockType: 'text',
      label: 'Socio 4: Apellidos',
      required: false,
      width: 50,
    },
    {
      name: 'partner4Nationality',
      blockName: 'partner4Nationality',
      blockType: 'select',
      label: 'Socio 4: Nacionalidad',
      required: false,
      options: [
        {
          label: 'Peruano',
          value: 'peruano',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },
    {
      name: 'partner4DocumentType',
      blockName: 'partner4DocumentType',
      blockType: 'select',
      label: 'Socio 4: Tipo de Documento',
      required: false,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'partner4DocumentNumber',
      blockName: 'partner4DocumentNumber',
      blockType: 'text',
      label: 'Socio 4: Número de Documento',
      required: false,
      width: 50,
    },
    {
      name: 'partner4Email',
      blockName: 'partner4Email',
      blockType: 'email',
      label: 'Socio 4: Correo Electrónico',
      required: false,
      width: 50,
    },
    {
      name: 'partner4Phone',
      blockName: 'partner4Phone',
      blockType: 'text',
      label: 'Socio 4: Teléfono',
      required: false,
      width: 50,
    },

    // Socio 5 (condicional)
    {
      name: 'partner5FirstName',
      blockName: 'partner5FirstName',
      blockType: 'text',
      label: 'Socio 5: Nombre',
      required: false,
      width: 50,
    },
    {
      name: 'partner5LastName',
      blockName: 'partner5LastName',
      blockType: 'text',
      label: 'Socio 5: Apellidos',
      required: false,
      width: 50,
    },
    {
      name: 'partner5Nationality',
      blockName: 'partner5Nationality',
      blockType: 'select',
      label: 'Socio 5: Nacionalidad',
      required: false,
      options: [
        {
          label: 'Peruano',
          value: 'peruano',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },
    {
      name: 'partner5DocumentType',
      blockName: 'partner5DocumentType',
      blockType: 'select',
      label: 'Socio 5: Tipo de Documento',
      required: false,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'partner5DocumentNumber',
      blockName: 'partner5DocumentNumber',
      blockType: 'text',
      label: 'Socio 5: Número de Documento',
      required: false,
      width: 50,
    },
    {
      name: 'partner5Email',
      blockName: 'partner5Email',
      blockType: 'email',
      label: 'Socio 5: Correo Electrónico',
      required: false,
      width: 50,
    },
    {
      name: 'partner5Phone',
      blockName: 'partner5Phone',
      blockType: 'text',
      label: 'Socio 5: Teléfono',
      required: false,
      width: 50,
    },

    // Paso 6: Selección del CEO
    {
      name: 'ceoSelection',
      blockName: 'ceoSelection',
      blockType: 'select',
      label: 'Selección de CEO',
      required: true,
      width: 100,
    },

    // Campos para nuevo CEO, visibles condicionalmente
    {
      name: 'newCEOFirstName',
      blockName: 'newCEOFirstName',
      blockType: 'text',
      label: 'Nuevo CEO: Nombre',
      required: false,
      width: 50,
    },
    {
      name: 'newCEOLastName',
      blockName: 'newCEOLastName',
      blockType: 'text',
      label: 'Nuevo CEO: Apellidos',
      required: false,
      width: 50,
    },
    {
      name: 'newCEONationality',
      blockName: 'newCEONationality',
      blockType: 'select',
      label: 'Nuevo CEO: Nacionalidad',
      required: false,
      options: [
        {
          label: 'Peruano',
          value: 'peruano',
        },
        {
          label: 'Extranjero',
          value: 'extranjero',
        },
      ],
      width: 100,
    },
    {
      name: 'newCEODocumentType',
      blockName: 'newCEODocumentType',
      blockType: 'select',
      label: 'Nuevo CEO: Tipo de Documento',
      required: false,
      options: [
        {
          label: 'DNI',
          value: 'dni',
        },
        {
          label: 'Carnet de Extranjería',
          value: 'carnet',
        },
        {
          label: 'Pasaporte',
          value: 'pasaporte',
        },
      ],
      width: 50,
    },
    {
      name: 'newCEODocumentNumber',
      blockName: 'newCEODocumentNumber',
      blockType: 'text',
      label: 'Nuevo CEO: Número de Documento',
      required: false,
      width: 50,
    },
    {
      name: 'newCEOEmail',
      blockName: 'newCEOEmail',
      blockType: 'email',
      label: 'Nuevo CEO: Correo Electrónico',
      required: false,
      width: 50,
    },
    {
      name: 'newCEOPhone',
      blockName: 'newCEOPhone',
      blockType: 'text',
      label: 'Nuevo CEO: Teléfono',
      required: false,
      width: 50,
    },

    // Paso 7: Contribuciones de Socios
    {
      name: 'partner1MonetaryContribution',
      blockName: 'partner1MonetaryContribution',
      blockType: 'number',
      label: 'Socio 1: Contribución Monetaria',
      required: true,
      width: 50,
    },
    {
      name: 'partner1Currency',
      blockName: 'partner1Currency',
      blockType: 'select',
      label: 'Socio 1: Moneda',
      required: true,
      options: [
        {
          label: 'Soles (PEN)',
          value: 'pen',
        },
        {
          label: 'Dólares (USD)',
          value: 'usd',
        },
      ],
      width: 50,
    },
    {
      name: 'partner1NonMonetaryDescription',
      blockName: 'partner1NonMonetaryDescription',
      blockType: 'text',
      label: 'Socio 1: Descripción de Contribución No Monetaria',
      required: false,
      width: 50,
    },
    {
      name: 'partner1NonMonetaryValue',
      blockName: 'partner1NonMonetaryValue',
      blockType: 'number',
      label: 'Socio 1: Valor de Contribución No Monetaria',
      required: false,
      width: 25,
    },
    {
      name: 'partner1NonMonetaryCurrency',
      blockName: 'partner1NonMonetaryCurrency',
      blockType: 'select',
      label: 'Socio 1: Moneda de Contribución No Monetaria',
      required: false,
      options: [
        {
          label: 'Soles (PEN)',
          value: 'pen',
        },
        {
          label: 'Dólares (USD)',
          value: 'usd',
        },
      ],
      width: 25,
    },

    // Socio 2 Contribuciones
    {
      name: 'partner2MonetaryContribution',
      blockName: 'partner2MonetaryContribution',
      blockType: 'number',
      label: 'Socio 2: Contribución Monetaria',
      required: true,
      width: 50,
    },
    {
      name: 'partner2Currency',
      blockName: 'partner2Currency',
      blockType: 'select',
      label: 'Socio 2: Moneda',
      required: true,
      options: [
        {
          label: 'Soles (PEN)',
          value: 'pen',
        },
        {
          label: 'Dólares (USD)',
          value: 'usd',
        },
      ],
      width: 50,
    },
    {
      name: 'partner2NonMonetaryDescription',
      blockName: 'partner2NonMonetaryDescription',
      blockType: 'text',
      label: 'Socio 2: Descripción de Contribución No Monetaria',
      required: false,
      width: 50,
    },
    {
      name: 'partner2NonMonetaryValue',
      blockName: 'partner2NonMonetaryValue',
      blockType: 'number',
      label: 'Socio 2: Valor de Contribución No Monetaria',
      required: false,
      width: 25,
    },
    {
      name: 'partner2NonMonetaryCurrency',
      blockName: 'partner2NonMonetaryCurrency',
      blockType: 'select',
      label: 'Socio 2: Moneda de Contribución No Monetaria',
      required: false,
      options: [
        {
          label: 'Soles (PEN)',
          value: 'pen',
        },
        {
          label: 'Dólares (USD)',
          value: 'usd',
        },
      ],
      width: 25,
    },
  ],
  redirect: undefined,
  submitButtonLabel: 'Enviar',
  title: 'Formulario de Registro de Empresa',
  updatedAt: '2023-01-12T21:47:41.374Z',
}
