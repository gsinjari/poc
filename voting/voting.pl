#!/usr/bin/perl
# license           : MIT


use IO::Socket;

print "\n/---------------------------------------------------------------------\n";
print "Mass Voting using proxy         v.1.0         Date: 2007-01-10\n";
print "By: Govand Sinjari
print "usage           : autovote.pl Proxy# Proxyfile\n";
print "Proxyfile should contain lines in this format 192.168.191.49:80";
print "----------------------------------------------------------------------/\n";

my @ipp = ();
my $d =0;
my $z =0;
my $fileproxy = @ARGV[1];
open (CHECKBOOK, $fileproxy);
while ($record = <CHECKBOOK>) {
$ipp[$a] = $record;
print $a."--".$ipp[$a];
++$a;
}
close(CHECKBOOK);
print "\nLoaded proxies # :".--$a."\n\n";

# Specify the URL of the page to post to.
my $URLtoPostTo = "http://www.govand.info/vote.asp";

my $c = @ARGV[0];
my $ccc ;

# Specify the information to post, the form field name on
#   the left of the => symbol and the value on the right.
my %Fields = (
   "Vote" => "3",
   "submit" => "Submit",
   "ref" => "http://www.govand.info/",
);

my $BrowserName = "Mozella";
use strict;

# Modules with routines for making the browser.
use LWP::UserAgent;
use HTTP::Request::Common;

# Create the browser that will post the information.
my $Browser = new LWP::UserAgent;

# Insert the browser name, if specified.
if($BrowserName) { $Browser->agent($BrowserName); }

 $Browser->timeout(15);
 for ($b=0;$b<1000;$b++){
 for ($c;$c<$a;$c++){
 print "\n".$b."-".$a."-".$c." : Use IP: ".$ipp[$c];
 $ccc = "http://".$ipp[$c];

# Post the information to the CGI program.
$Browser->proxy(['http'], $ccc);
my $Page = $Browser->request(POST $URLtoPostTo,\%Fields);

# Print the returned page (or an error message).
print "Content-type: text/html\n";
if ($Page->is_success) { print $Page->content; }
else { print $Page->message; }

print "\n";

for ($z=0;$z<10000;$z++){  }   # loop
              }
    $c = @ARGV[0];
}
