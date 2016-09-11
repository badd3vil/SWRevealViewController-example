//
//  FrontViewController.m
//  swr
//
//  Created by Yuriy Paterega on 13.08.15.
//  Copyright (c) 2015 Yuriy Paterega. All rights reserved.
//

#import "FrontViewController.h"
#import "SWRevealViewController.h"

@interface FrontViewController () 
{
    NSURLConnection *shortenURLConnection;
    NSMutableData *shortURLData;
 
}
@end

@implementation FrontViewController

- (void)viewDidLoad {
    
    self.title = NSLocalizedString(@"Browser", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    //Add an image to your project & set that image here.
    UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"]style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)loadLocation:(id)sender
{


    NSString *urlText = self.urlField.text;
    

    if (![urlText hasPrefix:@"http:"] && ![urlText hasPrefix:@"https:"])
    {
        if (![urlText hasPrefix:@"//"])
            urlText = [@"//" stringByAppendingString:urlText];
        urlText = [@"http:" stringByAppendingString:urlText];
    }
    
    // Create an URL object from the address the user typed in
    NSURL *url = [NSURL URLWithString:urlText];
    
    // Construct an URL request from that URL and tell the web view to load the page
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}



- (IBAction)clipboardURL:(id)sender
{
  
    // Get the shortened URL, turn it into an URL object
    NSString *shortURLString = self.shortLabel.title;
    NSURL *shortURL = [NSURL URLWithString:shortURLString];
    
    // Transfer the value of the URL to the pasteboard (aka clipboard)
    [[UIPasteboard generalPasteboard] setURL:shortURL];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.shortenButton.enabled = NO;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.shortenButton.enabled = YES;
    self.urlField.text = webView.request.URL.absoluteString;
}


//Error for no network

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSString *message = [NSString stringWithFormat:
                         @"A problem occurred trying to load this page: %@",
                         error.localizedDescription];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not load URL"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"That's Sad"
                                          otherButtonTitles:nil];
    [alert show];
}


//ShortenUrl
- (IBAction)shortenURL:(id)sender
{

    NSString *urlToShorten = self.webView.request.URL.absoluteString;
    NSString *urlString = [NSString stringWithFormat:@"http://to.ly/api.php?longurl=%@",
                           [urlToShorten stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    // Clear the response buffer
    shortURLData = [NSMutableData new];
    
    // Turn the request string into an URL object, use the URL object to create a request object, and then
    //	start an NSURLConnection using that request.
    // When -connectionWithRequest:delegate: returns, an HTTP request to the URL shortening service
    //	has already started. The object in the delegate parameter will receive messages as the
    //	response is collected.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    shortenURLConnection = [NSURLConnection connectionWithRequest:request
                                                         delegate:self];
    
    // "Debounce" the shorten URL button by disabling it as soon as a request is started.
    // This prevents the user from accidentially starting several requests simultaniously.
    self.shortenButton.enabled = NO;
}



#pragma mark <NSURLConnectionDataDelegate>

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{

    
    [shortURLData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
 
    // Convert the raw bytes received from the web server into a string object
    NSString *shortURLString = [[NSString alloc] initWithData:shortURLData encoding:NSUTF8StringEncoding];
    
    // Show the results in the bottom toolbar
    self.shortLabel.title = shortURLString;
    // Enable the copy to clipboard button
    self.clipboardButton.enabled = YES;
}

- (void)connection:(NSURLConnection *)connection
didFailWithError:(NSError *)error
{
    self.shortLabel.title = @"failed";
    self.clipboardButton.enabled = NO;
    self.shortenButton.enabled = YES;
}




@end
