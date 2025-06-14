import { util } from '@kit.ArkTS'
export class Contact {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;


  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}
export class ContactsGroup {
  title: string = ''
  contacts: Array<object> | null = null
  key: string = ""
}
export let contactsGroups: object[] = [
  {
    title: '2025年6月14日',
    contacts: [
      new Contact('艾佳', $r('sys.symbol.person')),
      new Contact('安安', $r('sys.symbol.person')),
      new Contact('Angela', $r('sys.symbol.person')),
    ],
    key: util.generateRandomUUID(true)
  } as ContactsGroup,
  {
    title: '2025年6月15日',
    contacts: [
      new Contact('白叶', $r('sys.symbol.person')),
      new Contact('伯明', $r('sys.symbol.person')),
    ],
    key: util.generateRandomUUID(true)
  } as ContactsGroup,
// ...
]
