'use client'
import { Banner } from '@payloadcms/ui/elements/Banner'
import React, { useState } from 'react'

import { SeedButton } from './SeedButton'
import { BusinessFormSeedButton } from './BusinessFormSeedButton'
import { OnboardingSeedButton } from './OnboardingSeedButton'
import FormSubmissionsViewer from '../FormSubmissionsViewer'
import './index.scss'

const baseClass = 'before-dashboard'

const BeforeDashboard: React.FC = () => {
  const [activeTab, setActiveTab] = useState<'welcome' | 'submissions'>('welcome')

  return (
    <div className={baseClass}>
      <Banner className={`${baseClass}__banner`} type="success">
        <h4>Welcome to your dashboard!</h4>
      </Banner>

      <div style={{ marginBottom: '20px', marginTop: '20px' }}>
        <div className="flex border-b border-gray-200">
          <button
            className={`py-2 px-4 font-medium ${
              activeTab === 'welcome'
                ? 'border-b-2 border-indigo-500 text-indigo-600'
                : 'text-gray-500 hover:text-gray-700'
            }`}
            onClick={() => setActiveTab('welcome')}
          >
            Bienvenida
          </button>
          <button
            className={`py-2 px-4 font-medium ${
              activeTab === 'submissions'
                ? 'border-b-2 border-indigo-500 text-indigo-600'
                : 'text-gray-500 hover:text-gray-700'
            }`}
            onClick={() => setActiveTab('submissions')}
          >
            Envíos de Formularios
          </button>
        </div>
      </div>

      {activeTab === 'welcome' && (
        <>
          <div style={{ marginBottom: '20px' }}>
            <h5>Funcionalidades Especiales</h5>
            <ul>
              <li style={{ marginBottom: '10px' }}>
                <BusinessFormSeedButton />
                <span> - Crea solamente el formulario multi-paso para registro de empresas</span>
              </li>
              <li style={{ marginBottom: '10px' }}>
                <OnboardingSeedButton />
                <span>
                  {' '}
                  - Crea una página de onboarding con el formulario de registro y un hero
                </span>
              </li>
            </ul>
          </div>
          <h5>Instrucciones generales:</h5>
          <ul className={`${baseClass}__instructions`}>
            <li>
              <SeedButton />
              {' with a few pages, posts, and projects to jump-start your new site, then '}
              <a href="/" target="_blank">
                visit your website
              </a>
              {' to see the results.'}
            </li>
            <li>
              If you created this repo using Payload Cloud, head over to GitHub and clone it to your
              local machine. It will be under the <i>GitHub Scope</i> that you selected when
              creating this project.
            </li>
            <li>
              {'Modify your '}
              <a
                href="https://payloadcms.com/docs/configuration/collections"
                rel="noopener noreferrer"
                target="_blank"
              >
                collections
              </a>
              {' and add more '}
              <a
                href="https://payloadcms.com/docs/fields/overview"
                rel="noopener noreferrer"
                target="_blank"
              >
                fields
              </a>
              {' as needed. If you are new to Payload, we also recommend you check out the '}
              <a
                href="https://payloadcms.com/docs/getting-started/what-is-payload"
                rel="noopener noreferrer"
                target="_blank"
              >
                Getting Started
              </a>
              {' docs.'}
            </li>
            <li>
              Commit and push your changes to the repository to trigger a redeployment of your
              project.
            </li>
          </ul>
          {'Pro Tip: This block is a '}
          <a
            href="https://payloadcms.com/docs/admin/custom-components/overview#base-component-overrides"
            rel="noopener noreferrer"
            target="_blank"
          >
            custom component
          </a>
          , you can remove it at any time by updating your <strong>payload.config</strong>.
        </>
      )}

      {activeTab === 'submissions' && <FormSubmissionsViewer />}
    </div>
  )
}

export default BeforeDashboard
