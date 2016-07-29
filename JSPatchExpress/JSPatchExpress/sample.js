//include('JSDemo.js');
include('person.js');
require('JPEngine').addExtensions(['JPCFunction']);
defineCFunction("malloc", "void *, size_t");
defineCFunction("NSClassFromString", "Class, NSString *");


defineClass('ViewController : UIViewController <UIAlertViewDelegate>' ,{
            viewDidLoad:function(){
            self.ORIGviewDidLoad();
            self.setProp_forKey("JSPatches","data");
            
            dispatch_after(1.0,function(){
                           console.log("dispatch_after is calling");
                           })
            
//            var slf = self;
//            dispatch_after(3,function(){
//                           var tables = JPTableViewController.alloc().init();
//                           slf.navigationController().pushViewController_animated(tables,YES);
//                           })
            
            var redView = require('UIView').alloc().init();
            var color = require('UIColor').redColor();
            redView.setBackgroundColor(color);
            self.view().addSubview(redView);
            
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


defineClass('Person:NSObject<PersonTalk>',{
            sayMessage:function(msgInfo){
            var name = self.name();
            console.log(name.toJS() + "  he say: " + msgInfo);
            return name.toJS() + "  he say: " + msgInfo;
            },
            })