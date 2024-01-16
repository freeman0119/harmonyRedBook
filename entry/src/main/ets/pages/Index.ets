import {Home} from '../view/Home'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  @Builder TabBarBuilder (title: string, index: number){
    Column() {
      if (index === 2) {
        Image($r('app.media.tabbar'))
          .width(46)
      } else {
        Text(title)
          .fontColor(this.currentIndex === index ? '#000' : '#666')
          .fontWeight(this.currentIndex === index ? FontWeight.Bold : FontWeight.Normal)
          .fontSize(this.currentIndex === index ? 18 : 16)
      }

    }
  }
  build() {
    Column() {
      Tabs({barPosition: BarPosition.End}) {
        TabContent() {
          Home()
        }.tabBar(this.TabBarBuilder('首页', 0))

        TabContent() {
          Text('购物内容')
        }.tabBar(this.TabBarBuilder('购物',1))

        TabContent() {
          Text('+内容')
        }.tabBar(this.TabBarBuilder('+', 2))

        TabContent() {
          Text('消息内容')
        }.tabBar(this.TabBarBuilder('消息', 3))

        TabContent() {
          Text('我的内容')
        }.tabBar(this.TabBarBuilder('我', 4))
      }
      .scrollable(false)
      .onChange(index => {
        this.currentIndex = index
      })
    }
    .height('100%')
    .width('100%')
  }
}