/*
 Demo.js
 JSPatchExpress
 
 Created by JianRongCao on 6/30/16.
 Copyright © 2016 JianRongCao. All rights reserved.
 */

var dataArray = ["JS","Patch"];
var _shareInstance;
//当我们定义Model的时候， 可以使用DefineJSClass来实现。  而不使用defineClass。  这可以提升性能
defineJSClass('JPObject',{
              init:function(){
              //可以在这里添加任意的属性以及方法
              this.baseData = new Array(1,2,3);
              console.log('base ========== ' + this.baseData);
              return this;
              }
              }
)

defineJSClass('JPSonObject : JPObject',{
              init:function(){
              this.super().init();
              this.baseData1 = this.super().baseData.concat(['Y','l','g']);
              return this;
              }
              },
              {
              shareInstance:function(){
              if(!_shareInstance){
              _shareInstance = JPSonObject.alloc().init();
              }
              return _shareInstance;
              }
              })

defineClass('ViewController' ,{
            tapMe:function(sender){
            var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert","Touch Express", self, null,"OK","Cancle","Hello",null);
            alertView.show();
            
            //调用JSSonObject的实例化方法
            var jpo = require('JPSonObject').shareInstance();
            console.log('111111' + jpo.baseData1);
            
            
            var array = new Array();
            array.push("Object");
            console.log(array,dataArray[1]);
            
            //将程序里面的NSMutableArray 转换成JS里面的数组，因为两者的数组不通用
            var datas = require('ViewController').dataMutableArray().toJS();
            //data instanceof Array === true
            var newArray = new Array();
            newArray[0] = "Patch";
            newArray[1] = "Patch1";
            newArray[2] = "Patch2";
            newArray[3] = "Patch3";
            
            //向数组的末尾添加一个或多个元素，并返回新的长度。
            datas.push("Patch5");
            
            
            self.setAse(newArray);
            var ase = self.ase().toJS();
            ase.push("JSPatch");
            
            
            self.showArray(ase);
            
            console.log(datas);
            var dict = ViewController.dict();
            var obj = newArray.join('_');
            //向字典里面添加数据
            dict.setObject_forKey(obj, 'name');
            //转换成JS的字典。 否则无法使用dict['name']的格式， 只能使用dict.objectForKey('name')
            dict = dict.toJS();
            console.log(dict['name']);
            
            //以block作为参数的使用方法  使用时 需要用 block() 处理一下
            ViewController.showAppName(block("NSString *,NSString *",function(name,version) {
                                             console.log('Show Name:'+ name.toJS() +' Ver:'+ version.toJS());
                                             }));
//            self.ORIGtapMe(sender);

//            var blk = ViewController.showGoodName();
//            blk("JSPatch");
            
            },
            dataAtIndex:function(idx){
            return idx < dataArray.length ? data[idx] : "";
            }
            },
            {
            showGoodName:function(){
                console.log('lo00000000000000g');
            },
            //以block作为参数的使用
            showAppName:function(blk) {
                 var name = "Method Class";
                 var vers = "2.3.0";
//                 blk(name,vers);
            }
            }
            )