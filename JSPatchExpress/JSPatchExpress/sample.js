//需要使用到其他位置的JS文件。  则需要用到include,路径为main.js的相对路径 include('controllers/JPViewController.js');
include('person.js');
require('JPEngine').addExtensions(['JPCFunction']);
require('JPEngine').addExtensions(['JPCoreGraphics']);
//require('JPEngine').addExtensions(['JPCustomerStruct']);

//定义C函数。  否则是无法使用的。   第一个参数为函数名称   第二个为  返回类型，参数类型的组合。
defineCFunction("malloc", "void *, size_t");
defineCFunction("NSClassFromString", "Class, NSString *");
defineCFunction("showHello","void *, NSString *");

//需要修复的类的名称   参数依次为  类名，成员变量，实例方法，类方法
defineClass('ViewController : UIViewController <UIAlertViewDelegate>' ,{
            viewDidLoad:function(){  //重写的实例方法
            //这个方法为执行原来的viewDidLoad方法。
            self.ORIGviewDidLoad();
            
            //设置动态属性变量的值
            self.setProp_forKey("JSPatches","data");
            
//            require('JPEngine').defineStruct({
//            "name":"JSPDemo","types":"Fl","keys":["Js","Demo"]
//            });
//            
//            var ssView = self.view().viewWithTag(1000);
//            ssView.setBackgroundColor(require('UIColor').redColor());
            
            

            var str = self.passS({Jsp:1.0,Demo:10});
            
            console.log(str.Jsp + " HaHa " + str.Demo);
            
            
            //C函数的调用
            showHello("111111 hello");
            
            //gcd的dispatch_after的使用
            dispatch_after(1.0,function(){
                           console.log("dispatch_after is calling");
                           })
            
//            var slf = self;
//            dispatch_after(3,function(){
//                           var tables = JPTableViewController.alloc().init();
//                           slf.navigationController().pushViewController_animated(tables,YES);
//                           })
            
            //使用 Objective-C中的对象类型  需要先通过require声明
            var redView = require('UIView').alloc().init();
            var color = require('UIColor').redColor();
            redView.setBackgroundColor(color);
            self.view().addSubview(redView);
            
            //weak的使用。  以及masonry的使用
            var weakSelf = __weak(self);
            redView.mas__makeConstraints(block("MASConstraintMaker *",function(make){
                                                   make.left().equalTo()(weakSelf.view().mas__left()).offset()(100);
                                                   make.top().equalTo()(weakSelf.view().mas__top()).offset()(100);
                                                   make.width().height().equalTo()(100);
                                                   }));
            
            
            malloc(100);
            var value = NSClassFromString("ViewController");
            console.log();
            },
    touchesBegan_withEvent:function(touches,event) {
            self.setProp_forKey("JSPatches1","data");
            var data = self.getProp("data");
            
            //设置全局变量的值
            self.setValue_forKey(["s","a","c"],"dataArray");
            
            self.ORIGtouchesBegan_withEvent(touches,event);
            
        var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",data, self, null,"OK","Cancle","Hello",null);
        alertView.show();
    },
    alertView_clickedButtonAtIndex:function(alertView,idx){
        require('UIView,UIColor');
        console.log('clicksss btn ' + alertView.buttonTitleAtIndex(idx).toJS());
        var infoView = UIView.alloc().initWithFrame({x:10,y:69,width:100,height:100});
        var red = UIColor.redColor();
        infoView.setBackgroundColor(red);
        self.view().addSubview(infoView);
    },
    alertView_willDismissWithButtonIndex: function(alertView, idx) {
        require('UIView,UIColor');
        console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS());
        var infoView = UIView.alloc().initWithFrame({x:10,y:69,width:100,height:100});
        var red = UIColor.redColor();
        infoView.setBackgroundColor(red);
        self.view().addSubview(infoView);
    }
})


//为Person添加一个协议，并为Person添加方法实现。  这样可以保证不崩溃
defineClass('Person:NSObject<PersonTalk>',{
            sayMessage:function(msgInfo){
            var name = self.name();
            console.log(name.toJS() + "  he say: " + msgInfo);
            return name.toJS() + "  he say: " + msgInfo;
            },
            })
