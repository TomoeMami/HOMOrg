@Builder
export function 设置Builder() {
  设置页面();
}
@Component
export struct 设置页面 {
  @Consume('布局') 布局: NavPathStack;
  build() {
    NavDestination() {
      Column() {
        Text("设置")
      }.width('100%').height('100%')
    }.title("设置")
    .onBackPressed(() => {
      const popDestinationInfo = this.布局.pop(); // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}