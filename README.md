# NCacheManager.podspec

NCacheManager is pod for cache image video and audio to file system for ios

how to use

pod  NCacheManager , :git => 'https://github.com/destwofe/NCacheManager'

NCachemanager is singleton object but need to setup share applicationGroupIdentifier

first setup use command

[[NCacheManager instance]setApplicationGroupIdentifier:@"com.ny.testCache.share"];

and you can cache file by command

NSData *imageData = [NCacheManager instance]getImageData:@"http://www.google.com/image/a.jpg"];

data will be get from server then cache to you app file system and return data to your instruction. if you have cahce data for url did you want to request you cache manager will return data to you with out connect to server.


/////////////////////////////////////////////////////////////////////////////////////

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick" />
<input type="hidden" name="hosted_button_id" value="9CQFW96YFC7EJ" />
<input type="image" src="https://www.paypal.com/en_GB/i/btn/btn_donate_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate" />