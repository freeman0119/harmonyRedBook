import {Discovery} from './Discovery'

@Component
export struct Home {
  @State currentIndex: number = 1
  @Builder TabBarBuilder(title:string, index:number) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex === index ? '#000' : '#666')

      Line()
        .width(30)
        .height(2)
        .borderRadius(2)
        .margin({top: 6})
        .backgroundColor(this.currentIndex === index ? '#F62742' : 'white')
        .strokeLineCap(LineCapStyle.Round)
    }
    .height(46)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Row() {
        Tabs({index: this.currentIndex}) {
          TabContent() {
            Text('关注内容')
          }.tabBar(this.TabBarBuilder('关注', 0))

          TabContent() {
            Discovery()
          }.tabBar(this.TabBarBuilder('发现', 1))

          TabContent() {
            Text('北京内容')
          }.tabBar(this.TabBarBuilder('北京', 2))
        }
        .scrollable(false)
        .barWidth(200)
        .barHeight(46)
        .onChange(index => {
          this.currentIndex = index
        })

        Image($r('app.media.search'))
          .width(20)
          .position({x: '100%', y: 12})
          .translate({x: -40})
      }
      Line()
        .height(1)
        .width('100%')
        .position({x:0,y:45})
        .backgroundColor('#eee')
    }
    .height('100%')
    .width('100%')
  }
}