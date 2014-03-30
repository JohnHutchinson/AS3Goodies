package com.rubberduckygames.social
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.external.ExternalInterface;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	public class Brag
	{ 		
		private const DEFAULT_REDIRECT_URL:String = "http://www.RubberDuckyGames.com";
		
		public var majorText:String = "";
		public var minorText:String = "";
		public var extraText:String	= "";
		
		private var pageURL:String = "";		// url to HTML page containing SWF file
		private var shortURL:String = null;
		
		public function Brag(defaultURL:String, shortURL:String)
		{
			pageURL = defaultURL;
			this.shortURL = shortURL;
		}
		
		public function bragOnFacebook(appID:String, redirectURL:String = null, picURL:String = ""):void 
		{
			// https://developers.facebook.com/docs/reference/dialogs/feed/
			
			var url:String = "https://www.facebook.com/dialog/feed?" 
				+ "app_id=" + encodeURIComponent(appID)
				+ "&link=" + encodeURIComponent(pageURL)  
				+ "&name=" + encodeURIComponent(majorText) 
				+ "&caption=" + encodeURIComponent(minorText) 
				+ "&description=" + encodeURIComponent(extraText);
			
			// optional
			if (picURL)
				url += "&picture=" + encodeURIComponent(picURL);
			
			// required
			if (redirectURL)
				url += "&redirect_uri=" + encodeURIComponent(redirectURL);
			else
				url += "&redirect_uri=" + encodeURIComponent(DEFAULT_REDIRECT_URL);

			
			navigateToURL(new URLRequest(url), '_blank');
		}
		
		public function bragOnTwitter(via:String = null, hashtags:String = null):void 
		{
			// https://dev.twitter.com/docs/intents#tweet-intent
			
			var url:String = "http://twitter.com/intent/tweet?"
				+ "original_referer=" + encodeURIComponent(pageURL)
				+ "&text=" + encodeURIComponent(majorText) 
				+ "&url=" + encodeURIComponent(shortURL);
			
			if (hashtags)
				url += "&hashtags=" + encodeURIComponent(hashtags);
			
			if (via)
				url += "&via=" + encodeURIComponent(via);
			
			navigateToURL(new URLRequest(url), '_blank');
		}
		
		public function bragOnGooglePlus(via:String = null):void 
		{
		}
	}
}