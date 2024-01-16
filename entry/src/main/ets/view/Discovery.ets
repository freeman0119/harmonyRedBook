import {DEFAULT_CATEGORY_LIST, ICategory} from '../store/homeStore'

@Component
export struct Discovery {
  @State scroll:boolean = true
  @State currentIndex:number = 0
  @State myChannel:ICategory[] = DEFAULT_CATEGORY_LIST.filter(item => item.isAdd)
  @State otherChannel:ICategory[] = DEFAULT_CATEGORY_LIST.filter(item => !item.isAdd)

  @Builder TabBarBuilder(title, index) {
    Text(title)
      .padding({left:10,right: 10})
      .fontColor(this.currentIndex === index ? 'red' : '#666')
      .onClick(() => {
        this.currentIndex = index
      })
  }

  build() {
    Column() {
        Tabs({index: this.currentIndex}) {
          ForEach(this.myChannel, (item:ICategory, index: number) => {
            TabContent() {
              Text(item.name + this.scroll.toString())
            }
            .tabBar(this.TabBarBuilder(item.name, index))
          })
        }
        .barMode(BarMode.Scrollable)
        .scrollable(this.scroll)
        .onChange(index => {
          this.currentIndex = index
        })
    }
    .height('100%')
    .width('100%')

  }
}
