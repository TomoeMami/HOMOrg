@Builder
export function 笔记Builder() {
  笔记页面();
}

@Component
export struct 笔记页面 {
  @Consume('布局') 布局: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text("笔记")
      }.width('100%').height('100%')
    }.title("NavDestinationTitle1")
    .onBackPressed(() => {
      const popDestinationInfo = this.布局.pop(); // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo));
      return true;
    })
  }
}