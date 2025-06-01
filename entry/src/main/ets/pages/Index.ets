@Entry
@Component
struct Index {
  @State 信息: string = 'Hello World';
  @State 旧信息: string = 'Welcome';
  @State 中转信息: string = 'Welcome';
  build() {
    RelativeContainer() {
      Column() {
        Row(){
          Text('第一页')
          Text('第二页').fontColor(Color.Gray)
          Text('第三页').fontColor(Color.Gray)
          Text('第四页').fontColor(Color.Gray)
          Button('󰀠',{type :ButtonType.Normal})
        }.justifyContent(FlexAlign.SpaceAround)
        .width('100%')
        Text(this.信息)
          .id('标题')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick(() => {
            this.中转信息 = this.信息;
            this.信息 = this.旧信息;
            this.旧信息 = this.中转信息;
          })
        Text('登录界面')
          .fontSize(24)
          .fontWeight(700)
        Text('登录账号以使用更多服务')
          .fontColor(Color.Gray)
          .fontSize(14)
    }.justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .width('100%')
    }
  }
}