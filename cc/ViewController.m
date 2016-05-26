//
//  ViewController.m
//  cc
//
//  Created by wgw on 16/5/25.
//  Copyright © 2016年 wgw. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"

@interface ViewController ()<UIWebViewDelegate>


@property(nonatomic,strong)UIWebView * web ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL * url = [NSURL URLWithString:@"http://api.967111.com/meeting/stateDetail.do?stateId=337&schoolId=2522"] ;
    NSURLRequest * request = [NSURLRequest requestWithURL:url] ;
    
    
    self.web = [[UIWebView alloc]initWithFrame:self.view.bounds] ;
    [self.web loadRequest:request] ;
    self.web.delegate = self ;
    
    [self.view addSubview:self.web] ;
    
    
    
    //
    NSData * htmlData = [NSData dataWithContentsOfURL:url] ;
    TFHpple * htmls = [[TFHpple alloc]initWithData:htmlData isXML:YES] ;
    
    NSArray * dataArray = [htmls searchWithXPathQuery:@"//img"] ;
    
    
    for (TFHppleElement * element in dataArray) {
        
        
//
        NSLog(@"%@",element.raw) ;
        
        //<div class="col-lg-12 col-md-12 col-xs-12 " id="introduce" style="text-indent:2em;"><p style="text-align:center;">	<img src="http://teacher.967111.com/publicupload/image/20160524/20160524095514_955.jpg" alt="" width="800" height="571" title="" align="" class="carousel-inner img-responsive img-rounded"> </p><p>	<br></p></div>
        
        //<script type="text/javascript">
   

    
        if ([[element objectForKey:@"class"]isEqualToString:@"img-rounded carousel-inner img-responsive img-rounded"]) {
            
            
            NSString *url =   [element.attributes objectForKey:@"src"];
            NSLog(@"%@",url);
            
       

            
            
            
            
      
            

            
        }
    
    }
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"finish") ;
    
    NSString * str = [self.web stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@""]] ;
    
    NSLog(@"%@",str) ;
    
}

@end
