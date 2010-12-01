package api.browser.notifiers
{
	import api.browser.Browser;

	import api.events.browser.notifiers.OnProgressEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onProgress.html Northcode Help Documentation
	*/
	public class OnProgress extends Browser
	{
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bytesLoaded:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bytesTotal:Number = 0;
		
		/**
		* Constructor for Browser.OnProgress()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Browser_onProgress.html Northcode Help Documentation
		*/
		public function OnProgress(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Browser.setNotify( {event:Browser.ON_PROGRESS} , {callback:actionComplete, errorSTR:"onProgressError", code:"10033"} );
		}
	}
}