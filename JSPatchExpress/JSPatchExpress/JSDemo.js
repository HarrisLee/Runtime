defineClass('JPViewController', {
            viewDidLoad:function(){
            self.ORIGviewDidLoad();
            self.view().setBackgroundColor(require('UIColor').redColor());
            },
            handleBtn: function(sender) {
            var tableViewCtrl = JPTableViewController.alloc().init()
            self.navigationController().pushViewController_animated(tableViewCtrl, YES)
            }
            })

//定义一个新的类
defineClass('JPTableViewController : UITableViewController', ['data'], {
            viewDidLoad: function(){
            self.ORIGviewDidLoad();
            var table = require('UITableView').alloc().initWithFrame({x:10,y:69,width:200,height:200});
            table.setBackgroundColor(require('UIColor').redColor());
            table.setDelegate(self);
            table.setDataSource(self);
            self.view().addSubview(table);
            
            var imgView = require('UIImageView').alloc().initWithFrame({x:150,y:69,width:200,height:200});
            self.view().addSubview(imgView);
            imgView.setImage(require('UIImage').imageNamed('aboutIcon'));
            },
            dataa: function() {
            var data = self.data();
            if (data) return data;
            var data = [];
            for (var i = 0; i < 20; i ++) {
            data.push("cell from js " + i);
            }
            self.setData(data)
            return data;
            },
            numberOfSectionsInTableView: function(tableView) {
            return 1;
            },
            tableView_numberOfRowsInSection: function(tableView, section) {
            return self.dataa().length;
            },
            tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
            var cell = tableView.dequeueReusableCellWithIdentifier("cell")
            if (!cell) {
            cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
            }
            cell.textLabel().setText(self.dataa()[indexPath.row()])
            return cell
            },
            tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
            return 60
            },
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            tableView.deselectRowAtIndexPath_animated(indexPath,YES);
            var alertView = require('UIAlertView').alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("Alert",self.dataa()[indexPath.row()], self, "OK",  null);
            alertView.show()
            },
            alertView_willDismissWithButtonIndex: function(alertView, idx) {
            console.log('click btn ' + alertView.buttonTitleAtIndex(idx).toJS())
            }
            })
