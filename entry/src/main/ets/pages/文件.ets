@Builder
export function 文件Builder() {
  文件页面();
}
@Component
export struct 文件页面 {
  @Consume('布局') 布局: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text("文件")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle1")
    .onBackPressed(() => {
      const popDestinationInfo = this.布局.pop(); // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}