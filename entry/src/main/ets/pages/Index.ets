import { 日程页面 } from './日程';
import { 笔记页面 } from './笔记';
import { 文件页面 } from './文件';
import { 设置页面 } from './设置';
import { SymbolGlyphModifier } from '@kit.ArkUI';
import { contactsGroups,ContactsGroup,Contact } from '../API/日程';
@Entry
@Component
struct 布局信息 {
  @Provide('布局') 布局: NavPathStack = new NavPathStack()
  private arr: number[] = [1, 2, 3];
  @Builder
  页面构建(名称: string) {
    if (名称 === "日程") {
      日程页面();
    } else if (名称 === "笔记") {
      笔记页面();
    } else if (名称 === "文件") {
      文件页面();
    } else if (名称 === "设置") {
      设置页面();
    }
  }
  @Builder itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  build() {
    Column() {
      Navigation(this.布局) {
        List() {
          // 循环渲染ListItemGroup，contactsGroups为多个分组联系人contacts和标题title的数据集合
          ForEach(contactsGroups, (itemGroup: ContactsGroup) => {
            ListItemGroup({ header: this.itemHead(itemGroup.title) }) {
              // 循环渲染ListItem
              if (itemGroup.contacts) {
                ForEach(itemGroup.contacts, (item: Contact) => {
                  ListItem() {
                    Row()
                    {
                      SymbolGlyph(item.icon);
                      Text(item.name)
                    }// ...
                  }
                }, (item: Contact) => JSON.stringify(item))
              }
            }
          }, (itemGroup: ContactsGroup) => JSON.stringify(itemGroup))
        }.sticky(StickyStyle.Header)  // 设置吸顶，实现粘性标题效果
      }
      .title("主标题")
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
      .mode(NavigationMode.Auto)
      .navDestination(this.页面构建)
      .menus([
        {
          value: "",
          symbolIcon: new SymbolGlyphModifier($r('sys.symbol.plus_square')),
          action: () => {
          }
        }
      ])
      .toolbarConfiguration([{
        value: "日程",
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.calendar_badge_clock')),
      }, {
        value: "笔记",
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.list_checkmask'))
      }, {
        value: "文件",
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.doc_plaintext_and_pencil'))
      }, {
        value: "设置",
        symbolIcon: new SymbolGlyphModifier($r('sys.symbol.gearshape'))
      },
      ])
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}


// PageTwo.ets
@Component
export struct pageTwoTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent2")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle2")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}


// PageThree.ets
@Component
export struct pageThreeTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text("NavDestinationContent3")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle3")
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop(); // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}