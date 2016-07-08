/*
 Demo.js
 JSPatchExpress
 
 Created by JianRongCao on 6/30/16.
 Copyright © 2016 JianRongCao. All rights reserved.
 */

var dataArray = ["JS","Patch"];
var _shareInstance;
defineJSClass('JPObject',{
              init:function(){
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
            
            var jpo = require('JPSonObject').shareInstance();
            console.log('111111' + jpo.baseData1);
            
            
            var array = new Array();
            array.push("Object");
            console.log(array,dataArray[1]);
            
            var datas = require('ViewController').dataMutableArray().toJS();
            //data instanceof Array === true
            var newArray = new Array();
            newArray[0] = "Patch";
            newArray[1] = "Patch1";
            newArray[2] = "Patch2";
            newArray[3] = "Patch3";
            
            datas.push(newArray);
            console.log(datas);
            var dict = ViewController.dict();
            var obj = newArray.join('_');
            dict.setObject_forKey(obj, 'name');
            dict = dict.toJS();
            console.log(dict['name']);
            
            ViewController.showAppName(block("NSString *,NSString *",function(name,version) {
                                             console.log('Show Name:'+ name.toJS() +' Ver:'+ version.toJS());
                                             }));
            self.ORIGtapMe(sender);

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
            showAppName:function(blk) {
                 var name = "Method Class";
                 var vers = "2.3.0";
//                 blk(name,vers);
            }
            }
            )