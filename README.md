## 1. Button类

### API

> 可选的按钮属性

    _width: 60, // 按钮宽度
    _height: 30, // 按钮高度
    _text: "发送", // 按钮文字
    _btnBg: 0xF49909, // 按钮背景
    _btnOver: 0xFDAA24, // 按钮鼠标划过背景
    _btnClickDown: 0xFDAA24, // 按钮鼠标按下时背景
    _btnClickUp: 0xFDAA24, // 按钮鼠标按下起来时的背景
    _btnTxtBg: 0xFFFFFF, // 按钮字体颜色
    _btnTxtOver: 0xFFFFFF, // 按钮字体鼠标划过颜色
    _btnTxtClickDown: 0xFFFFFF, // 按钮字体鼠标按下颜色
    _btnTxtClickUp: 0xFFFFFF,  // 按钮字体鼠标抬起颜色
    _fontSize: 12, // 按钮字体大小
    
    _btnBorder: 0, // 按钮的border值
    _btnBorderColor: 0xFFFFFF, // 按钮的border颜色
    _btnBorderRadius: 0 // 按钮是否圆角及圆角大小

> 提供的可用方法
    
    console(obj:Object):void; // 打印出对象中的属性及其值
    extend(des:Object, sor:Object):Object; // 对象合并
    drawBg(color:uint):void; // 传入颜色参数重绘按钮
    drawBtnTxt():void; // 重绘按钮字体
    addBtnEventListener(eventObj:Object):void; //传入的是给按钮绑定的处理事件对象

    // eventObj中有这几种事件, 若需要自定义更多的事件直接修改源码添加即可！
    /*
      MouseOver MouseOut MouseDown MouseUp Click
     */

### USE

    // 先定义好button的样式
    var testBtn:Button = new Button({
        _text: "点击这里",
        _fontSize: 14,
        _btnOver: 0xFF0000,
        _btnTxtOver: 0x333333
    });

    // 再定义好按钮的坐标
    testBtn.x = testBtn.y = 0;

    // 最后给按钮添加自定义的事件
    testBtn.addBtnEventListener({
        click: function(e:MouseEvent):void {
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
