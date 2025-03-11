import { Checkbox } from './Checkbox'
import { Country } from './Country'
import { Email } from './Email'
import { Message } from './Message'
import { Number } from './Number'
import { Select } from './Select'
import { State } from './State'
import { Text } from './Text'
import { Textarea } from './Textarea'
import { PartnersStep } from './PartnerFields'
import { CEOSelection } from './CEOSelection'

export const fields = {
  text: Text,
  textarea: Textarea,
  select: Select,
  email: Email,
  state: State,
  country: Country,
  checkbox: Checkbox,
  number: Number,
  message: Message,
  partnersStep: PartnersStep,
  ceoSelection: CEOSelection,
}
