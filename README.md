## 1. Button类

### API

> 可选的按钮属性

    width: 60, // 按钮宽度
    height: 30, // 按钮高度
    text: "发送", // 按钮文字
    bgColor: 0xF49909, // 按钮背景
    overColor: 0xFDAA24, // 按钮鼠标划过背景
    clickDownColor: 0xFDAA24, // 按钮鼠标按下时背景
    txtColor: 0xFFFFFF, // 按钮字体颜色
    txtOverColor: 0xFFFFFF, // 按钮字体鼠标划过颜色
    txtClickDownColor: 0xFFFFFF, // 按钮字体鼠标按下颜色
    txtFontSize: 12, // 按钮字体大小
    
    border: 0, // 按钮的border值
    borderColor: 0xFFFFFF, // 按钮的border颜色
    borderRadius: 0 // 按钮是否圆角及圆角大小

> 提供的可用方法
    
    console(obj:Object):void; // 打印出对象中的属性及其值
    extend(des:Object, sor:Object):Object; // 对象合并
    addBtnEventListener(eventObj:Object):void; //传入的是给按钮绑定的处理事件对象

    // eventObj中有这几种事件, 若需要自定义更多的事件直接修改源码添加即可！
    /*
      MouseOver MouseOut MouseDown MouseUp Click
     */

### USE

    // 先定义好button的样式
    var testBtn:Button = new Button({
        text: "点击这里",
        txtFontSize: 14,
        overColor: 0xFF0000,
        txtOverColor: 0x333333
    });

    // 再定义好按钮的坐标
    testBtn.x = testBtn.y = 0;

    // 最后给按钮添加自定义的事件
    testBtn.addBtnEventListener({
        Click: function(e:MouseEvent):void {
            trace("hello world!");
        },
        MouseOver: function(e:MouseEvent):void {
            trace("mouse over!")
        },
        MouseOut: function(e:MouseEvent):void {
            trace("mouse out!")
        },
        MouseDown: function(e:MouseEvent):void {
            trace("mouse down!")
        },
        MouseUp: function(e:MouseEvent):void {
            trace("mouse up!")
        }
    });

## Version 0.1

## About me

[http://poised-flw.com](http://poised-flw.com)
